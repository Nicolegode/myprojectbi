SELECT TOP (1000)
       [empid] as id_funcionario
      ,[lastname] as ultimo_nome
      ,[firstname] as primeiro_nome
      ,[title] as titulo
      ,[birthdate] as data_nascimento
      ,[hiredate] as data_contracao
      ,[address] as endereco 
      ,[city] as cidade
      ,[region] as regiao
      ,[postalcode] as codigo_postal
      ,[country] as pais
      ,[phone] as telefone
  FROM [HR].[Employees]