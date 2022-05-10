DROP TABLE assignments;
DROP TABLE animals;
DROP TABLE enclosures;
DROP TABLE staff;

CREATE TABLE staff(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    staff_number INT
);

CREATE TABLE enclosures (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closed_for_maintenance BOOLEAN
);

CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR (255),
    age INT,
    enclosure_id INT REFERENCES enclosures(id)
);

CREATE TABLE assignments (
    id SERIAL PRIMARY KEY,
    employee_id INT REFERENCES staff(id),
    enclosure_id INT REFERENCES enclosures(id),
    day VARCHAR(255)
);

-- insert staff members
INSERT INTO staff (name, staff_number) VALUES ('Hamza', 55);
INSERT INTO staff (name, staff_number) VALUES ('Amber', 13);
INSERT INTO staff (name, staff_number) VALUES ('Bianca', 11);
INSERT INTO staff (name, staff_number) VALUES ('Ben', 66);

-- insert enclosures
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Primates', 10, FALSE);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Reptiles', 10, FALSE);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Wild Cats', 10, TRUE);
INSERT INTO enclosures (name, capacity, closed_for_maintenance) VALUES ('Birds', 10, FALSE);

-- insert animals
INSERT INTO animals (name, type, age, enclosure_id) VALUES('Simba', 'Lion', 2, 1);
INSERT INTO animals (name, type, age, enclosure_id) VALUES('ShereKhan', 'Tiger', 45, 1);

INSERT INTO animals (name, type, age, enclosure_id) VALUES('Lago', 'Parrot', 12, 2);
INSERT INTO animals (name, type, age, enclosure_id) VALUES('Skipper', 'Penguin', 5, 2);

INSERT INTO animals (name, type, age, enclosure_id) VALUES('Kaa', 'Snake', 60, 3);
INSERT INTO animals (name, type, age, enclosure_id) VALUES('Oogway', 'Tortoise', 100, 3);

INSERT INTO animals (name, type, age, enclosure_id) VALUES('Harambe', 'Gorilla', 9, 4);
INSERT INTO animals (name, type, age, enclosure_id) VALUES('Julian', 'Lemur', 16, 4);

-- insert assignments
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Monday', 1, 1);
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Tuesday', 2, 2);
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Wednesday', 3, 3);
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Thursday', 4, 4);
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Friday', 1, 2);
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Saturday', 2, 4);
INSERT INTO assignments (day, employee_id, enclosure_id) VALUES ('Sunday', 3, 1);

-- QUERIES MVP ---------------------------------------------------------------------------

-- QUEsTION 1 --
SELECT (animals.name)
FROM assignments
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
INNER JOIN staff
ON assignments.employee_id = staff.id
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
WHERE enclosures.name = 'Reptiles';

-- QUESTION 2 --
SELECT (staff.name)
FROM assignments
INNER JOIN enclosures
ON assignments.enclosure_id = enclosures.id
INNER JOIN staff
ON assignments.employee_id = staff.id
INNER JOIN animals
ON enclosures.id = animals.enclosure_id
WHERE enclosures.name = 'Primates';

