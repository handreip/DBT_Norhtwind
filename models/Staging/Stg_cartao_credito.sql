with cartao_de_credito as (
    select 
    creditcardid as id_cartaodecredito
    ,cardtype as tipo_cartao
    ,cardnumber as numero_cartao        
    ,expmonth as exp_mes    
    ,expyear as exp_ano
    from {{ source('adventureworks_bruto_stitch', 'creditcard')}}
),
busca_nome_cartao as(
    select
    creditcardid as id_cartaodecredito
    ,businessentityid as id_negocio_pessoa
    ,modifieddate
    from {{ source('adventureworks_bruto_stitch', 'personcreditcard')}}
),
pessoa as (
    select 
    businessentityid as id_negocio_pessoa
    ,rowguid
    ,firstname
    ,middlename
    ,lastname 
    ,concat(firstname," " , middlename, " " ,lastname ) as nome_completo_cartao
    ,emailpromotion as promocao_nome
    from {{ source('adventureworks_bruto_stitch', 'person')}}  
),
juntar_dados as(
    select 
    cartao_de_credito.id_cartaodecredito
    ,tipo_cartao
    ,numero_cartao
    ,pessoa.id_negocio_pessoa
    ,nome_completo_cartao
from cartao_de_credito 
left join busca_nome_cartao on cartao_de_credito.id_cartaodecredito = busca_nome_cartao.id_cartaodecredito
left join pessoa on busca_nome_cartao.id_negocio_pessoa = pessoa.id_negocio_pessoa
)
select * from juntar_dados
