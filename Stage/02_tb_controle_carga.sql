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
    tipo_carga varchar(1000),
    coluna_incremento varchar(1000),
    valor_ultimo_incremento varchar(1000)
)

END 

select * from dbo.controle_carga

INSERT INTO dbo.controle_carga (nome_tabela, tipo_carga, coluna_incremento, valor_ultimo_incremento)
VALUES('employees', 'incremental','modified_by', NULL),
      ('customers', 'incremental','modified_by',NULL),
      ('orders', 'incremental','orderid' ,NULL),
      ('products','incremental', 'modified_by', NULL),
      ('suppliers','full', NULL, NULL),
      ('categories', 'incremental', 'modified_by', NULL),
      ('orderdetails','incremental','orderid', NULL)




 
