create schema jurpark;

create table jurpark.park_section (
    section_id serial not null primary key,
    name varchar(255) not null ,
    phone_num varchar(10),
    address varchar(100)
);

create table jurpark.entertainment (
    entertainment_id serial not null primary key,
    req_age int CHECK (req_age > 0),
    req_height int CHECK (req_height > 0),
    cost decimal(5, 2)
);

create table jurpark.section_activity (
    section_id serial not null,
    foreign key (section_id) references jurpark.park_section(section_id),
    entertainment_id serial not null,
    foreign key (entertainment_id) references jurpark.entertainment(entertainment_id),
    primary key(section_id, entertainment_id),
    day date
);

create table jurpark.employee (
    employee_id serial not null primary key,
    phone_num varchar(20),
    name varchar(255) not null,
    contract_from date DEFAULT CURRENT_DATE,
    contract_to date DEFAULT '2050-01-01'
);

create table jurpark.section_employee (
    section_id serial not null,
    foreign key (section_id) references jurpark.park_section(section_id),
    employee_id serial not null,
    foreign key (employee_id) references jurpark.employee(employee_id),
    primary key (section_id, employee_id)
);

create table jurpark.profession (
    profession_id serial not null primary key,
    name varchar(255) NOT NULL,
    salary decimal(6, 0)
);

create table jurpark.employee_profession (
    employee_id serial not null,
    foreign key (employee_id) references jurpark.employee(employee_id),
    profession_id serial not null,
    foreign key (profession_id) references jurpark.profession(profession_id),
    primary key (employee_id, profession_id)
);

create table jurpark.species (
    species_id serial not null primary key,
    section_id serial not null,
    foreign key (section_id) references jurpark.park_section(section_id),
    population int,
    feed char CHECK (feed='p' or feed='h' or feed='o'),
    habitat varchar(255)
);

create table jurpark.species_profession (
    species_id serial not null,
    foreign key (species_id) references jurpark.species(species_id),
    profession_id serial not null,
    foreign key (profession_id) references jurpark.profession(profession_id),
    primary key (species_id, profession_id)
);

create table jurpark.individual_being (
    individual_id serial not null primary key,
    species_id serial not null,
    foreign key (species_id) references jurpark.species(species_id),
    sex char CHECK (sex='f' or sex='m'),
    birth date,
    name varchar(255)
);
