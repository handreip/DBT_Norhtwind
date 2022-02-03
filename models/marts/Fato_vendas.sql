with 
    Customers as (
    select 
        cliente_sk
        ,id_cliente
        ,id_pessoa
        ,primeiro_nome
        ,nome_meio
        ,sobrenome
        ,promocao_nome
    from {{ ref('dim_customer')}}
    ),
    adress as (
    select
        endereco_sk 
        ,id_endereco
        ,cidade
        ,nome_estado_provinvia
        ,nome_pais_regiao
    from {{ ref('dim_address')}}
    ),
    creditcard as (
    select
        cartao_sk
        ,id_cartaodecredito
        ,tipo_cartao 
    from {{ ref('dim_creditcard')}}  
    ),
    motivo_venda as (
    select 
        id_pedido
        ,tipo_motivo
    from {{ ref('dim_salesreason')}}  
    ),
    produto as (
    select 
        id_produto
        ,nome_produto
        ,custo_padrao
        ,lista_de_preco
        ,numero_produto
        ,dias_para_produzir
        ,estoque_seguranca
    from {{ ref('stg_products')}}  
    ),
    salesorderheader as (
    select 
        salesorderheader.id_pedido
        ,salesorderheader.data_pedido
        ,salesorderheader.status
        ,COALESCE(motivo_venda.tipo_motivo, 'sem motivo') as motivo_venda
        ,Customers.cliente_sk as cliente_fk
        ,Customers.primeiro_nome
        ,Customers.nome_meio
        ,Customers.sobrenome
        ,creditcard.tipo_cartao
        ,adress.id_endereco
        ,adress.cidade
        ,adress.nome_estado_provinvia
        ,adress.nome_pais_regiao
        from {{ ref('stg_salesorderheader')}} as salesorderheader  
        left join Customers on salesorderheader.id_cliente = Customers.id_cliente
        left join adress on salesorderheader.id_local_entrega = adress.id_endereco
        left join creditcard on salesorderheader.id_cartaodecredito = creditcard.cartao_sk
        left join motivo_venda on salesorderheader.id_pedido = motivo_venda.id_pedido      
    ),
    Sales_order_detail as (
    select
        Sales_order_detail.id_pedido
        ,Sales_order_detail.id_detalhe_pedido
        ,produto.nome_produto
        ,Sales_order_detail.quantidade_pedido as Quantidade_comprada
        ,Sales_order_detail.preco_unitario 
        from {{ ref('stg_salesorderdetail')}} as Sales_order_detail
        left join produto on Sales_order_detail.id_produto = produto.id_produto
    ),
    final as (
    select
        salesorderheader.id_pedido
        ,salesorderheader.data_pedido
        ,salesorderheader.status
        ,salesorderheader.motivo_venda
        ,salesorderheader.cliente_fk
        ,salesorderheader.primeiro_nome
        ,salesorderheader.nome_meio
        ,salesorderheader.sobrenome
        ,salesorderheader.tipo_cartao
        ,salesorderheader.id_endereco
        ,salesorderheader.cidade
        ,salesorderheader.nome_estado_provinvia
        ,salesorderheader.nome_pais_regiao
        ,Sales_order_detail.id_detalhe_pedido
        ,Sales_order_detail.nome_produto
        ,Sales_order_detail.Quantidade_comprada
        ,Sales_order_detail.preco_unitario 
        from salesorderheader 
        left join Sales_order_detail on salesorderheader.id_pedido = Sales_order_detail.id_pedido
    )
    select * from final
