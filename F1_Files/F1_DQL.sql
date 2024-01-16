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
select count(cd_equipe), count(distinct cd_equipe), count(all cd_equipe)
from t_f1_piloto
--------------------------------------------------------------------------------
select count(all cd_resultado) from t_f1_resultado;
--------------------------------------------------------------------------------
select stddev_pop(all cd_resultado)
from t_f1_resultado;
--------------------------------------------------------------------------------
select cd_equipe, count(cd_depto)
from t_f1_equipe
group by cd_equipe;
--------------------------------------------------------------------------------
select 'equipe', cd_equipe, count(nr_carro)
from t_f1_piloto
group by 'equipe', cd_equipe;
--------------------------------------------------------------------------------
select rownum, V.*
from (select cd_equipe, count(nr_carro)
from t_f1_piloto group by cd_equipe) V;
--------------------------------------------------------------------------------
select count(nr_carro)
from t_f1_piloto
group by cd_equipe;
--------------------------------------------------------------------------------
select cd_equipe, nr_titulos, count(nr_carro)
from t_f1_piloto
group by cd_equipe, nr_titulos;
--------------------------------------------------------------------------------
select cd_equipe, count(nr_carro)
from t_f1_piloto
where nr_titulos > 2
group by cd_equipe;
--------------------------------------------------------------------------------
select cd_equipe, count(nr_carro)
from t_f1_piloto
group by cd_equipe
having cd_equipe < 5;
--------------------------------------------------------------------------------
select cd_equipe, count(nr_carro)
from t_f1_piloto
group by cd_equipe
having count(nr_carro) < 5;
--------------------------------------------------------------------------------
select cd_equipe, count(nr_carro)
from t_f1_piloto
where nr_titulos < 2
group by cd_equipe
having count(nr_carro) < 5;
--------------------------------------------------------------------------------
select nr_carro 
from t_f1_resultado
where pontuacao > (select avg(pontuacao)from t_f1_resultado);
--------------------------------------------------------------------------------
select cd_corrida, count(*)
from t_f1_resultado
group by cd_corrida
having count(*) = (select max(count(*)) from t_f1_resultado group by cd_corrida);
--------------------------------------------------------------------------------
