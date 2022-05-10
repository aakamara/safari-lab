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