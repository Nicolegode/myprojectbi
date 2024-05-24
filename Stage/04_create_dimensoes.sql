--CREATE TABELA DA DIMENSÃO DE CLIENTE 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[dimensao_cliente]') AND type in (N'U'))
DROP TABLE [dw].[dimensao_cliente]
GO

CREATE TABLE [dw].[dimensao_cliente]
(
	[rowid] [bigint] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[nome_companhia] [nvarchar](40) NULL,
	[nome_contato] [nvarchar](30) NULL,
	[titulo_contato] [nvarchar](30) NULL,
	[endereco] [nvarchar](60) NULL,
	[cidade] [nvarchar](15) NULL,
	[regiao] [nvarchar](15) NULL,
	[codigo_postal] [nvarchar](10) NULL,
	[pais] [nvarchar](15) NULL,
	[telefone] [nvarchar](24) NULL,
	[fax] [nvarchar] (24)NULL
) ON [PRIMARY]


--CREATE TABELA DA DIMENSAO DE LOCAL 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[dimensao_local]') AND type in (N'U'))
DROP TABLE [dw].[dimensao_local]
GO

CREATE TABLE [dw].[dimensao_local]
    (
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[id_pedido] [int],
	[id_cliente] [int] NOT NULL,
	[id_funcionario] [int] NOT NULL,
	[data_pedido] [datetime] NOT NULL,
	[endereco] [nvarchar](60) NULL,
	[cidade] [nvarchar](15) NULL,
	[estado] [nvarchar](15) NULL,
	[codigo_postal] [nvarchar](10) NULL,
	[pais] [nvarchar](15) NULL
) ON [PRIMARY]
GO


--CREATE TABELA DA DIMENSAO DE FUNCIONARI0 

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[dimensao_funcionario]') AND type in (N'U'))
DROP TABLE [dw].[dimensao_funcionario]
GO

CREATE TABLE [dw].[dimensao_funcionario]
(
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[id_funcionario] [int] NULL,
	[ultimo_nome] [nvarchar](20) NULL,
	[primeiro_nome] [nvarchar](10) NULL,
	[titulo] [nvarchar](30) NULL,
	[data_nascimento] [datetime] NULL,
	[data_contracao] [datetime] NULL,
	[endereco] [nvarchar](60) NULL,
	[cidade] [nvarchar](15) NULL,
	[regiao] [nvarchar](15) NULL,
	[codigo_postal] [nvarchar](10) NULL,
	[pais] [nvarchar](15) NULL,
	[telefone] [nvarchar](24) NULL,
	[superior] [int] NULL
) ON [PRIMARY]




--CREATE TABELA 2 DA DIMENSAO PRODUDO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[dimensao_produto]') AND type in (N'U'))
DROP TABLE [dw].[dimensao_produto]
GO

CREATE TABLE [dw].[dimensao_produto](
	[id_produto][int] NOT NULL,
    [rowid] [int] IDENTITY(1,1) NOT NULL,
	[id_categoria] [int] NOT NULL,
	[categoria] [nvarchar](15) NOT NULL,
	[sub_categoria] [nvarchar](200) NOT NULL,
	[produto] [nvarchar](40) NOT NULL,
	[id_fornecedor] [int] NOT NULL,
	[fornecedor] [nvarchar](30) NOT NULL,
	[preco_unitario] [money] NOT NULL,
	[descontinuado] [bit] NOT NULL)
	
