with 
    Customers as (
    select * 
    from {{ ref('dim_customer')}}
    ),
    adress as (
    select * 
    from {{ ref('dim_address')}}
    ),
    creditcard as (
    select * 
    from {{ ref('dim_creditcard')}}  
    ),
    motivo_venda as (
    select * 
    from {{ ref('dim_salesreason')}}  
    ),


