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
values (3, 'Grande Prêmio do Canadá');
---------------Comando não permitido--------------------------------------------
insert into circuito_corridas (cd_circuito, nm_circuito, nm_equipe, cd_equipe)
values (4, 'Grande Prêmio da Itália', 'Alfa Romeo', 6);
---------------------------DELETE JOIN------------------------------------------
delete from circuito_corridas 
where cd_circuito = 3 and nm_circuito = 'Grande Prêmio do Canadá';
-------------------Comando não permitido----------------------------------------
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







