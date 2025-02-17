<?php
$usuario = 'root';
$senha = '';
$database = 'sistema';
$host = 'localhost';
$port = 3306;

$mysqli = new mysqli($host, $usuario, $senha, $database, $port);

if($mysqli->error) {
    die("Falha ao conectar ao banco de dados: " . $mysqli->error);
}
