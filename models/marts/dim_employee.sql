with 
    empregado as (
        select * 
        from {{ref('stg_employee')}} 
    ),
    Pessoa as(
        select * 
        from {{ref('stg_person')}} 
    ),
    transformed as (
            select
                row_number() over ( order by empregado.id_empregado) as empregado_sk -- autoincremental surrogate kay
                ,empregado.id_empregado
                ,empregado.nationalidnumber
                ,empregado.genero
                ,empregado.data_nascimento
                ,empregado.descricao_vaga
                ,empregado.id_login
                ,empregado.data_contratacao
                ,Pessoa.primeiro_nome
                ,Pessoa.nome_meio
                ,Pessoa.sobrenome
                ,Pessoa.promocao_nome
            from empregado
            left join Pessoa on empregado.id_empregado = pessoa.id_pessoa
        )

select * from transformed