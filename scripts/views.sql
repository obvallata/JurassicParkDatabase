-- Данные о сотруднике и профессии со скрытым номером телефона
create view jurpark.protected_employees as
    select e.name as employee, p.name as profession, substr(e.phone_num, 0, 4) || '***-**-' || substr(e.phone_num, 9, 2) as employee_contact
    from jurpark.employee e
    join jurpark.employee_profession ep on e.employee_id = ep.employee_id
    join jurpark.profession p on ep.profession_id = p.profession_id;

-- Данные о сотрудниках, их профессиях и месте работы (исходя из видов, за которые они ответственны)
create view jurpark.employee_creatures as
    select distinct e.name as employee, p.name as profession, s.habitat as workplace
    from jurpark.employee e
    join jurpark.employee_profession ep on e.employee_id = ep.employee_id
    join jurpark.profession p on ep.profession_id = p.profession_id
    join jurpark.species_profession sp on ep.profession_id = sp.profession_id
    join jurpark.species s on sp.species_id = s.species_id;

-- Данные о виде, соответсвующей секции парка и популяции
create view jurpark.species_section_population as
    select s.species_id, se.name as section_name, s.population
    from jurpark.species s
    join jurpark.park_section se on s.section_id = se.section_id;

-- Сводка по каждой отдельной особи -- id, id вида, секция парка и среда обитания
create view jurpark.individual_species_section_habitat as
    select ib.individual_id, s.species_id, ps.name as section_name, s.habitat
    from jurpark.individual_being ib
    join jurpark.species s on ib.species_id = s.species_id
    join jurpark.park_section ps on s.section_id = ps.section_id;

-- Сводка по профессиям: даты контрактов сотрудников, скрытые имена и количество сотрудников
create view jurpark.professions_data as
    select p.name, contract_from, contract_to,
           substr(e.name, 0, 2) || '*** ' || substr(e.name, position(' ' in e.name), 2) || '***' as employee_name,
           count(*) over (partition by p.profession_id) as amount_employees
    from jurpark.profession p
    join jurpark.employee_profession ep on p.profession_id = ep.profession_id
    join jurpark.employee e on ep.employee_id = e.employee_id;

-- Сводка о стоимости развлечений по секциям парка
create view jurpark.section_entertainment_cost as
    select s.section_id, s.name, sum(e.cost) as total_cost
    from jurpark.park_section s
    left join jurpark.section_activity sa on s.section_id = sa.section_id
    left join jurpark.entertainment e on sa.entertainment_id = e.entertainment_id
    group by s.section_id, s.name;
