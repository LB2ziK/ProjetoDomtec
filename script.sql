USE [master]
GO
/****** Object:  Database [vendas]    Script Date: 23/06/2023 15:12:48 ******/
CREATE DATABASE [vendas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'vendas', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SERVERCURSO\MSSQL\DATA\vendas.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'vendas_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SERVERCURSO\MSSQL\DATA\vendas_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [vendas] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [vendas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [vendas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [vendas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [vendas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [vendas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [vendas] SET ARITHABORT OFF 
GO
ALTER DATABASE [vendas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [vendas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [vendas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [vendas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [vendas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [vendas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [vendas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [vendas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [vendas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [vendas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [vendas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [vendas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [vendas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [vendas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [vendas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [vendas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [vendas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [vendas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [vendas] SET  MULTI_USER 
GO
ALTER DATABASE [vendas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [vendas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [vendas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [vendas] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [vendas] SET DELAYED_DURABILITY = DISABLED 
GO
USE [vendas]
GO
/****** Object:  Table [dbo].[categorias]    Script Date: 23/06/2023 15:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[categorias](
	[categoriaId] [int] IDENTITY(1,1) NOT NULL,
	[descricao] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 23/06/2023 15:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[clienteId] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](60) NULL,
	[endereco] [varchar](60) NULL,
	[cidade] [varchar](50) NULL,
	[bairro] [varchar](40) NULL,
	[estado] [varchar](2) NULL,
	[cep] [varchar](10) NULL,
	[telefone] [varchar](14) NULL,
	[email] [varchar](100) NULL,
	[dataNascimento] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[clienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[produtos]    Script Date: 23/06/2023 15:12:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[produtos](
	[produtoId] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](60) NULL,
	[descricao] [varchar](255) NULL,
	[valor] [decimal](18, 5) NULL DEFAULT ((0.00000)),
	[quantidade] [decimal](18, 5) NULL DEFAULT ((0.00000)),
	[categoriaId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[produtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 23/06/2023 15:12:48 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[usuarios](
	[usuarioId] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[senha] [varchar](40) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vendas]    Script Date: 23/06/2023 15:12:48 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendas](
	[vendaId] [int] IDENTITY(1,1) NOT NULL,
	[clienteId] [int] NOT NULL,
	[dataVenda] [datetime] NOT NULL DEFAULT (getdate()),
	[totalVenda] [decimal](18, 5) NOT NULL DEFAULT ((0.00000)),
PRIMARY KEY CLUSTERED 
(
	[vendaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vendasItens]    Script Date: 23/06/2023 15:12:48 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendasItens](
	[vendaId] [int] NOT NULL,
	[produtoId] [int] NOT NULL,
	[valorUnitario] [decimal](18, 5) NOT NULL DEFAULT ((0.00000)),
	[quantidade] [decimal](18, 5) NOT NULL DEFAULT ((0.00000)),
	[totalProduto] [decimal](18, 5) NOT NULL DEFAULT ((0.00000)),
PRIMARY KEY CLUSTERED 
(
	[vendaId] ASC,
	[produtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[produtos]  WITH CHECK ADD  CONSTRAINT [FK_ProdutosCategorias] FOREIGN KEY([categoriaId])
REFERENCES [dbo].[categorias] ([categoriaId])
GO
ALTER TABLE [dbo].[produtos] CHECK CONSTRAINT [FK_ProdutosCategorias]
GO
ALTER TABLE [dbo].[vendas]  WITH CHECK ADD  CONSTRAINT [FK_VendasClientes] FOREIGN KEY([clienteId])
REFERENCES [dbo].[clientes] ([clienteId])
GO
ALTER TABLE [dbo].[vendas] CHECK CONSTRAINT [FK_VendasClientes]
GO
ALTER TABLE [dbo].[vendasItens]  WITH CHECK ADD  CONSTRAINT [FK_VendasItensProdutos] FOREIGN KEY([produtoId])
REFERENCES [dbo].[produtos] ([produtoId])
GO
ALTER TABLE [dbo].[vendasItens] CHECK CONSTRAINT [FK_VendasItensProdutos]
GO
USE [master]
GO
ALTER DATABASE [vendas] SET  READ_WRITE 
GO
