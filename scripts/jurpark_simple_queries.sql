select avg(cost)
from jurpark.entertainment
where req_age < 18;

update jurpark.species
set section_id = 7
where habitat like 'Forest';

select sum(population)
from jurpark.species
where species.feed like 'o';

update jurpark.entertainment
set cost = cost + 10
where cost < 100;

insert into jurpark.individual_being values (10, 2, 'f', '2009-12-24', 'Echo');

delete from jurpark.individual_being
where individual_id = 10;

select count(*)
from jurpark.individual_being
where sex like 'f';

update jurpark.profession
set salary = salary * 1.5
where name like '%Veterinarian';

select *
from jurpark.species
where section_id = 6;

select count(employee_id)
from jurpark.employee_profession
where profession_id = 9;

select population, habitat
from jurpark.species
where population > 50;
