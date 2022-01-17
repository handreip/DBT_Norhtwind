with 
    vendedor as (
        select * 
        from {{ref('stg_sales_person')}} 
    ),
    Pessoa as(
        select * 
        from {{ref('stg_person')}} 
    )
        , transformed as (
            select
                row_number() over ( order by vendedor.id_vendedor) as vendedor_sk -- autoincremental surrogate kay
                ,vendedor.id_vendedor	
                ,vendedor.quota_vendedor
                ,vendedor.vendas_ultimo_ano
                ,vendedor.comissao
                ,vendedor.id_territorio
                ,vendedor.bonus	
                ,vendedor.salesytd
                ,Pessoa.primeiro_nome
                ,Pessoa.nome_meio
                ,Pessoa.sobrenome
                ,Pessoa.promocao_nome
            from vendedor
            left join Pessoa on vendedor.id_vendedor = pessoa.id_pessoa
            ---where clientes.id_pessoa is not NULL 
        )

select * from transformed