with empregado as
(
    select 
    rowguid
    ,businessentityid as id_empregado
    ,nationalidnumber
    ,gender as genero
    ,birthdate	as data_nascimento
    ,jobtitle	as descricao_vaga
    ,loginid	as id_login
    ,hiredate	as data_contratacao
    ,currentflag
    ,sickleavehours	
    ,salariedflag
    ,maritalstatus	
    ,organizationnode	
    ,vacationhours
    ,modifieddate
    from {{ source('adventureworks_bruto_stitch', 'employee')}}  
)
select * from empregado
