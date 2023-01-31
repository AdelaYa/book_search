<?php

include '../classes/Database.php';

$database = new Database();
?>


<?php foreach ($database->getBooksByParams($_GET) as $book): ?>
    <li>
        <table class="books">
            <tr>
                <td>
                    <img src=https://www.litmir.club<?= $book['image']; ?>>
                </td>
                <td class="desc">
                    <p class="book-name"><?= $book['name']; ?></p>
                    <p class="book-author">Автор:
                        <?php foreach ($database->getAuthorsByBook($book['id']) as $author) : ?>
                            <?= $author['fio']; ?>,
                        <?php endforeach; ?>
                    </p>
                    <p class="book-genre">Жанр:
                        <?php foreach ($database->getGenresByBook($book['id']) as $genre) : ?>
                            <?= $genre['name']; ?>,
                        <?php endforeach; ?>
                    </p>
                    <p class="book-description"><?= $book['description']; ?></p>
                </td>
            </tr>
        </table>
    </li>
<?php endforeach; ?>
