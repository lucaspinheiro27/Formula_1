
select nr_carro, cd_equipe, nm_piloto, dt_nascimento, nr_titulos
from t_f1_piloto
--------------------------------------------------------------------------------
select p.nr_carro, p.cd_equipe, p.nm_piloto, p.dt_nascimento, p.nr_titulos, e.cd_equipe, e.nm_equipe, e.sg_equipe, e.cd_depto
from t_f1_piloto p, t_f1_equipe e
--------------------------------------------------------------------------------
select p.nr_carro, p.cd_equipe, p.nm_piloto, p.dt_nascimento, p.nr_titulos, e.cd_equipe, e.nm_equipe, e.sg_equipe, e.cd_depto
from t_f1_piloto p, t_f1_equipe e
where e.cd_equipe = p.cd_equipe
and nm_equipe = 'Redbull';
--------------------------------------------------------------------------------
update t_f1_equipe
set nm_equipe = 'RedBull'  --- Atualize para qualquer nome de uma das equipes
where cd_equipe = 1;
--------------------------------------------------------------------------------
update t_f1_equipe
set nm_equipe = 'Redbull'  --- Atualize para qualquer nome de uma das equipes
where cd_equipe =
    (select cd_equipe
    from t_f1_piloto
    where nr_carro = 1)
--------------------------------------------------------------------------------
select p.nr_carro, p.cd_equipe, p.nm_piloto, p.dt_nascimento, p.nr_titulos, e.cd_equipe, e.nm_equipe, e.sg_equipe, e.cd_depto
from t_f1_piloto p, t_f1_equipe e
where e.cd_equipe = p.cd_equipe
and (nm_equipe = 'Redbull'
or nm_equipe = 'Ferrari');
--------------------------------------------------------------------------------
select p.nr_carro, p.cd_equipe, p.nm_piloto, p.dt_nascimento, p.nr_titulos, e.cd_equipe, e.nm_equipe, e.sg_equipe, e.cd_depto
from t_f1_piloto p, t_f1_equipe e
where e.cd_equipe = p.cd_equipe
and not (nm_equipe = 'Redbull'
or nm_equipe = 'Ferrari');
--------------------------------------------------------------------------------
select p.nr_carro, p.cd_equipe, p.nm_piloto, p.dt_nascimento, p.nr_titulos, e.cd_equipe, e.nm_equipe, e.sg_equipe, e.cd_depto, e.nm_equipe
from t_f1_piloto p, t_f1_equipe e
where e.cd_equipe = p.cd_equipe
and e.nm_equipe != 'Redbull'
and e.nm_equipe != 'Ferrari';
--------------------------------------------------------------------------------
select p.nr_carro, p.cd_equipe, p.nm_piloto, p.dt_nascimento, p.nr_titulos, e.cd_equipe, e.nm_equipe, e.sg_equipe, e.cd_depto, e.nm_equipe
from t_f1_piloto p, t_f1_equipe e
where e.cd_equipe = p.cd_equipe
and e.nm_equipe in ('Redbull','Ferrari'); 
--------------------------------------------------------------------------------
select p.nr_carro, p.cd_equipe, p.nm_piloto, p.dt_nascimento, p.nr_titulos, e.cd_equipe, e.nm_equipe, e.sg_equipe, e.cd_depto, e.nm_equipe
from t_f1_piloto p, t_f1_equipe e
where e.cd_equipe = p.cd_equipe
and e.nm_equipe not in ('Redbull','Ferrari');
--------------------------------------------------------------------------------
select cd_patrocinador, nm_patrocinador, cd_contrato
from t_f1_patrocinador
where cd_contrato not between 10 and 20
--------------------------------------------------------------------------------
select cd_patrocinador, nm_patrocinador, cd_contrato
from t_f1_patrocinador
where cd_contrato < 10 or cd_contrato > 20
--------------------------------------------------------------------------------
select cd_patrocinador, nm_patrocinador, cd_contrato
from t_f1_patrocinador
where nm_patrocinador like '_po______';
--------------------------------------------------------------------------------
select cd_patrocinador, nm_patrocinador, cd_contrato
from t_f1_patrocinador
where nm_patrocinador like '_p%';
--------------------------------------------------------------------------------
select cd_patrocinador, nm_patrocinador, cd_contrato
from t_f1_patrocinador
where upper(nm_patrocinador) like '%B';
--------------------------------------------------------------------------------
select nr_carro, cd_equipe, nm_piloto, dt_nascimento, nr_titulos
from t_f1_piloto
where nr_titulos is null or  nr_titulos != 2;
--------------------------------------------------------------------------------
select nr_carro, cd_equipe, nm_piloto, dt_nascimento, nr_titulos
from t_f1_piloto
where nvl(nr_titulos, -999) != 2; 
--------------------------------------------------------------------------------
------------------------EXPLORANDO JOINS----------------------------------------
select p.nm_piloto, e.nm_equipe
from t_f1_piloto p, t_f1_equipe e
where p.cd_equipe = e.cd_equipe;
--------------------------------------------------------------------------------
select p.nm_piloto, r.cd_resultado
from t_f1_piloto p, t_f1_resultado r;
--------------------------------------------------------------------------------
select p.dt_nascimento, e.sg_equipe
from t_f1_piloto p, t_f1_equipe e
where p.cd_equipe = e.cd_equipe;
--------------------------------------------------------------------------------
select c.cd_corrida, c.dt_corrida, p.cd_equipe, p.nr_carro
from t_f1_corrida c, t_f1_contrato_piloto p
where c.dt_corrida between p.dt_inicio and p.dt_fim;
--------------------------------------------------------------------------------
select * from t_f1_departamento

