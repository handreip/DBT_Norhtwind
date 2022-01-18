with cabecalho_razao_venda as (
    select 
    salesreasonid as id_tipo_razao
    ,salesorderid as id_pedido
    from {{ source('adventureworks_bruto_stitch', 'salesorderheadersalesreason')}} 
)
select * from cabecalho_razao_venda
