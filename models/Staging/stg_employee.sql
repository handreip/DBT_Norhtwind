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
    ,currentflag as data_contratacao
    ,hiredate	as data_demissao
    ,sickleavehours	
    ,salariedflag
    ,maritalstatus	
    ,organizationnode	
    ,vacationhours
    ,modifieddate
    from {{ source('adventureworks_bruto_stitch', 'employee')}}  
)
select * from empregado
