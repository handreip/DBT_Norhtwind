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
    Sales_order_detail as (
        select
        Sales_order_detail.id_pedido
        ,Sales_order_detail.id_detalhe_pedido
        ,produto.nome_produto
        ,Sum(Sales_order_detail.quantidade_pedido) as Quantidade_comprada
        ,Sales_order_detail.preco_unitario
        ,Sales_order_detail.desconto_em_porcentagem
        ,Sales_order_detail.numero_rastreamento
        from {{ ref('stg_salesorderdetail')}} as Sales_order_detail
        left join produto on Sales_order_detail.id_produto = produto.id_produto
        )
select * from Sales_order_detail
