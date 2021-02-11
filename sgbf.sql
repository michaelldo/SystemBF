-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 04-Dez-2017 às 20:46
-- Versão do servidor: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sgbf`
--
CREATE DATABASE IF NOT EXISTS `sgbf` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sgbf`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `nome`, `tipo`) VALUES
(1, 'Picole', 'Fruta'),
(2, 'Sorvete', 'Casquinha'),
(3, 'Picole', 'Cremoso'),
(4, 'picole', 'fruta'),
(5, 'Sorvete', 'Cascao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `dataHoraPedido` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `observacao` mediumtext,
  `pessoaId` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '2'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`idPedido`, `dataHoraPedido`, `observacao`, `pessoaId`, `status`) VALUES
(1, '2017-12-04 19:39:59', '', 2, 0),
(2, '2017-12-04 19:40:25', '', 2, 1),
(3, '2017-12-04 19:41:06', '', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `idPerfil` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idPerfil`, `descricao`) VALUES
(1, 'Administrador'),
(2, 'Cliente'),
(3, 'Revendedor'),
(4, 'Vendedor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `idPessoa` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cpf` varchar(15) DEFAULT NULL,
  `endereco` mediumtext,
  `rg` varchar(15) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `perfilId` int(11) NOT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `login` varchar(10) DEFAULT NULL,
  `senha` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pessoa`
--

INSERT INTO `pessoa` (`idPessoa`, `nome`, `cpf`, `endereco`, `rg`, `telefone`, `celular`, `status`, `email`, `perfilId`, `cnpj`, `login`, `senha`) VALUES
(1, 'Administrador', NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, 'admin', 'admin'),
(2, 'Cliente Padrão', NULL, NULL, NULL, NULL, NULL, 1, NULL, 2, NULL, NULL, NULL),
(3, 'Maria da Silva Santos', '701.481.171-12', 'asdfasdfadsgfasg', '999999999999999', '(99) 9999-9999', '(99)99999-9999', 1, 'mariam@gmail.com', 2, '99.999.999/9999-99', '', ''),
(8, 'Cristiano Souza Pereira', '701.481.171-12', '', '', '', '', 1, '', 4, '', 'venda', '12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `dataFabricacao` date DEFAULT NULL,
  `dataVencimento` date DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `quantidadeMin` int(11) DEFAULT NULL,
  `undMedida` varchar(45) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `peso` varchar(45) DEFAULT NULL,
  `categoriaId` int(11) NOT NULL,
  `saborId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `status`, `dataFabricacao`, `dataVencimento`, `preco`, `quantidade`, `quantidadeMin`, `undMedida`, `descricao`, `peso`, `categoriaId`, `saborId`) VALUES
(2, 1, '2017-11-29', '2018-11-29', '0.90', 23, 50, 'GRAMAS', '', '40.0', 1, 2),
(3, 1, '2017-11-29', '2018-11-29', '1.00', 66, 50, 'GRAMAS', '', '150.0', 5, 7),
(4, 1, '2017-11-30', '2018-11-30', '1.75', 39, 50, 'Selecione', '', '40.0', 3, 1),
(5, 1, '2017-12-01', '2018-12-02', '1.50', 91, 50, 'GRAMAS', '', '175.0', 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtopedido`
--

CREATE TABLE `produtopedido` (
  `pedidoId` int(11) NOT NULL,
  `produtoId` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `qtdBola` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtopedido`
--

INSERT INTO `produtopedido` (`pedidoId`, `produtoId`, `quantidade`, `qtdBola`) VALUES
(1, 2, 5, 0),
(2, 2, 3, 0),
(3, 3, 1, 3),
(3, 5, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sabor`
--

CREATE TABLE `sabor` (
  `idSabor` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sabor`
--

INSERT INTO `sabor` (`idSabor`, `descricao`) VALUES
(1, 'Açaí'),
(2, 'Abacaxi'),
(3, 'Amora'),
(4, 'Banana'),
(5, 'Creme'),
(7, 'Chocolate'),
(8, 'Chocolate');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `idVenda` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_Pedido_Pessoa1_idx` (`pessoaId`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Indexes for table `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`idPessoa`),
  ADD KEY `fk_Pessoa_Perfil1_idx` (`perfilId`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`),
  ADD KEY `fk_Produto_Sabor_idx` (`saborId`),
  ADD KEY `fk_Produto_Categoria1_idx` (`categoriaId`);

--
-- Indexes for table `produtopedido`
--
ALTER TABLE `produtopedido`
  ADD PRIMARY KEY (`pedidoId`,`produtoId`),
  ADD KEY `fk_Pedido_has_Produto_Produto1_idx` (`produtoId`),
  ADD KEY `fk_Pedido_has_Produto_Pedido1_idx` (`pedidoId`);

--
-- Indexes for table `sabor`
--
ALTER TABLE `sabor`
  ADD PRIMARY KEY (`idSabor`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`idVenda`),
  ADD KEY `idPedido` (`idPedido`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pessoa`
--
ALTER TABLE `pessoa`
  MODIFY `idPessoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sabor`
--
ALTER TABLE `sabor`
  MODIFY `idSabor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
  MODIFY `idVenda` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_Pedido_Pessoa1` FOREIGN KEY (`pessoaId`) REFERENCES `pessoa` (`idPessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `fk_Pessoa_Perfil1` FOREIGN KEY (`perfilId`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_Produto_Categoria1` FOREIGN KEY (`categoriaId`) REFERENCES `categoria` (`idCategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Produto_Sabor` FOREIGN KEY (`saborId`) REFERENCES `sabor` (`idSabor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtopedido`
--
ALTER TABLE `produtopedido`
  ADD CONSTRAINT `fk_Pedido_has_Produto_Pedido1` FOREIGN KEY (`pedidoId`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Pedido_has_Produto_Produto1` FOREIGN KEY (`produtoId`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
