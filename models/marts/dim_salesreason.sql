with 
    motivo_venda as (
        select * 
        from {{ref('stg_salesreason')}} 
    ),
    cabecalho_motivo_venda as(
        select * 
        from {{ref('stg_salesorderheadersalesreason')}} 
    ),
    transformed as (
            select
                row_number() over ( order by cabecalho_motivo_venda.id_pedido) as id_pedido_sk -- autoincremental surrogate kay
                ,motivo_venda.id_tipo_razao 
                ,motivo_venda.tipo_razao
                ,motivo_venda.nome_tipo_de_venda
            from motivo_venda
            left join cabecalho_motivo_venda on motivo_venda.id_tipo_razao = cabecalho_motivo_venda.id_tipo_razao
        )

select * from transformed