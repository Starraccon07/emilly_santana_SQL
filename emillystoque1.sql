-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/02/2025 às 19:32
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `emillystoque1`
--
CREATE DATABASE IF NOT EXISTS `emillystoque1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `emillystoque1`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `Cod_cliente` int(11) NOT NULL COMMENT 'É responsável por armazenar a chave primária da tabela Cliente.',
  `Nome_cliente` varchar(50) DEFAULT NULL COMMENT 'É responsável por armazenar o nome do cliente.',
  `Endereço_cliente` varchar(50) DEFAULT NULL COMMENT 'É responsável por armazenar o endereço do cliente.',
  `Cidade_cliente` varchar(50) DEFAULT NULL COMMENT 'É responsável por armazenar a cidade do cliente.',
  `CEP_cliente` varchar(10) DEFAULT NULL COMMENT 'É responsável por armazenar o CEP do ciente.',
  `UF` char(2) DEFAULT NULL,
  `CNPJ` varchar(30) DEFAULT NULL COMMENT 'É responsável por armazenar o CNPJ do cliente.',
  `IE` int(11) DEFAULT NULL COMMENT 'É responsável por armazenar a inscrição estadual do cliente.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`Cod_cliente`, `Nome_cliente`, `Endereço_cliente`, `Cidade_cliente`, `CEP_cliente`, `UF`, `CNPJ`, `IE`) VALUES
(20, 'Beth', 'Av Climério n. 45', 'São Paulo', '25679300', 'SP', '3248512673268', 9280),
(110, 'Jorge', 'Rua Caiapó 13', 'Curitiba', '30078500', 'PR', '1451276498349', 5004,null),
(130, 'Edmar', 'Rua da Prais s/n', 'Salvador', '30079300', 'BA', '234632842349', 7121),
(157, 'Paulo', 'Tv. Moraes c/3', 'Londrina',null, '25679310', 'PR', '328482233242', 1923),
(180, 'Livio', 'Av. Beira Mar n.1256', 'Florianópolis', '30077500', 'SC', '1273657123474', 9275,null),
(222, 'Lúcia', 'Rua Itabira 123 loja 09', 'Belo Horizonte', '22124391', 'MG', '2831521393488', 2985),
(234, 'José', 'Quadra 3 bl. 3 sl 1003', 'Brasilia', '22841650', 'DF', '2176357612323', 2931),
(260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046500', 'RJ', '217635712329', 2530),
(290, 'Renato', 'Rua Meireles n. 123 bl.2 sl.345', 'São Paulo', '30225900', 'SP', '1327657112314', 182),
(390, 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '30438700', 'MG', '321765472133', 9071),
(410, 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '30078900', 'RJ', '1283512823469', 7431),
(720, 'Ana', 'Rua', '17 n.19', 'Niterói', '24', '12113231/0001-34', 2134),
(830, 'Mauricio', 'Av Paulista 1236 sl/2345', 'São Paulo', '3012683', 'SP', '3281698574656', 9343),
(870, 'Flavio', 'Av. Pres Vargas 10', 'São Paulo', '22763931', 'SP', '2253412693879', 4631);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_do_pedido`
--

CREATE TABLE `item_do_pedido` (
  `Num_pedido` int(11) NOT NULL,
  `Cod_produto` int(11) NOT NULL,
  `qtde` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_do_pedido`
--

INSERT INTO `item_do_pedido` (`Num_pedido`, `Cod_produto`, `qtde`) VALUES
(121, 25, 10),
(121, 31, 35),
(97, 77, 20),
(101, 31, 9),
(148, 45, 8),
(148, 31, 7),
(148, 77, 3),
(148, 25, 10),
(148, 78, 30),
(104, 53, 32),
(203, 31, 6),
(189, 78, 45),
(143, 31, 20),
(105, 78, 10),
(111, 25, 10),
(111, 78, 70),
(103, 53, 37),
(91, 77, 40),
(138, 22, 10),
(138, 77, 35),
(138, 53, 18),
(108, 13, 17),
(119, 77, 40),
(119, 13, 6),
(119, 22, 10),
(119, 53, 43),
(137, 13, 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `Num_pedido` int(11) NOT NULL,
  `Prazo_entrega` int(10) DEFAULT NULL,
  `Cod_cliente` int(11) NOT NULL,
  `Cod_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`Num_pedido`, `Prazo_entrega`, `Cod_cliente`, `Cod_vendedor`) VALUES
