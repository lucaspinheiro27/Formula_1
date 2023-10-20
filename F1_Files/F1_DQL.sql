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
COMMIT;
