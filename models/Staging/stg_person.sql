with pessoa as (
    select 
    businessentityid as id_cliente
    ,rowguid
    ,firstname
    ,middlename
    ,lastname 
    ,concat(firstname," " , middlename, " " ,lastname ) as nome_completo_pessoa_teste
    ,emailpromotion as promocao_nome
    from {{ source('adventureworks_bruto_stitch', 'person')}}  
)
select 
    id_cliente
    ,rowguid
    ,(CASE WHEN nome_completo_pessoa_teste IS NULL THEN concat(firstname, " ", lastname ) ELSE nome_completo_pessoa_teste END) AS nome_completo_pessoa 
    ,promocao_nome
 from pessoa
