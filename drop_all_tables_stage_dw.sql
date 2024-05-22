SELECT 
    'DROP TABLE ' + s.name +'.'+ t.name + ';'
FROM sys.tables t 
JOIN sys.schemas s on t.schema_id = s.schema_id
WHERE s.name IN ('stage','dw','dbo')
ORDER BY s.name


DROP TABLE dbo.Ven
DROP TABLE dbo.Dim_Venda;
DROP TABLE dbo.Dim_Venda_Log;
DROP TABLE dbo.controle_carga;
DROP TABLE dbo.DimTempo;
DROP TABLE dw.fato_teste;
DROP TABLE dw.dimensao_cliente;
DROP TABLE dw.dimensao_local;
DROP TABLE dw.dimensao_funcionario;
DROP TABLE dw.dimensao_produto;
DROP TABLE stage.Products;
DROP TABLE stage.productioncategories;
DROP TABLE stage.local;
DROP TABLE stage.employees;
DROP TABLE stage.customers;
DROP TABLE stage.orders;
DROP TABLE stage.suppliers;
DROP TABLE stage.categories;
DROP TABLE stage.orderdetails;