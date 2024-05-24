SELECT TOP (1000) 
       [shipaddress] as endereco
      ,[shipcity] as cidade
      ,[shipregion] as estado
      ,[shippostalcode] as codigo_postal
      ,[shipcountry] as pais
  FROM [Sales].[Orders] 