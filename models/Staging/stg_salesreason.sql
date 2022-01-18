with motivo_venda as (
    select 
    salesreasonid as id_tipo_razao 
    ,reasontype as tipo_razao
    ,modifieddate   as data_modificacao
    ,name as nome_tipo_de_venda
    from {{ source('adventureworks_bruto_stitch', 'salesreason')}}
)
select * from motivo_venda