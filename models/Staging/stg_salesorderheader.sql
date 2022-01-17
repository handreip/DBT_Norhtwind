with cabecalho_pedidos as (
    select 
    salesorderid as id_pedido
    ,purchaseordernumber as ordem_compra
    ,shipmethodid as id_tipo_frete
    ,billtoaddressid 
    ,salespersonid as id_pessoa_vendas
    ,customerid as id_cliente    
    ,territoryid as id_territorio
    ,shiptoaddressid as id_local_entrega
    ,currencyrateid as id_moeda
    ,modifieddate as data_modificacao
    ,orderdate as data_pedido
    ,subtotal
    ,status
    ,creditcardid as id_cartaodecredito
    ,creditcardapprovalcode as codigo_aprovacao_cartaodecredito
    ,accountnumber as numero_conta
    ,revisionnumber as numero_revisao
    ,freight as frete
    ,duedate as prazo_final
    ,totaldue
    ,shipdate as data_envio
    from {{ source('adventureworks_bruto_stitch', 'salesorderheader')}}
)
select * from cabecalho_pedidos
