-- Повторяющиеся виды развлечений
select e.entertainment_id, count(sa.day) as planned_quantity
from jurpark.entertainment e
join jurpark.section_activity sa on e.entertainment_id = sa.entertainment_id
group by e.entertainment_id
having count(sa.day) > 1;


-- Количество видов развлечений, которые можно посещать для каждого минимально требуемого возраста
select req_age, count(*) as amount_entertainment
from jurpark.entertainment
group by req_age
order by req_age;


-- Населенность зон обитания
select s.habitat, count(f.individual_id) as population
from jurpark.individual_being as f
join jurpark.species s on s.species_id = f.species_id
group by s.habitat
order by count(f.individual_id) desc;


-- Доход отдельных секций и парка в целом
select section_id, sum(cost) over (partition by section_id) as section_revenue, sum(cost) over () as park_revenue
from jurpark.section_activity sa
join jurpark.entertainment e on sa.entertainment_id = e.entertainment_id;


-- Ранг зарплат у разных профессий по секциям парка
select section_id, employee_profession.employee_id, salary,
       dense_rank() over (partition by section_id order by salary desc) as salary_rank
from jurpark.employee_profession
join jurpark.profession on employee_profession.profession_id = profession.profession_id
join jurpark.section_employee on employee_profession.employee_id = section_employee.employee_id
order by section_id, salary_rank;


-- Для каждого сотрудника выведем самые высоко- и низкооплачиваемые занимаемые должности с зарплатами
select
  employee_id,
  first_value(name) over (partition by employee_id order by salary desc ) as highest_salary_profession,
  first_value(salary) over (partition by employee_id order by salary desc ) as highest_salary,
  last_value(name) over (partition by employee_id order by salary) as lowest_salary_profession,
  last_value(salary) over (partition by employee_id order by salary) as lowest_salary
from jurpark.employee_profession ep
join jurpark.profession p on ep.profession_id = p.profession_id
order by employee_id;

-- Обитатели парка по датам рождения
select individual_id, birth,
  row_number() over(order by birth desc) as row_num
from jurpark.individual_being;
