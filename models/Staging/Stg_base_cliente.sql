
with clientes as (
    select 
    customerid as id_cliente   
    ,personid as id_pessoa
    ,territoryid as id_territorio
    ,modifieddate
    ,storeid as id_loja
    ,rowguid
    from {{ source('db_adventure_works_bruto', 'customer')}}
)
select * from clientes