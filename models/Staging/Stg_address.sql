with endereco_cidade as (
    select
    addressid as id_endereco
    ,stateprovinceid as id_estado_provincia
    ,city as cidade
    ,postalcode as cod_postal
    ,spatiallocation as locacao_especial
    ,addressline1 as endereco_linha_1
    ,addressline2 as endereco_linha_2
    ,modifieddate as data_modificacao
    ,rowguid
    from {{ source('adventureworks_bruto_stitch', 'address')}}
)
select * from endereco_cidade
