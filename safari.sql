DROP TABLE assignments;
DROP TABLE animals;
DROP TABLE enclosures;
DROP TABLE staff;

CREATE TABLE enclosures(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    capacity INT,
    closedForMaintenance BOOLEAN
);

CREATE TABLE animals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    type VARCHAR(255),
    age INT,
    enclosureId INT REFERENCES enclosures(id)
);

CREATE TABLE staff(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    employeeNumber INT
);

CREATE TABLE assignments(
    id SERIAL PRIMARY KEY,
    employeeId INT REFERENCES staff(id),
    enclosureId INT REFERENCES enclosures(id),
    day VARCHAR(255)
);

INSERT INTO enclosures (name, capacity, closedForMaintenance) VALUES ('big cat field', 20, false);

INSERT INTO animals (name, type, age, enclosureId) VALUES ('Tony', 'Tiger', 59, 1);
INSERT INTO animals (name, type, age, enclosureId) VALUES('Todd', 'Fox', 3, 1);

INSERT INTO staff (name, employeeNumber) VALUES('Captain Risk', 12345);

INSERT INTO assignments (employeeId, enclosureId, day) VALUES (1, 1, 'Tuesday');

-- query 1 below:
SELECT animals.name FROM animals INNER JOIN enclosures ON animals.id = enclosures.id;

-- query 2 below:
SELECT staff.name FROM staff INNER JOIN enclosures ON staff.id = enclosures.id;

SELECT * FROM animals;
SELECT * FROM assignments;
SELECT * FROM staff;
SELECT * FROM enclosures;