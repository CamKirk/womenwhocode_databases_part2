# WWC Lecture

## SQL

```sql
CREATE TABLE minerals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    contains VARCHAR(30),
    price INT
);
```

```sql
INSERT INTO minerals (name, contains, price) VALUES('hematite', 'iron',200);
```

```sql
SELECT * FROM minerals;
```

```sql
INSERT INTO minerals (name, contains, price)
VALUES
('kyanite', 'alumniosilicate', 400),
('sand','silicate', 15),
('olivenite','copper', 200),
('graphite', 'graphs', 100);
```

```sql
SELECT * FROM minerals WHERE price > 100;
```

```sql
UPDATE minerals
SET contains = 'carbon'
WHERE name='graphite';
```

```sql
DELETE FROM minerals
WHERE name='sand';
```

PRESENTATION ON NORMALIZATION AND JOINS

```sql
CREATE TABLE physical(
    id SERIAL,
    mineralid INT REFERENCES mineral(id)
    color VARCHAR(20),
    csystem VARCHAR(20),
)

INSERT INTO physical (mineralid, color, csystem)
VALUES
(1, 'black', 'trigonal'),
(2, 'blue', 'triclinic' ),
(4, 'green', 'monoclinic'),
(5, 'black', 'hexagonal');
```

```sql
SELECT * FROM minerals
INNER JOIN physical
ON mineral.id = physical.mineralid

```

```sql
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

```

```sql
SELECT * FROM student
INNER JOIN student_class
ON student.id = student_class.studentid
INNER JOIN class
ON student_class.classid = class.id;
```

## MongoDB

```mongodb
db.collection.find({}).pretty()
```

```mongodb
db.collection.insert({})
```

```mongodb
db.collection.update({name:"banana"}, {$set:{ value: 5 }})
```

```mongodb
db.collection.remove({name:"banana"})
```
