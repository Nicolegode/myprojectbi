MERGE dw.dimensao_funcionario as target
USING stage.employees as source 
    ON source.empid = target.id_funcionario

WHEN NOT MATCHED 
THEN INSERT 
(
     id_funcionario
    ,ultimo_nome
    ,primeiro_nome
    ,titulo
    ,data_nascimento
    ,data_contracao
    ,endereco
    ,cidade
    ,regiao
    ,codigo_postal
    ,pais
    ,telefone
    ,superior
)

VALUES 
(
     source.empid
    ,source.lastname
    ,source.firstname
    ,source.title
    ,source.birthdate
    ,source.hiredate
    ,source.address
    ,source.city
    ,source.region
    ,source.postalcode
    ,source.country
    ,source.phone
    ,source.mgrid
)

WHEN MATCHED AND 
              source.empid != target.id_funcionario
           OR source.lastname != target.ultimo_nome
           OR source.firstname != target.primeiro_nome
           OR source.title != target.titulo
           OR source.birthdate! = target.data_nascimento
           OR source.hiredate != target.data_contracao
           OR source.address != target.endereco
           OR source.city != target.cidade
           OR source.region != target.regiao
           OR source.postalcode != target.codigo_postal
           OR source.country != target.pais
           OR source.phone != target.telefone
           OR source.mgrid != target.superior

THEN UPDATE SET 
            target.id_funcionario = source.empid
           ,target.ultimo_nome = source.lastname
           ,target.primeiro_nome = source.firstname
           ,target.titulo = source.title 
           ,target.data_nascimento = source.birthdate
           ,target.data_contracao = source.hiredate
           ,target.endereco = source.address
           ,target.cidade = source.city
           ,target.regiao = source.region
           ,target.codigo_postal= source.postalcode
           ,target.pais = source.country
           ,target.telefone = source.phone
           ,target.superior = source.mgrid;

SELECT*
FROM dw.dimensao_funcionario

----------------------------------------------------------------------------------------------------------------------------------------


MERGE dw.dimensao_cliente as target
USING stage.customers as source 
    ON source.custid = target.id_cliente
WHEN NOT MATCHED 
THEN INSERT (

    id_cliente,
    nome_companhia,
	nome_contato, 
	titulo_contato,
	endereco,
	cidade, 
	regiao, 
	codigo_postal,
	pais,
	telefone,
    fax)
    
VALUES (
     source.custid
    ,source.companyname
    ,source.contactname
    ,source.contacttitle
    ,source.address
    ,source.city
    ,source.region
    ,source.postalcode
    ,source.country
    ,source.phone
    ,source.fax
)

WHEN MATCHED AND  
              source.custid != target.id_cliente
           OR source.companyname != target.nome_companhia
           OR source.contactname != target.nome_contato
           OR source.contacttitle != target.titulo_contato
           OR source.address != target.endereco
           OR source.city != target.cidade
           OR source.region != target.regiao
           OR source.postalcode != target.codigo_postal
           OR source.country != target.pais
           OR source.phone != target.telefone
           OR source.fax != target.fax
THEN UPDATE SET 
            target.id_cliente = source.custid
           ,target.nome_companhia = source.companyname
           ,target.nome_contato = source.contacttitle
           ,target.titulo_contato = source.contacttitle
           ,target.endereco = source.address
           ,target.cidade = source.city
           ,target.regiao = source.region
           ,target.codigo_postal= source.postalcode
           ,target.pais = source.country
           ,target.telefone = source.phone
           ,target.fax = target.fax;

SELECT*
FROM dw.dimensao_cliente

--------------------------------------------------------------------------------------------------------------------------------------

MERGE dw.dimensao_local as target
USING stage.orders as source 
    ON source.orderid = target.id_pedido
WHEN NOT MATCHED 
THEN INSERT (
    
            id_pedido,
            id_cliente,
            id_funcionario,
            data_pedido,
            endereco,
	        cidade, 
	        estado, 
	        codigo_postal, 
	        pais
            )
VALUES
     (
     source.orderid
    ,source.custid
    ,source.empid
    ,source.orderdate
    ,source.shipaddress
    ,source.shipcity
    ,source.shipregion
    ,source.shippostalcode
    ,source.shipcountry
    )

WHEN MATCHED AND 

              source.orderid != target.id_pedido
           OR source.custid != target.id_cliente
           OR source.empid != target.id_funcionario
           OR source.orderdate != target.data_pedido
           OR source.shipaddress != target.endereco
           OR source.shipcity != target.cidade
           OR source.shipregion!= target.estado
           OR source.shippostalcode!= target.codigo_postal
           OR source.shipcountry != target.pais
           
THEN UPDATE SET 
            target.id_pedido = source.orderid
           ,target.id_cliente = source.custid
           ,target.id_funcionario = source.empid
           ,target.data_pedido = source.orderdate
           ,target.endereco = source.shipaddress
           ,target.cidade = source.shipcity
           ,target.estado = source.shipregion
           ,target.codigo_postal = source.shippostalcode
           ,target.pais = source.shipcountry ;

SELECT* 
FROM dw.dimensao_local

---------------------------------------------------------------------------------

MERGE dw.dimensao_produto as target
USING  
(    SELECT
     p.productid as id_produto
    ,c.categoryid as id_categoria
    ,c.categoryname as categoria
     ,c.description as sub_categoria
     ,p.productname as produto
     ,s.supplierid as id_fornecedor
     ,s.contactname as fornecedor
     ,p.unitprice as preco_unitario
     ,p.discontinued as descontinuado
    FROM stage.categories AS c
    JOIN stage.Products as p 
        ON c.categoryid = p.categoryid
    JOIN stage.suppliers as s
        ON p.supplierid = s.supplierid

   ) as source 

ON source.id_produto = target.id_produto
WHEN NOT MATCHED 
THEN INSERT 
   ( id_produto
    ,id_categoria
    ,categoria
    ,sub_categoria
    ,produto
    ,id_fornecedor
    ,fornecedor
    ,preco_unitario
    ,descontinuado
  )

VALUES 
     (
      source.id_produto
     ,source.id_categoria
     ,source.categoria
     ,source.sub_categoria
     ,source.produto
     ,source.id_fornecedor
     ,source.fornecedor
     ,source.preco_unitario
     ,source.descontinuado
     );


WHEN MATCHED AND 

              source.id_produto != target.id_produto
           OR source.id_categoria != target.id_categoria
           OR source.categoria != target.categoria
           OR source.sub_categoria != target.sub_categoria
           OR source.produto != target.produto
           OR source.id_fornecedor != target.id_fornecedor
           OR source.fornecedor != target.fornecedor
           OR source.preco_unitario != target.preco_unitario
           OR source.descontinuado != target.descontinuado

THEN UPDATE SET 
          
             
             target.id_produto = source.id_categoria
            ,target.id_categoria = source.id_categoria
            ,target.categoria = source.categoria
            ,target.sub_categoria = source.sub_categoria
            ,target.produto = source.produto
            ,target.id_fornecedor = source.id_fornecedor
            ,target.fornecedor = source.fornecedor
            ,target.preco_unitario = source.preco_unitario
            ,target.descontinuado = source.descontinuado;


SELECT* 
FROM dw.dimensao_produto


  

