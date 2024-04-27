SELECT 
o.shippostalcode as chave_local,
c.custid as chave_cliente,
o.empid as chave_funcionario,
od.productid as chave_produto,
o.orderdate as chave_tempo,
o.orderid as nota_fiscal , --se o order id é a nota fiscal porque não está retornando um valor único?--
od.qty as quantidade,
od.unitprice as preco_unitario,
od.discount as disconto,
od.unitprice* (100 - od.discount)/ 100 as preco_finalo
FROM SALES.Customers AS C 
    JOIN SALES.Orders AS O
      ON c.custid = o.custid
    JOIN Sales.OrderDetails as OD
      ON o.orderid = od.orderid