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
