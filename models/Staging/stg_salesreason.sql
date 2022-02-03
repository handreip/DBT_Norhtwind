with motivo_venda as (
    select 
    salesreasonid as id_tipo_motivo
    ,reasontype as tipo_motivo
    ,modifieddate   as data_modificacao
    ,name as nome_tipo_de_venda
    from {{ source('adventureworks_bruto_stitch', 'salesreason')}}
)
select * from motivo_venda