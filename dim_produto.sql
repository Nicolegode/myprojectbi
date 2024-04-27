-- Active: 1714228812731@@dataslight.database.windows.net@1433@stage
SELECT 
    c.categoryname as categoria,
    c.description as sub_categoria,
    p.productname as nome_produtp,
    p.unitprice as preco_unitario,
    p.discontinued as descontinuado,
    s.contactname as fornecedor
FROM PRODUCTION.Categories AS c
    JOIN Production.Products as p 
        ON c.categoryid = p.categoryid
    JOIN Production.suppliers as s
        ON p.supplierid = s.supplierid



