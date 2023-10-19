-------Explorando um pouco mais do where----------------------------------------

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








