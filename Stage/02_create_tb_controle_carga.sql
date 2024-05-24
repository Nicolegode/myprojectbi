IF NOT EXISTS(
    SELECT *
    FROM sys.tables as t
    JOIN sys.schemas AS s ON t.schema_id = s.schema_id
    WHERE t.name = 'controle_carga'
        AND s.name = 'dbo')

BEGIN
CREATE TABLE dbo.controle_carga
( 
    nome_tabela varchar(1000),
    ultima_chave_inserida int
)
INSERT INTO dbo.controle_carga (nome_tabela, ultima_chave_inserida)
VALUES('employees', NULL),
      ('Customers',NULL),
      ('orders',NULL),
      ('products', NULL),
      ('suppliers',NULL),
      ('categories', NULL),
      ('orderdetails', NULL)
END


-- DROP TABLE dbo.controle_carga