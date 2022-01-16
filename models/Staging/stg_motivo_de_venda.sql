with cabecalho_razao_venda as (
    select 
    salesreasonid as id_tipo_razao
    ,salesorderid as id_pedido
    from {{ source('adventureworks_bruto_stitch', 'salesorderheadersalesreason')}} 
),
motivo_venda as (
    select 
    salesreasonid as id_tipo_razao 
    ,reasontype as tipo_razao
    ,modifieddate   as data_modificacao
    ,name as nome_tipo_de_venda
    from {{ source('adventureworks_bruto_stitch', 'salesreason')}}
),
juntar_razao_venda as (
select
    id_pedido
    ,cabecalho_razao_venda.id_tipo_razao
    ,tipo_razao
    ,nome_tipo_de_venda
    ,data_modificacao
from cabecalho_razao_venda 
left join motivo_venda on cabecalho_razao_venda.id_tipo_razao = motivo_venda.id_tipo_razao  
)
select * from juntar_razao_venda
