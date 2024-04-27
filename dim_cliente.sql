SELECT TOP (1000)
       [custid] as id_cliente
      ,[companyname] as nome_empresa
      ,[contactname] as nome_contato
      ,[contacttitle] as _titulo_contato
      ,[address] as endereco 
      ,[city] as cidade
      ,[region] as regiao
      ,[postalcode] as codigo_postal
      ,[country] as pais
      ,[phone] as telefone
      ,[fax] 
  FROM [Sales].[Customers]