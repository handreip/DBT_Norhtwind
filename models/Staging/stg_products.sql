with produtos as (
    select 
    productid as id_produto
    ,name as nome_produto
    ,sellenddate as data_venda
    ,safetystocklevel as estoque_seguranca
    ,class as classe_produto
    ,productnumber as numero_produto
    ,modifieddate as data_modificacao
    ,productmodelid as id_modelo_produto
    ,weightunitmeasurecode as cod_unidade_peso
    ,standardcost as custo_padrao
    ,style as estilo
    ,sizeunitmeasurecode as cod_unidad_medida
    ,productsubcategoryid as id_subcategoria_produto
    ,listprice as lista_de_preco
    ,daystomanufacture as dias_para_produzir
    ,productline as linha_producao
    ,size as tamanho
    ,color as cor
    ,sellstartdate as data_inicio_venda
    ,weight as peso
from {{ source('adventureworks_bruto_stitch', 'product')}}
order by id_produto
)
select * from produtos
