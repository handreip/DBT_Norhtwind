with detalhes_pedidos as (
    select 
    salesorderid as id_pedido
    ,salesorderdetailid as id_detalhe_pedido
    ,specialofferid as oferta_especial
    ,productid as id_produto
    ,orderqty as quantidade_pedido
    ,unitprice as preco_unitario
    ,unitpricediscount as desconto_por_unidade
    ,modifieddate as data_modificacao
    ,carriertrackingnumber as numero_rastreamento
    from {{ source('adventureworks_bruto_stitch', 'salesorderdetail')}}
)
select * from detalhes_pedidos
