-- create control load table
CREATE TABLE dbo.controle_carga (
    nome_tabela varchar(1000),
    ultima_chave_inserida int
)

-- insert control load register for each stage table
insert into dbo.controle_carga values ('orders',null)
-- delete from dbo.controle_carga

-- validade to get last record loaded
SELECT isnull(ultima_chave_inserida,0) FROM dbo.controle_carga WHERE nome_tabela = 'orders'


-- example incremental load for stage orders
 
DELETE FROM stage.orders

INSERT INTO stage.orders
    (
      [orderid]
      ,[custid]
      ,[empid]
      ,[orderdate]
      ,[shipaddress] 
      ,[shipcity] 
      ,[shipregion] 
      ,[shippostalcode]
      ,[shipcountry]
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
FROM [Sales].[orders]
WHERE orderid > (SELECT isnull(ultima_chave_inserida,0) FROM dbo.controle_carga WHERE nome_tabela = 'orders');

if (select count(*) from stage.orders) > 0 
update dbo.controle_carga 
      set ultima_chave_inserida = (SELECT isnull(max(orderid),0) AS orderid FROM stage.orders) 
      WHERE nome_tabela = 'orders';

SELECT * FROM dbo.controle_carga