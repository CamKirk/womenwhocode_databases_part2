CREATE TABLE minerals (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	contains VARCHAR(20),
	price INT
);

INSERT INTO minerals (name, contains, price) VALUES ('hematite', 'iron', 200);

SELECT contains FROM minerals;

INSERT INTO minerals (name, contains, price)
VALUES
('kyanite', 'alumniosilicate', 400),
('sand','silicate', 15),
('olivenite','copper', 200),
('graphite', 'graphs', 100);

SELECT name, price FROM minerals WHERE price > 100;

UPDATE minerals
SET contains = 'carbon'
WHERE name='john';

SELECT * FROM minerals;

DELETE FROM minerals
WHERE name='sand';


CREATE TABLE physical(
    id SERIAL,
    mineralid INT REFERENCES mineral(id),
    color VARCHAR(20),
    csystem VARCHAR(20)
);

INSERT INTO physical (mineralid, color, csystem)
VALUES
(1, 'black', 'trigonal'),
(2, 'blue', 'triclinic' ),
(4, 'green', 'monoclinic'),
(5, 'black', 'hexagonal');

SELECT * FROM physical;

SELECT minerals.name, minerals.contains, physical.color, physical.csystem FROM minerals
INNER JOIN physical
ON minerals.id = physical.mineralid;





CREATE TABLE student (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE class (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE student_class (
    id SERIAL PRIMARY KEY,
    studentid INT REFERENCES student(id),
    classid INT REFERENCES class(id)
);



INSERT INTO student (name)
VALUES
('Jay'),
('Chance'),
('O''Shea'),
('Marshall'),
('Melissa'),
('Lauryn'),
('Erykah'),
('Carlos'),
('Selena');

INSERT INTO class (name)
VALUES
('General Chemistry'),
('Geology 101'),
('Geology 102: Yikes'),
('Inorganic Chemistry'),
('Instr/Exper Design'),
('Senior Thesis');

INSERT INTO student_class (studentid, classid)
VALUES
(1,2),
(1,4),
(2,3),
(2,6),
(3,4),
(6,3),
(6,5),
(6,6),
(8,2),
(8,1),
(9,1),
(2,4),
(2,2),
(5,3),
(4,3),
(7,1),
(7,2);

SELECT * FROM student_class;


SELECT student.name, class.name FROM student
INNER JOIN student_class
ON student.id = student_class.studentid
INNER JOIN class
ON student_class.classid = class.id
WHERE student.name = 'Chance';

-- Composite Key question!
CREATE TABLE produce (
	id SERIAL,
	name VARCHAR(20),
	color VARCHAR(20),
	weight INT,
	PRIMARY KEY (name,color)
);

INSERT INTO produce (name, color, weight) VALUES
('banana', 'green', 20),
('banana', 'brown', 20),
('banana', 'red', 10),
('mango', 'orange', 10),
('kiwi', 'green', 8);


SELECT * FROM produce;

CREATE TABLE prices (
	name VARCHAR(20),
	color VARCHAR(20),
	FOREIGN KEY (name, color) REFERENCES produce (name, color),
	price FLOAT
);

SELECT * FROM prices;

INSERT INTO prices (name, color, price) VALUES
('banana', 'green', 5.5),
('banana', 'brown', 2.2),
('banana', 'red', 3.5);

SELECT * FROM produce
INNER JOIN prices
ON (produce.name, produce.color) = (prices.name, prices.color);


