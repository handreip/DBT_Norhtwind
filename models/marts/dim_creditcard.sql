with 
    cartao_credito as (
        select * 
        from {{ref('stg_creditcard')}} 
    ),
    pessoa_cartao as (
        select * 
        from {{ref('stg_personcreditcard')}} 
    ),
    Pessoa as(
        select * 
        from {{ref('stg_person')}} 
    )
        , transformed as (
            select
                row_number() over ( order by cartao_credito.id_cartaodecredito) as cartao_sk -- autoincremental surrogate kay
                ,cartao_credito.tipo_cartao
                ,cartao_credito.numero_cartao        
                ,cartao_credito.exp_mes    
                ,cartao_credito.exp_ano
                ,pessoa_cartao.id_cartaodecredito
                ,pessoa_cartao.id_cartao_pessoa
                ,Pessoa.primeiro_nome
                ,Pessoa.nome_meio
                ,Pessoa.sobrenome
                ,Pessoa.promocao_nome
                from cartao_credito 
            left join pessoa_cartao on cartao_credito.id_cartaodecredito =  pessoa_cartao.id_cartaodecredito
            left join Pessoa on pessoa_cartao.id_cartao_pessoa = pessoa.id_pessoa
        )

select * from transformed