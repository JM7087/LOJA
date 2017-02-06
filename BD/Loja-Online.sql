-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 27-Jan-2017 às 23:39
-- Versão do servidor: 5.5.49-0ubuntu0.14.04.1
-- versão do PHP: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `Loja-Online`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `COMPRAS`
--

CREATE TABLE IF NOT EXISTS `COMPRAS` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_NUMERO_PEDIDO` int(11) NOT NULL,
  `COM_SITUACAO` varchar(15) NOT NULL,
  `COM_FORMA_PAGQAMENTO` varchar(45) NOT NULL,
  `USUARIO_USU_ID` int(11) NOT NULL,
  PRIMARY KEY (`COM_ID`),
  KEY `fk_COMPRAS_USUARIO1_idx` (`USUARIO_USU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `COM_PRODUTO`
--

CREATE TABLE IF NOT EXISTS `COM_PRODUTO` (
  `COM_PRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_ID` int(11) NOT NULL,
  `COM_ID` int(11) NOT NULL,
  PRIMARY KEY (`COM_PRO_ID`),
  KEY `fk_COM_PRODUTO_PRODUTO1_idx` (`PRO_ID`),
  KEY `fk_COM_PRODUTO_COMPRAS1_idx` (`COM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `FOTO`
--

CREATE TABLE IF NOT EXISTS `FOTO` (
  `FOTO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FOTO_NOME` varchar(200) NOT NULL,
  `FOTO_ID_PRO` int(11) NOT NULL,
  PRIMARY KEY (`FOTO_ID`),
  KEY `FK_FOTO_PRODUTOS` (`FOTO_ID_PRO`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `FOTO`
--

INSERT INTO `FOTO` (`FOTO_ID`, `FOTO_NOME`, `FOTO_ID_PRO`) VALUES
(1, 'filtro.png', 27);

-- --------------------------------------------------------

--
-- Estrutura da tabela `LOGIN`
--

CREATE TABLE IF NOT EXISTS `LOGIN` (
  `LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOG_EMAIL` varchar(100) NOT NULL,
  `LOG_SENHA` varchar(45) NOT NULL,
  `USUARIO_USU_ID` int(11) NOT NULL,
  PRIMARY KEY (`LOG_ID`),
  KEY `fk_LOGIN_USUARIO1_idx` (`USUARIO_USU_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `LOGIN`
--

INSERT INTO `LOGIN` (`LOG_ID`, `LOG_EMAIL`, `LOG_SENHA`, `USUARIO_USU_ID`) VALUES
(1, 'email@email.com', '123456', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `PRODUTOS`
--

CREATE TABLE IF NOT EXISTS `PRODUTOS` (
  `PRO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_NOME` varchar(100) NOT NULL,
  `PRO_DESCRICAO` varchar(250) NOT NULL,
  `PRO_VALOR` double NOT NULL,
  `PRO_QUANTIDADE` int(11) NOT NULL,
  `PRO_FOTOS` int(11) DEFAULT NULL,
  `PRO_MARCA` varchar(100) NOT NULL,
  `PRO_CATEGORIA` varchar(45) NOT NULL,
  PRIMARY KEY (`PRO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Extraindo dados da tabela `PRODUTOS`
--

INSERT INTO `PRODUTOS` (`PRO_ID`, `PRO_NOME`, `PRO_DESCRICAO`, `PRO_VALOR`, `PRO_QUANTIDADE`, `PRO_FOTOS`, `PRO_MARCA`, `PRO_CATEGORIA`) VALUES
(27, 'Produto 1', 'Produto bão', 1, 1, NULL, 'Produtex', 'Categoria 1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `USUARIO`
--

CREATE TABLE IF NOT EXISTS `USUARIO` (
  `USU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USU_NOME` varchar(100) NOT NULL,
  `USU_TELEFONE` varchar(25) NOT NULL,
  `USU_SEXO` varchar(1) NOT NULL,
  `USU_ENDERECO` varchar(100) NOT NULL,
  `USU_CEP` varchar(10) NOT NULL,
  `USU_CIDADE` varchar(100) NOT NULL,
  `USU_ESTADO` varchar(45) NOT NULL,
  PRIMARY KEY (`USU_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `USUARIO`
--

INSERT INTO `USUARIO` (`USU_ID`, `USU_NOME`, `USU_TELEFONE`, `USU_SEXO`, `USU_ENDERECO`, `USU_CEP`, `USU_CIDADE`, `USU_ESTADO`) VALUES
(4, 'nome1', 'telefone', 'M', 'RUA', 'CEP', 'CIDADE', 'ESTADO');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `COMPRAS`
--
ALTER TABLE `COMPRAS`
  ADD CONSTRAINT `fk_COMPRAS_USUARIO1` FOREIGN KEY (`USUARIO_USU_ID`) REFERENCES `USUARIO` (`USU_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `COM_PRODUTO`
--
ALTER TABLE `COM_PRODUTO`
  ADD CONSTRAINT `fk_COM_PRODUTO_PRODUTO1` FOREIGN KEY (`PRO_ID`) REFERENCES `PRODUTOS` (`PRO_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_COM_PRODUTO_COMPRAS1` FOREIGN KEY (`COM_ID`) REFERENCES `COMPRAS` (`COM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `FOTO`
--
ALTER TABLE `FOTO`
  ADD CONSTRAINT `FK_FOTO_PRODUTOS` FOREIGN KEY (`FOTO_ID_PRO`) REFERENCES `PRODUTOS` (`PRO_ID`);

--
-- Limitadores para a tabela `LOGIN`
--
ALTER TABLE `LOGIN`
  ADD CONSTRAINT `fk_LOGIN_USUARIO1` FOREIGN KEY (`USUARIO_USU_ID`) REFERENCES `USUARIO` (`USU_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
