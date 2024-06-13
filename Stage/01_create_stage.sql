

---------stage.employees-------------------------------

IF EXISTS(
    SELECT *
    FROM sys.tables as t
    JOIN sys.schemas AS s ON t.schema_id = s.schema_id
    WHERE t.name = 'employees'
        AND s.name = 'stage'
)

DROP TABLE stage.employees;

SELECT TOP 0 
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
      ,[modified_by]
INTO stage.employees
FROM HR.Employees

------------ stage.customers ---------------------------

IF EXISTS(
    SELECT *
    FROM sys.tables as t
    JOIN sys.schemas AS s ON t.schema_id = s.schema_id
    WHERE t.name = 'customers'
        AND s.name = 'stage'
)

DROP TABLE stage.customers;

SELECT TOP 0
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
      ,[modified_by]
INTO stage.customers
FROM [sales].[customers]

-------------stage.salesorders----------


IF EXISTS(
    SELECT *
    FROM sys.tables as t
    JOIN sys.schemas AS s ON t.schema_id = s.schema_id
    WHERE t.name = 'orders'
        AND s.name = 'stage'
)

DROP TABLE stage.orders;
SELECT TOP 0
       [orderid] 
      ,[custid] 
      ,[empid] 
      ,[orderdate] 
      ,[shipaddress] 
      ,[shipcity] 
      ,[shipregion] 
      ,[shippostalcode] 
      ,[shipcountry]
INTO stage.orders
FROM [sales].[Orders]

------------stage.products-----------------

IF EXISTS(
    SELECT *
    FROM sys.tables as t
    JOIN sys.schemas AS s ON t.schema_id = s.schema_id
    WHERE t.name = 'products'
        AND s.name = 'stage'
)

DROP TABLE stage.Products;

SELECT TOP 0 
       [productid]
      ,[categoryid]  
      ,[productname] 
      ,[supplierid] 
      ,[unitprice] 
      ,[discontinued]
      ,[modified_by] 
INTO stage.Products
FROM PRODUCTION.Products;

--------------stage.productionsuppliers------------

IF EXISTS(
    SELECT *
    FROM sys.tables as t
    JOIN sys.schemas AS s ON t.schema_id = s.schema_id
    WHERE t.name = 'suppliers'
        AND s.name = 'stage'
)

DROP TABLE stage.suppliers;

SELECT TOP 0
      [contactname] 
      ,[supplierid] 
INTO stage.suppliers
FROM [Production].[suppliers];

--------------stage.productioncategories---------

IF EXISTS(
    SELECT *
    FROM sys.tables as t
    JOIN sys.schemas AS s ON t.schema_id = s.schema_id
    WHERE t.name = 'categories'
        AND s.name = 'stage'
)

DROP TABLE stage.categories;

SELECT TOP 0
       [categoryid]  
      ,[categoryname] 
      ,[description] 
      ,[modified_by]
INTO stage.categories
FROM [Production].[Categories]

-------------stage.orderdetails--------------------


IF EXISTS(
    SELECT *
    FROM sys.tables as t
    JOIN sys.schemas AS s ON t.schema_id = s.schema_id
    WHERE t.name = 'orderdetails'
        AND s.name = 'stage'
)

DROP TABLE stage.orderdetails;

SELECT TOP 0
  [orderid],
  [productid],
  [qty],
  [discount],
  [unitprice]
INTO stage.orderdetails
FROM [sales].[orderdetails]



