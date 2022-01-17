with pessoa as (
    select 
    rowguid 
    ,businessentityid as id_pessoa
    ,firstname as primeiro_nome
    ,middlename as nome_meio
    ,lastname as sobrenome
    ,emailpromotion as promocao_nome
    ,suffix
from {{ source('adventureworks_bruto_stitch', 'person')}}  
)
select * from pessoa
order by id_pessoa