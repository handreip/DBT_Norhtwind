with 
    clientes as (
        select * 
        from {{ref('stg_customer')}} 
    ),
    Pessoa as(
        select * 
        from {{ref('stg_person')}} 
    )
        , transformed as (
            select
                row_number() over ( order by clientes.id_cliente ) as cliente_sk -- autoincremental surrogate kay
                ,clientes.id_cliente
                ,clientes.id_pessoa
                ,clientes.id_territorio
                ,clientes.modifieddate
                ,clientes.id_loja
                ,Pessoa.primeiro_nome
                ,Pessoa.nome_meio
                ,Pessoa.sobrenome
                ,Pessoa.promocao_nome
            from clientes
            left join Pessoa on clientes.id_pessoa = pessoa.id_pessoa
            where clientes.id_pessoa is not NULL 
        )

select * from transformed