<?php

class DbConnect
{
    private static ?PDO $dbConn = null;

    public static function getConnect(): PDO
    {
        if (!self::$dbConn) {
            try {
                $host = 'db';
                $dbname = 'database';
                $user = 'user';
                $pass = 'pass';

                $dsn = "mysql:host=$host;dbname=$dbname;charset=utf8";
                self::$dbConn = new PDO($dsn, $user, $pass);
            } catch (Exception $ex) {
                echo "Не удалось соединиться с базой: " . $ex->getMessage();
                die;
            }
        }

        return self::$dbConn;
    }
}