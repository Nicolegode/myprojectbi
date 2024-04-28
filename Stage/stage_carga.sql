

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
     mgrid
    
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
  FROM [HR].[Employees]
WHERE empid > (SELECT isnull(ultima_chave_inserida,0) FROM dbo.controle_carga WHERE nome_tabela = 'employees');

if (select count(*) from stage.employees) > 0 
update dbo.controle_carga 
      set ultima_chave_inserida = (SELECT isnull(max(empid),0) AS empid FROM stage.employees) 
      WHERE nome_tabela = 'employees';

SELECT * FROM dbo.controle_carga


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
FROM [Sales].[Customers]
WHERE custid > (SELECT isnull(ultima_chave_inserida,0) FROM dbo.controle_carga WHERE nome_tabela = 'customers');

if (select count(*) from stage.customers) > 0 
update dbo.controle_carga 
      set ultima_chave_inserida = (SELECT isnull(max(custid),0) AS custid FROM stage.customers) 
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
WHERE orderid > (SELECT isnull(ultima_chave_inserida,0) FROM dbo.controle_carga WHERE nome_tabela = 'orders');

if (select count(*) from stage.orders) > 0 
update dbo.controle_carga 
      set ultima_chave_inserida = (SELECT isnull(max(orderid),0) AS orderid FROM stage.orders) 
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
    )
SELECT
      [productid]
      ,[categoryid] 
       ,[productname] 
      ,[supplierid] 
      ,[unitprice]
      ,[discontinued] 
FROM Production.Products
WHERE productid > (SELECT isnull(ultima_chave_inserida,0) FROM dbo.controle_carga WHERE nome_tabela = 'products');

if (select count(*) from stage.products) > 0 
update dbo.controle_carga 
      set ultima_chave_inserida = (SELECT isnull(max(productid),0) AS orderid FROM stage.Products) 
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
WHERE supplierid > (SELECT isnull(ultima_chave_inserida,0) FROM dbo.controle_carga WHERE nome_tabela = 'suppliers');

if (select count(*) from stage.suppliers) > 0 
update dbo.controle_carga 
      set ultima_chave_inserida = (SELECT isnull(max(supplierid),0) AS supplierid FROM stage.suppliers) 
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
)
SELECT 
       [categoryid]  
      ,[categoryname] 
      ,[description] 
FROM [Production].[Categories]
WHERE categoryid > (SELECT isnull(ultima_chave_inserida,0) FROM dbo.controle_carga WHERE nome_tabela = 'categories');

if (select count(*) from stage.Categories) > 0 
update dbo.controle_carga 
      set ultima_chave_inserida = (SELECT isnull(max(categoryid),0) AS categoryid FROM stage.Categories) 
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
WHERE productid > (SELECT isnull(ultima_chave_inserida,0) FROM dbo.controle_carga WHERE nome_tabela = 'orderdetails');

if (select count(*) from stage.orderdetails) > 0 
update dbo.controle_carga 
      set ultima_chave_inserida = (SELECT isnull(max(productid),0) AS productid FROM stage.orderdetails) 
      WHERE nome_tabela = 'Categories';

SELECT * FROM dbo.controle_carga