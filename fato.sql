WITH fato_source as 
    (
SELECT 
o.shippostalcode as codigo_postal,
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


SELECT 
    dc.rowid as sk_cliente
    ,dl.rowid as sk_local
    ,df.rowid as sk_funcionario
    ,dp.rowid as sk_produto
    ,dt.sktempo as sk_tempo
    ,f.nota_fiscal
    ,f.quantidade
    ,f.preco_unitario
    ,f.desconto
    ,f.preco_final
FROM fato_source as f 
JOIN dw.dimensao_cliente as dc ON dc.id_cliente = f.id_cliente
JOIN dw.dimensao_local as dl ON dl.codigo_postal = f.codigo_postal
JOIN dw.dimensao_funcionario as df ON df.id_funcionario = f.id_funcionario
JOIN dbo.dimtempo as dt ON dt.Dattempo = f.chave_tempo
JOIN dw.dimensao_produto as dp ON dp.preco_unitario = f.preco_unitario








