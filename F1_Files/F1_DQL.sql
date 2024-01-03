select e.cd_equipe, e.nm_equipe, p.nr_carro
from t_f1_equipe e, t_f1_contrato_piloto p
where e.cd_equipe = p.cd_equipe;
--------------------------------------------------------------------------------
select e.cd_equipe, e.nm_equipe, p.nr_carro
from t_f1_equipe e inner join t_f1_contrato_piloto p
on e.cd_equipe = p.cd_equipe;
--------------------------------------------------------------------------------
select cd_equipe, e.nm_equipe, p.nr_carro
from t_f1_equipe e inner join t_f1_contrato_piloto p
using (cd_equipe);
--------------------------------------------------------------------------------
select e.cd_equipe, e.nm_equipe, p.nr_carro
from t_f1_equipe e left outer join t_f1_contrato_piloto p
on e.cd_equipe = p.cd_equipe;
--------------------------------------------------------------------------------
select e.cd_equipe, e.nm_equipe, p.nr_carro
from t_f1_equipe e right outer join t_f1_contrato_piloto p
on e.cd_equipe = p.cd_equipe;
--------------------------------------------------------------------------------
select e.cd_equipe, e.nm_equipe, p.nr_carro
from t_f1_equipe e full outer join t_f1_contrato_piloto p
on e.cd_equipe = p.cd_equipe;
--------------------------------------------------------------------------------
select max(cd_equipe) from t_f1_contrato_piloto;
--------------------------------------------------------------------------------
desc t_f1_patrocinador
--------------------------------------------------------------------------------
select cd_patrocinador, nm_patrocinador, cd_contrato
from t_f1_patrocinador;
--------------------------------------------------------------------------------
select count(*), count(dt_fim) from t_f1_contrato_piloto;
--------------------------------------------------------------------------------
select count(*), sum(nr_carro), avg(nr_carro) from t_f1_resultado;
--------------------------------------------------------------------------------
select avg(nvl(nr_carro, 0)) from t_f1_resultado;
--------------------------------------------------------------------------------
