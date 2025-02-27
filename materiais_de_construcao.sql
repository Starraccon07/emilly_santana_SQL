-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/02/2025 às 20:58
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `materiais_de_construcao`
--
CREATE DATABASE IF NOT EXISTS `materiais_de_construcao` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `materiais_de_construcao`;

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `insertCliente1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCliente1` (`c_id` INT, `c_nome` VARCHAR(50), `c_telefone` VARCHAR(15), `c_email` VARCHAR(50))   BEGIN
    IF ((c_nome <> '') &&(c_telefone <> '') && (c_email <> '')) THEN
        INSERT INTO Clientes (Nome, Telefone, Email)
        VALUES (c_nome,c_telefone,c_email);
        SELECT 'Cadastro inserido com sucesso!'
        AS Msg;
    ELSE
        SELECT 'Os dados devem ser fornecidos para o cadastro!'
        AS Msg;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `insertCliente2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCliente2` (IN `c_id` INT, IN `c_cpf` VARCHAR(30), IN `c_endereco` VARCHAR(50), IN `c_nome` VARCHAR(50), IN `c_telefone` VARCHAR(15), IN `c_email` VARCHAR(50))   BEGIN
    IF ((c_nome <> '') &&(c_telefone <> '') && (c_email <> '') && (c_cpf <> '') &&(c_endereco <> ''))THEN
        INSERT INTO Clientes (Nome,Telefone,Email,CPF,Endereco)
        VALUES (c_nome,c_telefone,c_email,c_cpf,c_endereco);
        SELECT 'Cadastro inserido com sucesso!'
        AS Msg;
    ELSE
        SELECT 'Os dados devem ser fornecidos para o cadastro!'
        AS Msg;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `updateCliente1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCliente1` (`u_id` INT, `u_nome` VARCHAR(50), `u_telefone` VARCHAR(15), `u_email` VARCHAR(50))   BEGIN
IF ((u_id >0) && (u_id <>'') && (u_nome <>'') && (u_telefone <>'') && (u_email <>''))THEN
UPDATE Clientes SET Nome = u_nome, Telefone = u_telefone, Email = u_email;
SELECT 'Informações atualizadas com sucesso!'
AS Msg;
ELSE
SELECT 'Registro não encontrado!'
AS Msg;
END IF;  
END$$

DROP PROCEDURE IF EXISTS `updateCliente2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateCliente2` (`u_id` INT, `u_nome` VARCHAR(50), `u_telefone` VARCHAR(15), `u_email` VARCHAR(50), `u_cpf` VARCHAR(30), `u_endereco` VARCHAR(50))   BEGIN
IF ((u_id >0) && (u_id <>'') && (u_nome <>'') && (u_telefone <>'') && (u_email <>'') && (u_cpf <>'') && (u_endereco <>''))THEN
UPDATE Clientes SET Nome = u_nome, Telefone = u_telefone, Email = u_email, CPF = u_cpf,Endereco = u_endereco;
SELECT 'Informações atualizadas com sucesso!'
AS Msg;
ELSE
SELECT 'Registro não encontrado!'
AS Msg;
END IF;  
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `Id_cliente` int(11) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Email` varchar(5) NOT NULL,
  `CPF` varchar(30) DEFAULT NULL,
  `Endereco` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `ID` int(11) NOT NULL,
  `cnpj` varchar(50) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Endereco` varchar(50) NOT NULL,
  `Telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `empresas`
--

INSERT INTO `empresas` (`ID`, `cnpj`, `Email`, `Nome`, `Endereco`, `Telefone`) VALUES
(24, '11111111113333', 'empresa2@exemplo.com', 'Loja CBA', 'Joinville', '(47) 1234-5678'),
(25, '12345678000195', 'novoemail@empresa.com', 'Nome da Empresa Atualizado', 'Novo Endereço', '0800-9876-5432'),
(26, '11111111113333', 'empresa2@exemplo.com', 'Loja CBA', 'Joinville', '(47) 1234-5678'),
(27, '11111111113333', 'empresa2@exemplo.com', 'Loja CBA', 'Joinville', '(47) 1234-5678');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `Id_pedido` int(11) NOT NULL,
  `Id_cliente` int(11) DEFAULT NULL,
  `Data_pedido` varchar(15) DEFAULT NULL,
  `Valor` decimal(10,2) DEFAULT NULL,
  `Forma_pagamento` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_cliente`);

--
-- Índices de tabela `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`ID`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Id_pedido`),
  ADD KEY `Id_cliente` (`Id_cliente`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `empresas`
--
ALTER TABLE `empresas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`Id_cliente`) REFERENCES `clientes` (`Id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
