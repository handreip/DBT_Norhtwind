with cartao_de_credito as (
    select 
    creditcardid as id_cartaodecredito
    ,cardtype as tipo_cartao
    ,cardnumber as numero_cartao        
    ,expmonth as exp_mes    
    ,expyear as exp_ano
    from {{ source('adventureworks_bruto_stitch', 'creditcard')}}
)
select * from cartao_de_credito
