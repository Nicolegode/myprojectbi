

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

FROM Production.Products;





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
FROM [Production].[suppliers];





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