(91, 20, 260, 11),
(97, 20, 720, 101),
(98, 20, 410, 209),
(101, 15, 720, 101),
(103, 20, 260, 11),
(104, 30, 110, 101),
(105, 15, 180, 240),
(108, 15, 290, 310),
(111, 20, 260, 240),
(112, 20, 260, 240),
(119, 30, 390, 250),
(121, 20, 410, 209),
(127, 10, 410, 11),
(137, 20, 720, 720),
(138, 20, 260, 11),
(143, 30, 20, 111),
(148, 20, 720, 101),
(189, 15, 870, 213),
(203, 30, 830, 250);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `Cod_produto` int(11) NOT NULL,
  `Unid_produto` varchar(10) DEFAULT NULL,
  `Desc_produto` varchar(50) DEFAULT NULL,
  `valor_unit` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`Cod_produto`, `Unid_produto`, `Desc_produto`, `valor_unit`) VALUES
(13, 'G', 'Ouro', 6.18),
(22, 'M', 'Linho', 0.11),
(25, 'Kg', 'Queijo', 0.97),
(30, 'SAC', 'Açucar', 0.30),
(31, 'Bar', 'Chocolate', 0.87),
(45, 'M', 'Madeira', 0.25),
(53, 'M', 'Linha', 1.80),
(77, 'M', 'Papel', 1.05),
(78, 'L', 'Vinho', 2.00),
(87, 'M', 'Cano', 1.97);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `Cod_vendedor` int(11) NOT NULL COMMENT 'É responsável por armazenar a chave primária da tabela vendedor.',
  `Nome_vendedor` varchar(50) DEFAULT NULL COMMENT 'É responsável por armazenar o nome do vendedor.',
  `Sal_fixo` decimal(15,2) DEFAULT NULL COMMENT 'É responsável por armazenar o salário fixo do vendedor.',
  `Faixa_comissão` char(2) DEFAULT NULL COMMENT 'É rsponsável por armazenar a faixa de comissão do vendedor.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendedor`
--

INSERT INTO `vendedor` (`Cod_vendedor`, `Nome_vendedor`, `Sal_fixo`, `Faixa_comissão`) VALUES
(11, 'João', 2780.00, 'C'),
(101, 'João', 2650.32, 'C'),
(111, 'Carlos', 2490.00, 'A'),
(209, 'José', 1800.00, 'C'),
(213, 'Jonas', 2300.50, 'A'),
(240, 'Antonio', 9500.00, 'C'),
(250, 'Mauricío', 2930.00, 'B'),
(310, 'Josias', 870.00, 'B'),
(720, 'Felipe', 4600.00, 'A');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cod_cliente`);

--
-- Índices de tabela `item_do_pedido`
--
ALTER TABLE `item_do_pedido`
  ADD KEY `Pk_Num_pedido_pedido` (`Num_pedido`),
  ADD KEY `Pk_Cod_produto_produto` (`Cod_produto`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Num_pedido`),
  ADD KEY `pk_cliente_pedido` (`Cod_cliente`),
  ADD KEY `Pk_vendedor_pedido` (`Cod_vendedor`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`Cod_produto`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`Cod_vendedor`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_do_pedido`
--
ALTER TABLE `item_do_pedido`
  ADD CONSTRAINT `Pk_Cod_produto_produto` FOREIGN KEY (`Cod_produto`) REFERENCES `produto` (`Cod_produto`),
  ADD CONSTRAINT `Pk_Num_pedido_pedido` FOREIGN KEY (`Num_pedido`) REFERENCES `pedido` (`Num_pedido`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `Pk_vendedor_pedido` FOREIGN KEY (`Cod_vendedor`) REFERENCES `vendedor` (`Cod_vendedor`),
  ADD CONSTRAINT `pk_cliente_pedido` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
