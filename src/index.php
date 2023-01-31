<?php
include 'classes/Database.php';

$database = new Database();

$searchParam = $_GET['search'] ?? '';
$genresParam = $_GET['genres'] ?? [];
$authorsParam = $_GET['authors'] ?? [];

?>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel='stylesheet' href='css/style.css?v=<?= rand(1, 99999999999) ?>'/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<head>
    <title>Litmir</title>
</head>
<body>
<form method="get" class="ajax_form">
    <input type="text" name="search" placeholder="Название книги" value="<?= $searchParam; ?>">
    <button type="submit"></button>
    <br>

    <table class="block-spoiler">
        <tr>
            <td>
                <div class="spoiler-tittle blue">Выбрать жанр</div>
                <div class="spoiler-text">
                    <?php foreach ($database->getTableGenres() as $genre): ?>
                        <?php
                        $genreChecked = '';
                        if (in_array($genre['id'], $genresParam)) {
                            $genreChecked = 'checked';
                        }
                        ?>
                        <input type="checkbox" class='checkbox' id="genre_<?= $genre['id']; ?>" name="genres[]"
                               value=<?= $genre['id']; ?> <?= $genreChecked ?>>
                        <label for="genre_<?= $genre['id']; ?>"><?= $genre['name']; ?></label><br>
                    <?php endforeach; ?>
                </div>
            </td>
            <td>
                <div class="spoiler-tittle blue">Выбрать автора</div>
                <div class="spoiler-text">
                    <?php foreach ($database->getTableAuthors() as $author): ?>
                        <?php
                        $authorChecked = '';
                        if (in_array($author['id'], $authorsParam)) {
                            $authorChecked = 'checked';
                        }
                        ?>
                        <input type="checkbox" class='checkbox' id="author_<?= $author['id']; ?>" name="authors[]"
                               value=<?= $author['id']; ?> <?= $authorChecked ?>>
                        <label for="author_<?= $author['id']; ?>"><?= $author['fio']; ?></label><br>
                    <?php endforeach; ?>
                </div>
            </td>
        </tr>
    </table>
</form>

<div class="books">
    <ul class="ajax_content_html">
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
    </ul>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('.spoiler-tittle').click(function (e) {
            e.preventDefault();
            $(this).parent().children('div.spoiler-text').toggle('normal');
        });

        $('.ajax_form').on('submit', function (e) {
            e.preventDefault();

            $.ajax({
                type: "GET",
                url: "page/books-ajax.php",
                data: $(this).serialize(),
                success: function (data) {
                    $('.ajax_content_html').html(data);
                }
            });
        });
        $('.checkbox').on('click', function () {
            $.ajax({
                type: "GET",
                url: "page/books-ajax.php",
                data: $('.ajax_form').serialize(),
                success: function (data) {
                    $('.ajax_content_html').html(data);
                }
            });
        });

        $("input").blur(function () {
            $.ajax({
                type: "GET",
                url: "page/books-ajax.php",
                data: $('.ajax_form').serialize(),
                success: function (data) {
                    $('.ajax_content_html').html(data);
                }
            });
        });
    });
</script>
</body>




