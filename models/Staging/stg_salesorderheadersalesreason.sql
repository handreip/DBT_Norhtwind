with cabecalho_motivo_venda as (
    select 
    salesreasonid as id_tipo_motivo
    ,salesorderid as id_pedido
    from {{ source('adventureworks_bruto_stitch', 'salesorderheadersalesreason')}} 
)
select * from cabecalho_motivo_venda
