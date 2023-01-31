<?php

include 'DbConnect.php';

class ParseBook
{
    public function getContentHtml(): string
    {
        $url = 'https://www.litmir.club';

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);

        $out = curl_exec($ch);

        curl_close($ch);

        return $out;
    }

    public function getContentData(): array
    {
        $dom = new DOMDocument();
        $dom->preserveWhiteSpace = false;
        $dom->loadHTML($this->getContentHtml());

        $xpath = new DOMXpath($dom);
        $tables = $xpath->query("//table[contains(@class,'island')]");

        $contentData = [];

        foreach ($tables as $table) {
            $tagTd = $table->getElementsByTagName('td');

            $data = [
                'name' => '',
                'author' => '',
                'genre' => '',
                'description' => [],
                'image' => '',
            ];

            foreach ($tagTd as $td) {
                $tagSpan = $td->getElementsByTagName('span');
                foreach ($tagSpan as $span) {
                    if ($span->hasAttribute('itemprop')) {
                        $itemprop = $span->getAttribute('itemprop');
                        if ($itemprop === 'name') {
                            $data['name'] = $span->nodeValue;
                        } elseif ($itemprop === 'author') {
                            $data['author'] = $span->nodeValue;
                        } elseif ($itemprop === 'genre') {
                            $data['genre'] = $span->nodeValue;
                        }
                    }
                }

                $tagImg = $td->getElementsByTagName('img');
                foreach ($tagImg as $img) {
                    if ($img->hasAttribute('data-src')) {
                        if ($img->getAttribute('class') === 'lt32 lazy') {
                            $data['image'] = $img->getAttribute('data-src');
                        }
                    }
                }

                $tagP = $td->getElementsByTagName('p');
                foreach ($tagP as $description) {
                    $descriptionTrim = trim($description->nodeValue);
                    $descriptionTrim = str_replace(" ", '', $descriptionTrim);

                    if (!empty($descriptionTrim)) {
                        $data['description'][] = $descriptionTrim;
                    }
                }
            }

            $contentData[] = $data;
        }

        return $contentData;
    }

    public function selectAuthor($data): ?int {
        $stmt = DbConnect::getConnect()->prepare("SELECT id FROM authors WHERE fio = :fio");
        $stmt->execute(['fio' => $data]);
        return $stmt->fetchColumn();
    }

    public function selectGenre($genre): ?int {
        $stmt = DbConnect::getConnect()->prepare("SELECT id FROM genres WHERE name = :name");
        $stmt->execute(['name' => $genre]);
        return $stmt->fetchColumn();
    }

    public function addToDB(): void {
        $dbConnect = DbConnect::getConnect();

        $dbConnect->exec('TRUNCATE TABLE book_to_genre;');
        $dbConnect->exec('TRUNCATE TABLE book_to_author;');
        $dbConnect->exec('TRUNCATE TABLE books;');
        $dbConnect->exec('TRUNCATE TABLE genres;');
        $dbConnect->exec('TRUNCATE TABLE authors;');

        $contentData = $this->getContentData();
        foreach ($contentData as $data) {
            $data['author'] = trim($data['author']);

            $dataBooks = [
                'name' => $data['name'],
                'image' => $data['image'],
                'description' => implode("\n", $data['description']),
            ];

            $dataAuthors = [
                'fio' => $data['author']
            ];

            $sql = "INSERT INTO books (name, description, image) VALUES(:name, :description, :image)";
            $stmt= $dbConnect->prepare($sql);
            $stmt->execute($dataBooks);

            $stmt = $dbConnect->prepare("SELECT id FROM books WHERE name = :name");
            $stmt->execute(['name' => $data['name']]);
            $bookId = $stmt->fetchColumn();

            // authors add
            $authorId = $this->selectAuthor($data['author']);

            if (!$authorId) {
                $sql = "INSERT INTO authors (fio) VALUES(:fio)";
                $stmt= $dbConnect->prepare($sql);
                $stmt->execute($dataAuthors);

                $authorId = $this->selectAuthor($data['author']);
            }

            $sql = "INSERT INTO book_to_author (book_id, author_id) VALUES(:book_id, :author_id)";
            $stmt= $dbConnect->prepare($sql);
            $stmt->execute([
                'book_id' => $bookId,
                'author_id' => $authorId,
            ]);

            // genres add
            foreach (explode(',', $data['genre']) as $genre) {
                $genre = trim($genre);
                $genreId = $this->selectGenre($genre);

                if (!$genreId) {
                    $sql = "INSERT INTO genres (name) VALUES(:name)";
                    $stmt= $dbConnect->prepare($sql);
                    $stmt->execute(['name' => $genre]);

                    $genreId = $this->selectGenre($genre);
                }

                $sql = "INSERT INTO book_to_genre (book_id, genre_id) VALUES(:book_id, :genre_id)";
                $stmt= $dbConnect->prepare($sql);
                $stmt->execute([
                    'book_id' => $bookId,
                    'genre_id' => $genreId,
                ]);
            }
        }
    }
}