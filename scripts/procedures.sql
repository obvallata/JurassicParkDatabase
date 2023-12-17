-- Добавляем нового динозаврика в таблицу, проверяя, что его вид уже
-- занесен в species. Иначе добавляем и его.
create or replace procedure jurpark.add_individual(
    new_species_id int,
    new_sex char,
    new_birth date,
    new_name varchar(255)
) as $$
    declare species_id_paste int; new_id int;
    begin
        select species_id into species_id_paste from jurpark.species where species_id = new_species_id;

        if species_id_paste is null then
            insert into jurpark.species(section_id, population, feed, habitat)
            values (new_species_id, 1, 'o', null);
        end if;

        select max(jurpark.individual_being.individual_id) into new_id
        from jurpark.individual_being;

        new_id := new_id + 1;

        insert into jurpark.individual_being (individual_id, species_id, sex, birth, name)
        values (new_id,
                new_species_id,
                new_sex,
                new_birth,
                new_name);
    end;
$$ language plpgsql;

-- Пример вызова
call jurpark.add_individual(8, 'f', '2005-05-09', 'Rexy');

-- Функция, по id секции возвращающая сотрудников, привязынных к секции, с их номерами телефонов
create or replace function get_employees_by_section(section_id int)
    returns table (name varchar(255), phone_num varchar(20)) as $$
    begin
        return query select empl.name, empl.phone_num
                     from jurpark.employee empl
                     join jurpark.section_employee se on empl.employee_id = se.employee_id
                     where se.section_id = $1;
    end;
$$ language plpgsql;

-- Пример вызова
select *
from get_employees_by_section(7);
