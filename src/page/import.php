<?php

include '../classes/ParseBook.php';

error_reporting(E_ERROR | E_PARSE);

$parseBook = new ParseBook();
$parseBook->addToDB();

header('Location: /');
exit();