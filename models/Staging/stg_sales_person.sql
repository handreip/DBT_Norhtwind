with vendedor as
(
    select 
    rowguid
    ,businessentityid AS id_vendedor	
    ,salesquota as quota_vendedor
    ,saleslastyear as vendas_ultimo_ano
    ,commissionpct as comissao
    ,territoryid as id_territorio
    ,bonus	
    ,salesytd
    ,modifieddate	  
    from {{ source('adventureworks_bruto_stitch', 'salesperson')}}  
)
select * from vendedor
