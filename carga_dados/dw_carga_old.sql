
--Carga dimensao funcionario--

DELETE
FROM [dw].[dimensao_funcionario]

INSERT INTO [dw].[dimensao_funcionario]
(
	[id_funcionario],
	[ultimo_nome],
	[primeiro_nome],
	[titulo],
	[data_nascimento],
	[data_contracao],
	[endereco],
	[cidade],
	[regiao],
	[codigo_postal],
	[pais],
	[telefone],
    [superior]
)
SELECT
       [empid]
      ,[lastname]
      ,[firstname]
      ,[title]
      ,[birthdate]
      ,[hiredate]
      ,[address]
      ,[city]
      ,[region]
      ,[postalcode]
      ,[country]
      ,[phone]
      ,[mgrid]
  FROM [stage].[employees]

select count (*) as funcionario
from [dw].[dimensao_funcionario]

--carga dimensao cliente 


DELETE
FROM dw.dimensao_cliente

insert into 
  dw.dimensao_cliente (
    id_cliente, 
    nome_companhia, 
    nome_contato, 
    titulo_contato, 
    endereco, 
    cidade, 
    regiao, 
    codigo_postal, 
    pais, 
    telefone, 
    fax
  )

SELECT 
       [custid]
      ,[companyname]
      ,[contactname]
      ,[contacttitle]
      ,[address]
      ,[city]
      ,[region]
      ,[postalcode]
      ,[country]
      ,[phone]
      ,[fax]
  FROM [stage].[customers]

select count(*) as cliente
from dw.dimensao_cliente


--carga dimensao local--

DELETE 
FROM [dw].[dimensao_local];

INSERT INTO [dw].[dimensao_local]
(   [id_pedido],
    [id_cliente],
    [id_funcionario],
    [data_pedido],
    [endereco],
	[cidade], 
	[estado], 
	[codigo_postal], 
	[pais]
)
SELECT
       [orderid]
      ,[custid] 
      ,[empid] 
      ,[orderdate]
      ,[shipaddress] 
      ,[shipcity] 
      ,[shipregion] 
      ,[shippostalcode] 
      ,[shipcountry]
 FROM stage.orders

select count(*) as [local]
from [dw].[dimensao_local]

--carga dimensao de produto--

DELETE 
FROM [dw].[dimensao_produto];

INSERT INTO [dw].[dimensao_produto]
(
     id_categoria
    ,categoria
    ,sub_categoria
    ,produto
    ,id_fornecedor
    ,fornecedor
    ,preco_unitario
    ,descontinuado
)

SELECT 
     c.categoryid
     ,c.categoryname
     ,c.[description]
     ,p.productname
     ,s.supplierid
     ,s.contactname
     ,p.unitprice
     ,p.discontinued
    FROM stage.categories AS c
    JOIN stage.Products as p 
        ON c.categoryid = p.categoryid
    JOIN stage.suppliers as s
        ON p.supplierid = s.supplierid
  
select count(*) as [produto]
from [dw].[dimensao_produto]


