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
--- Podemos fazer um outer join para filtrar os cd_depto não filtrados por uma condição em uma das tabelas.
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