select * from t_f1_equipe
--------------------------------------------------------------------------------
select d.sg_depto, e.sg_equipe, d.nm_depto, e.nm_equipe
from t_f1_departamento d, t_f1_equipe e
where e.cd_depto = d.cd_depto;
--------------------------------------------------------------------------------
--- Podemos fazer um outer join para filtrar os cd_depto n?o filtrados por uma condi??o em uma das tabelas.
select d.sg_depto, e.sg_equipe, d.nm_depto, e.nm_equipe
from t_f1_departamento d, t_f1_equipe e
where e.cd_depto = d.cd_depto (+);
--------------------------------------------------------------------------------
describe t_f1_circuito
describe t_f1_corrida
describe t_f1_resultado
-----------------------------VIEW-----------------------------------------------
create view my_resultado 
as select c.cd_circuito, c.nm_circuito, i.cd_corrida
from t_f1_circuito c, t_f1_corrida i
where c.cd_circuito (+) = i.cd_circuito

select a.cd_circuito, a.nm_circuito, r.cd_corrida, r.cd_resultado
from my_resultado a, t_f1_resultado r
where a.cd_corrida (+) = r.cd_corrida
----------------------------INLINE----------------------------------------------
select a.cd_circuito, a.nm_circuito, r.cd_corrida, r.cd_resultado
from (select c.cd_circuito, c.nm_circuito, i.cd_corrida
    from t_f1_circuito c, t_f1_corrida i
    where c.cd_circuito (+) = i.cd_circuito) a, t_f1_resultado r
    where a.cd_corrida (+) = r.cd_corrida
--------------------------------------------------------------------------------
select p.cd_equipe, p.nr_carro, t.nm_patrocinador
from t_f1_contrato_piloto p, t_f1_patrocinador t
where p.cd_contrato = t.cd_contrato
------------------------SEM DUPLICADOS------------------------------------------
select d.sg_depto, e.sg_equipe, d.nm_depto, e.nm_equipe
from t_f1_departamento d, t_f1_equipe e
where e.cd_depto = d.cd_depto (+)
union
select d.sg_depto, e.sg_equipe, d.nm_depto, e.nm_equipe
from t_f1_departamento d, t_f1_equipe e
where e.cd_depto(+) = d.cd_depto
--------------------------------------------------------------------------------
select nm_equipe from t_f1_equipe
--------------------------------------------------------------------------------
select e1.nm_equipe, e2.nm_equipe
from t_f1_equipe e1, t_f1_equipe e2
where e1.cd_equipe < e2.cd_equipe
----------------------Self Non-Equi-Joins---------------------------------------
select e1.nm_equipe, e2.nm_equipe, sysdate + rownum match_date
from t_f1_equipe e1, t_f1_equipe e2
where e1.cd_equipe > e2.cd_equipe
---------------------- Subquery-------------------------------------------------
select e.cd_equipe, e.nm_equipe
from t_f1_equipe e
where exists (
    select *
    from t_f1_departamento p
    where p.cd_depto < 5
    and e.cd_depto = p.cd_depto
)
-----------------------Join-----------------------------------------------------
select e.cd_equipe, e.nm_equipe
from t_f1_equipe e, t_f1_departamento p
where e.cd_depto = p.cd_depto
    and p.cd_depto < 5;
--------------------------------------------------------------------------------
desc t_f1_circuito
desc t_f1_corrida
--------------------------------------------------------------------------------
create view circuito_corridas as
select c.cd_circuito, c.nm_circuito, c.localizacao, e.nm_equipe, e.cd_equipe
from t_f1_circuito c, t_f1_equipe e
where c.cd_circuito = e.cd_equipe;

select * from circuito_corridas
----------------------------INSERT JOIN-----------------------------------------
insert into circuito_corridas (cd_circuito, nm_circuito)
values (3, 'Grande Pr?mio do Canad?');
---------------Comando n?o permitido--------------------------------------------
insert into circuito_corridas (cd_circuito, nm_circuito, nm_equipe, cd_equipe)
values (4, 'Grande Pr?mio da It?lia', 'Alfa Romeo', 6);
---------------------------DELETE JOIN------------------------------------------
delete from circuito_corridas 
where cd_circuito = 3 and nm_circuito = 'Grande Pr?mio do Canad?';
-------------------Comando n?o permitido----------------------------------------
create view corrida_circ1 as
select d1.cd_depto, d1.nm_depto, d2.nm_equipe
from t_f1_departamento d1, t_f1_equipe d2
where d1.cd_depto = d2.cd_depto
with check option;

desc corrida_circ1

delete from corrida_circ
where cd_depto = 5;
------------------------UPDATE JOIN---------------------------------------------
update circuito_corridas
set nm_equipe = 'Alfa Romeo'
where cd_circuito = 3
--------------------------------------------------------------------------------








    
















