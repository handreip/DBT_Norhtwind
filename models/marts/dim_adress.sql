with 
    endereco as (
        select * 
        from {{ref('Stg_address')}} 
    ),
    estado as (
        select * 
        from {{ref('Stg_stateprovince')}} 
    ),
    pais as (
        select *
        from {{ref('Stg_countryregion')}
    ),
    transformed as (
            select
            row_number() over ( order by endereco.rowguid) as endereco_sk -- autoincremental surrogate kay
            ,endereco.id_endereco
            ,endereco.id_estado_provincia
            ,endereco.cidade
            ,endereco.cod_postal
            ,endereco.locacao_especial
            ,endereco.endereco_linha_1
            ,endereco.endereco_linha_2
            ,estado.nome_estado_provinvia
            ,pais.nome_pais_regiao
            left join estado on endereco.id_estado_provincia = estado.id_estado_provincia
            left join pais on   estado.cod_pais_regiao = pais.cod_pais_regiao
            )

select * from transformed

            
