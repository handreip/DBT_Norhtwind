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
)
select * from estado_provincia

