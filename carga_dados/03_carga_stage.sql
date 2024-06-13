

----carga stage.funcionario-------

DELETE
FROM stage.employees;

INSERT INTO stage.employees
    ( 
     empid,
     lastname,
     firstname,
     title,
     birthdate,
     hiredate,
     address,
     city,
     region,
     postalcode,
     country,
     phone,
     mgrid,
     modified_by
    
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
      ,modified_by
FROM [HR].[Employees]
WHERE modified_by > (SELECT CONVERT(VARCHAR,isnull(valor_ultimo_incremento,'1900-01-01'),21) FROM dbo.controle_carga WHERE nome_tabela = 'employees');


if (select count(*) from stage.employees) > 0 
update dbo.controle_carga 
      set valor_ultimo_incremento = (SELECT CONVERT(VARCHAR,(max(modified_by)),21) AS empid FROM stage.employees)
      WHERE nome_tabela = 'employees';




-------carga stage.customers-------

DELETE
FROM stage.customers;

INSERT INTO stage.customers
(  
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
      ,modified_by
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
      ,modified_by
FROM [Sales].[Customers]
WHERE modified_by > (SELECT CONVERT(VARCHAR,isnull(valor_ultimo_incremento,'1900-01-01'),21) FROM dbo.controle_carga WHERE nome_tabela = 'customers');

if (select count(*) from stage.customers) > 0 
update dbo.controle_carga 
      set valor_ultimo_incremento = (SELECT CONVERT(VARCHAR, (max(modified_by)),21) AS custid FROM stage.customers) 
      WHERE nome_tabela = 'customers';

SELECT * FROM dbo.controle_carga

------carga stage.orders----------

DELETE
FROM stage.orders

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
FROM [sales].[Orders]
WHERE orderid > (SELECT CONVERT(VARCHAR ,isnull(valor_ultimo_incremento,0)) FROM dbo.controle_carga WHERE nome_tabela = 'orders');

if (select count(*) from stage.orders) > 0 
update dbo.controle_carga 
      set valor_ultimo_incremento = (SELECT CONVERT(VARCHAR ,(max(orderid))) AS orderid FROM stage.orders) 
      WHERE nome_tabela = 'orders';

SELECT * FROM dbo.controle_carga



------carga stage.products----------


DELETE
FROM stage.products;

INSERT INTO stage.products
    (  [productid]
      ,[categoryid] 
      ,[productname] 
      ,[supplierid] 
      ,[unitprice]
      ,[discontinued] 
      ,modified_by
    )
SELECT
      [productid]
      ,[categoryid] 
       ,[productname] 
      ,[supplierid] 
      ,[unitprice]
      ,[discontinued] 
      ,modified_by
FROM Production.Products
WHERE modified_by > (SELECT CONVERT(VARCHAR,isnull(valor_ultimo_incremento,'1900-01-01'),21) FROM dbo.controle_carga WHERE nome_tabela = 'products');

if (select count(*) from stage.products) > 0 
update dbo.controle_carga 
      set valor_ultimo_incremento = (SELECT CONVERT(VARCHAR, (max(modified_by)),21) AS productid FROM stage.Products) 
      WHERE nome_tabela = 'products';

SELECT * FROM dbo.controle_carga



----------carga stage.suppliers--------------

DELETE
FROM stage.suppliers;

INSERT INTO stage.suppliers
      (
      contactname,
      [supplierid]
      )
SELECT
      [contactname],
      [supplierid]    
FROM [Production].[suppliers]
WHERE supplierid > (SELECT CONVERT(VARCHAR ,isnull(valor_ultimo_incremento,0)) FROM dbo.controle_carga WHERE nome_tabela = 'suppliers');

if (select count(*) from stage.suppliers) > 0 
update dbo.controle_carga 
      set valor_ultimo_incremento = (SELECT (max(supplierid)) AS supplierid FROM stage.suppliers) 
      WHERE nome_tabela = 'suppliers';

SELECT * FROM dbo.controle_carga





--------carga stage.categories-------------

DELETE 
FROM stage.categories;

INSERT INTO stage.categories
(
       [categoryid]  
      ,[categoryname] 
      ,[description] 
      ,modified_by
)
SELECT 
       [categoryid]  
      ,[categoryname] 
      ,[description] 
      ,modified_by
FROM [Production].[Categories]
WHERE modified_by > (SELECT CONVERT(VARCHAR,isnull(valor_ultimo_incremento,'1900-01-01'),21) FROM dbo.controle_carga WHERE nome_tabela = 'categories');

if (select count(*) from stage.Categories) > 0 
update dbo.controle_carga 
      set valor_ultimo_incremento = (SELECT CONVERT(VARCHAR,(max(modified_by))) AS categoryid FROM stage.Categories) 
      WHERE nome_tabela = 'Categories';

SELECT * FROM dbo.controle_carga


-----------carga stage.orderdetails------------

DELETE 
FROM stage.orderdetails;

INSERT INTO stage.orderdetails
(
   orderid
  ,productid
  ,unitprice
  ,qty 
  ,discount
)
SELECT 
   orderid 
  ,[productid]
  ,[unitprice]
  ,[qty] 
  ,[discount]
FROM [sales].[orderdetails]
WHERE concat(orderid,productid) > (SELECT CONVERT(VARCHAR ,isnull(valor_ultimo_incremento,0)) FROM dbo.controle_carga WHERE nome_tabela = 'orderdetails');

if (select count(*) from stage.orderdetails) > 0 
update dbo.controle_carga 
      set valor_ultimo_incremento = (SELECT (max(concat(orderid,productid)))  FROM stage.orderdetails) 
      WHERE nome_tabela = 'orderdetails';

SELECT * FROM dbo.controle_carga
