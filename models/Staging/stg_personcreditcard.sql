with nome_cartao as(
    select
    creditcardid as id_cartaodecredito
    ,businessentityid as id_cartao_pessoa
    ,modifieddate
    from {{ source('adventureworks_bruto_stitch', 'personcreditcard')}}
)
select * from nome_cartao