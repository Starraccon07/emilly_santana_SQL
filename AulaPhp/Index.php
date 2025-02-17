<?php
include('conexao.php');
if(isset($_POST['usuario']) && isset($_POST['senha'])) {

    if(strlen($_POST['usuario']) == 0) {
        echo "Usuario não informado";
    } else if(strlen($_POST['senha']) == 0) {
        echo "Preencha sua senha";
    } else if(strlen($_POST['email']) == 0) {
        echo "Informe seu e-mail";
    } else {

        $usuario = $mysqli->real_escape_string($_POST['usuario']);
        $senha = $mysqli->real_escape_string($_POST['senha']);
        $email = $mysqli->real_escape_string($_POST['email']);
        $sql_code = "SELECT * FROM usuarios WHERE usuario = '$usuario' AND senha = '$senha' AND email = '$email'";
        $sql_query = $mysqli->query($sql_code) or die("Falha na execução do código SQL: " . $mysqli->error);
        $quantidade = $sql_query->num_rows;

        if($quantidade == 1) {
            $usuario = $sql_query->fetch_assoc();
            if(!isset($_SESSION)) {
                session_start();
            }
            $_SESSION['id'] = $usuario['id'];
            $_SESSION['nome'] = $usuario['nome'];
            $_SESSION['email'] = $usuario['email'];
            header("Location: painel.php");
        } else {
            echo "Falha ao logar! E-mail ou senha incorretos";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body{
            font-family: Arial, Helvetica, sans-serif;
            background-image: url('68399.webp');
            background-size: cover; 
            background-position: center; 
            background-attachment: fixed; 
        }
        .tela-login{
            background-color: rgb(255, 228, 139);
            position:absolute;
            top:50%;
            left: 50%;
            transform: translate(-50%,-50%);
            padding: 60px;
            border-radius: 20px;
            color: black;
        }
        input{
            padding: 16px;
            border: none;
            outline: none;
            font-size: 18px;
        }
        button{
            background-color: pink;
            border: none;
            outline: none;
            padding: 16px;
            width: 100%;
            border-radius: 12px;
            color: black;
            font-size: 20px;
        }
        button:hover{
            background-color: purple;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <div class="tela-login">
    <h1>Login</h1>
    <form action="" method="POST">
        <br>
            <input type="text" name="usuario" placeholder="Usuário">
            <br><br>      
            <input type="password" name="senha" placeholder="Senha">
            <br><br>
            <input type="text" name="email" placeholder="email">
            <br><br>    
            <button type="submit">Entrar</button>
    </form>
    </div>
</body>
</html>