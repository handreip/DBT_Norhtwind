with clientes as (
    select 
    customerid as id_cliente   
    ,personid as id_pessoa
    ,territoryid as id_territorio
    ,modifieddate
    ,storeid as id_loja
    --,rowguid
    from {{ source('adventureworks_bruto_stitch', 'customer')}}
)
select * from clientes
