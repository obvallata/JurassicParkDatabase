insert into jurpark.park_section (section_id, name, phone_num, address) values
(0, 'Giant Terrestrial Predator', '5551234567', 'Calle El Cabezote, 3, 38390 Santa Ursula, Isla del Coco'),
(1, 'Small Terrestrial Predator', '5552345678', 'Calle San Isidro, 25, 38390 Santa Ursula, Isla del Coco'),
(2, 'Giant Terrestrial Herbivore', '5553456789', 'Calle El Calvario, 9, 38390 Santa Ursula, Isla del Coco'),
(3, 'Small Terrestrial Herbivore', '5554567890', 'Calle El Calvario, 33, 38390 Santa Ursula, Isla del Coco'),
(4, 'Giant Omnivores', '5555678901', 'Calle Las Rosas, 3, 38390 Santa Ursula, Isla del Coco'),
(5, 'Small Omnivores', '5556789012', 'Calle Las Rosas, 7, 38390 Santa Ursula, Isla del Coco'),
(6, 'Aquatic Predators', '5557890123', 'Calle Las Rosas, 11, 38390 Santa Ursula, Isla del Coco'),
(7, 'Mammalian', '5558901234', 'Calle Las Rosas, 15, 38390 Santa Ursula, Isla del Coco'),
(8, 'Office Area', '5559012345', 'Calle Los Cipreses, 3, 38390 Santa Ursula, Isla del Coco'),
(9, 'Airport Area', '5550123456', 'Calle Los Cipreses, 7, 38390 Santa Ursula, Isla del Coco');

insert into jurpark.entertainment (entertainment_id, req_age, req_height, cost) values
(0, 7, 120, 125.00),
(1, 7, 140, 300.00),
(2, 10, 110, 200.00),
(3, 13, 150, 350.00),
(4, 18, 130, 425.00),
(5, 7, 105, 615.00),
(6, 12, 140, 30.00),
(7, 7, 115, 260.00),
(8, 14, 135, 925.00),
(9, 7, 125, 120.00);

insert into jurpark.section_activity (section_id, entertainment_id, day) values
(0, 2, '2023-04-16'),
(8, 2, '2023-04-16'),
(3, 1, '2023-04-17'),
(9, 8, '2023-05-15'),
(3, 4, '2023-05-18'),
(3, 5, '2023-05-18'),
(4, 6, '2023-06-20'),
(4, 7, '2023-07-21'),
(5, 8, '2023-08-3'),
(5, 9, '2023-08-4');

insert into jurpark.employee (employee_id, phone_num, name, contract_from, contract_to) values
(0, '3624800534', 'John Smith', '2021-01-01', '2023-12-31'),
(1, '4259443467', 'Mary Johnson', '2022-03-15', '2024-06-30'),
(2, '6794743864', 'Michael Lee', '2022-08-01', '2024-07-31'),
(3, '5764703590','Jennifer Davis', '2021-05-01', '2023-04-30'),
(4, '8803970434', 'David Wilson', '2022-01-01', '2024-12-31'),
(5, '6822170721','Karen Brown', '2021-11-15', '2023-10-31'),
(6, '6075255698','William Garcia', '2022-02-01', '2024-03-31'),
(7, '5848669944','Sarah Hernandez', '2021-07-01', '2023-06-30'),
(8, '1137332932','Emily Martinez', '2022-06-15', '2024-05-31'),
(9, '8642537712','Daniel Rodriguez', '2021-04-01', '2023-03-31');

insert into jurpark.section_employee (section_id, employee_id) values
(0, 7),
(8, 3),
(9, 2),
(8, 2),
(0, 1),
(1, 1),
(3, 4),
(6, 9),
(5, 4),
(2, 5);

insert into jurpark.profession (profession_id, name, salary) values
(0, 'Geneticist', 500000.0),
(1, 'Park Ranger', 200000.0),
(2, 'Security Guard', 300000.0),
(3, 'Tour Guide', 100000.0),
(4, 'Veterinarian', 300000.0),
(5, 'Research Scientist', 600000.0),
(6, 'Chief Engineer', 100000.0),
(7, 'Marketing Manager', 50000.0),
(8, 'IT Technician', 100000.0),
(9, 'Legal Counsel', 300000.0),
(10, 'Aqua Veterinarian', 350000.0);

insert into jurpark.employee_profession (employee_id, profession_id) values
(0, 1),
(4, 9),
(2, 9),
(4, 7),
(5, 0),
(5, 5),
(9, 3),
(7, 2),
(9, 8),
(1, 4);

insert into jurpark.species (species_id, section_id, population, feed, habitat) values
(0, 0, 50, 'p', 'Rainforest'),
(1, 2, 20, 'h', 'Rainforest'),
(2, 3, 100, 'o', 'Desert'),
(3, 1, 75, 'h', 'Rainforest'),
(4, 4, 30, 'p', 'Rainforest'),
(5, 6, 200, 'o', 'Water'),
(6, 6, 15, 'o', 'Water'),
(7, 1, 90, 'h', 'Forest'),
(8, 0, 50, 'p', 'Canyon'),
(9, 2, 10, 'h', 'Canyon');


insert into jurpark.species_profession (species_id, profession_id) values
(0, 0),
(0, 4),
(6, 10),
(6, 1),
(1, 5),
(8, 3),
(2, 4),
(9, 0),
(3, 1),
(4, 1);

insert into jurpark.individual_being (individual_id, species_id, sex, birth, name) values
(0, 3, 'm', '2015-05-12', 'Max'),
(1, 5, 'f', '2016-09-01', 'Luna'),
(2, 1, 'm', '2015-11-21', 'Charlie'),
(3, 3, 'f', '2014-03-05', 'Bella'),
(4, 9, 'm', '2013-07-17', 'Rocky'),
(5, 7, 'f', '2010-04-02', 'Molly'),
(6, 4, 'm', '2018-08-08', 'Maximus'),
(7, 2, 'f', '2020-01-13', 'Lucy'),
(8, 6, 'm', '2021-06-30', 'Duke'),
(9, 3, 'f', '2010-12-24', 'Lola');
