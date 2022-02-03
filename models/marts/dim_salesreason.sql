with 
    cabecalho_motivo_venda as(
        select * 
        from {{ref('stg_salesorderheadersalesreason')}} 
    ),
    motivo_venda as (
        select * 
        from {{ref('stg_salesreason')}} 
    ),
    transformed as (
            select
            --row_number() over ( order by cabecalho_motivo_venda.id_pedido) as id_pedido_sk -- autoincremental surrogate kay
            cabecalho_motivo_venda.id_pedido
            ,motivo_venda.id_tipo_motivo
            ,motivo_venda.tipo_motivo
            ,motivo_venda.nome_tipo_de_venda
            from cabecalho_motivo_venda
            left join motivo_venda on cabecalho_motivo_venda.id_tipo_motivo = motivo_venda.id_tipo_motivo
            where cabecalho_motivo_venda.id_pedido is not NULL 
        )

select * from transformed