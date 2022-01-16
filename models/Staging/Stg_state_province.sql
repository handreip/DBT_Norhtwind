with estado_provincia as (
    select
    stateprovinceid as id_estado_provincia
    ,countryregioncode as cod_pais_regiao
    ,stateprovincecode as cod_estado_provincia
    ,name as nome_estado_provinvia
    ,territoryid as id_territorio
    ,rowguid
    ,modifieddate as data_modificacao_estado_provincia
    from {{ source('adventureworks_bruto_stitch', 'stateprovince')}}
),
pais_regiao as (
    select
    countryregioncode as cod_pais_regiao
    ,name as nome_pais_regiao
    ,modifieddate as data_modificacao_pais_regiao
    from {{ source('adventureworks_bruto_stitch', 'countryregion')}}
),
juntar_dados_regiao as (
select
id_estado_provincia
,estado_provincia.cod_pais_regiao
,cod_estado_provincia
,nome_estado_provinvia
,nome_pais_regiao
from estado_provincia
left join pais_regiao on estado_provincia.cod_pais_regiao = pais_regiao.cod_pais_regiao
)
select * from juntar_dados_regiao
