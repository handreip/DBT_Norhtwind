with pais as (
    select
    countryregioncode as cod_pais_regiao
    ,name as nome_pais_regiao
    ,modifieddate as data_modificacao_pais_regiao
    from {{ source('adventureworks_bruto_stitch', 'countryregion')}}
)
select * from pais