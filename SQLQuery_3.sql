
WITH fato_source as 
    (
SELECT 
o.shippostalcode as codpostal_envio,
c.custid as id_cliente,
o.empid as id_funcionario,
od.productid as id_produto,
o.orderdate as chave_tempo,
o.orderid as nota_fiscal , 
od.qty as quantidade,
od.unitprice as preco_unitario,
od.discount as desconto,
od.unitprice* (100 - od.discount)/ 100 as preco_final
FROM SALES.Customers AS c
    JOIN SALES.Orders AS o
      ON c.custid = o.custid
    JOIN Sales.OrderDetails as od
      ON o.orderid = od.orderid
    )


DELETE
FROM [dw].[fato_teste]

INSERT INTO [dw].[fato_teste]
(
[sk_cliente],
[sk_local],
[sk_funcionario],
[sk_produto],
[sktempo],
[nota_fiscal],
[quantidade],
[preco_unitario],
[desconto],
[preco_final]

)
  

  SELECT 
    dc.rowid as sk_cliente
    ,dl.rowid as sk_local
    ,df.rowid as sk_funcionario
    ,dp.rowid as sk_produto
    ,dt.sktempo as sktempo
    ,f.nota_fiscal
    ,f.quantidade
    ,f.preco_unitario
    ,f.desconto
    ,f.preco_final
FROM fato_source as f 
JOIN dw.dimensao_cliente as dc ON dc.id_cliente = f.id_cliente
JOIN dw.dimensao_local as dl ON dl.codpostal_envio = f.codpostal_envio
JOIN dw.dimensao_funcionario as df ON df.id_funcionario = f.id_funcionario
JOIN dbo.dimtempo as dt ON dt.Dattempo = f.chave_tempo
JOIN dw.dimensao_produto as dp ON dp.id_produto = f.id_produto


select count (*) as fato
from [dw].[fato_teste]