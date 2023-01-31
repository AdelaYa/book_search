<?php

include 'DbConnect.php';

class Database
{
    public function getTableAuthors(): array
    {
        $stmt = DbConnect::getConnect()->prepare("SELECT * FROM authors");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function getTableGenres(): array
    {
        $stmt = DbConnect::getConnect()->prepare("SELECT * FROM genres");
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function getGenresByBook(int $bookId): array
    {
        $stmt = DbConnect::getConnect()->prepare("
        SELECT g.* 
        FROM genres g
        JOIN book_to_genre btg ON btg.genre_id = g.id
        WHERE btg.book_id = :book_id");

        $stmt->execute(['book_id' => $bookId]);
        return $stmt->fetchAll();
    }

    public function getAuthorsByBook(int $bookId): array
    {
        $stmt = DbConnect::getConnect()->prepare("
        SELECT a.* 
        FROM authors a
        JOIN book_to_author bta ON bta.author_id = a.id
        WHERE bta.book_id = :book_id");

        $stmt->execute(['book_id' => $bookId]);
        return $stmt->fetchAll();
    }

    public function getBooksByParams($getParams): array
    {
        $searchParam = $getParams['search'] ?? '';
        $genresParam = $getParams['genres'] ?? [];
        $authorsParam = $getParams['authors'] ?? [];

        $sqlWhere = '';
        $where = [];
        $whereParams = [];

        if ($searchParam) {
            $where[] = "books.name LIKE :name";
            $whereParams['name'] = "%$searchParam%";
        }

        if ($genresParam) {
            $inGenresParamPlaceholders = [];
            foreach ($genresParam as $k => $value) {
                $inGenresParamPlaceholders[] = ':genres_' . $k;
                $whereParams[':genres_' . $k] = $value;
            }
            $where[] = "genres.id IN (" . implode(',', $inGenresParamPlaceholders) . ")";
        }

        if ($authorsParam) {
            $inAuthorsParamPlaceholders = [];
            foreach ($authorsParam as $k => $value) {
                $inAuthorsParamPlaceholders[] = ':authors_' . $k;
                $whereParams[':authors_' . $k] = $value;
            }
            $where[] = "authors.id IN (" . implode(',', $inAuthorsParamPlaceholders) . ")";
        }

        if ($where) {
            $sqlWhere = 'WHERE ' . implode(' AND ', $where);
        }

        $sql = "SELECT books.* FROM books
        JOIN book_to_author ON book_to_author.book_id = books.id
        JOIN book_to_genre ON book_to_genre.book_id = books.id
        JOIN authors ON authors.id = book_to_author.author_id
        JOIN genres ON genres.id = book_to_genre.genre_id
        $sqlWhere 
        GROUP BY books.id";

        $stmt = DbConnect::getConnect()->prepare($sql);

        $stmt->execute($whereParams);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}