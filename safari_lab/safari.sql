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
    enclosures_id INT REFERENCES enclosures(id)
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