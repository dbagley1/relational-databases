--* Tables: teachers, students, classes
--* Many teachers to many students, through classes
--* One teacher to many classes
--* Many students to many classes
DROP TABLE IF EXISTS teachers CASCADE;

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone VARCHAR(20),
  address TEXT,
  department TEXT,
  super_id INTEGER REFERENCES teachers(id) ON DELETE SET NULL
);

--? id: 1, fname: Mark, super_id: NULL
--? id: 20, fname: John, super_id: 1


DROP TABLE IF EXISTS classes CASCADE;

CREATE TABLE classes (
  id SERIAL PRIMARY KEY,
  name TEXT,
  department TEXT,
  teacher_id INTEGER REFERENCES teachers(id) ON DELETE SET NULL
);


DROP TABLE IF EXISTS students CASCADE;

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  name TEXT GENERATED ALWAYS AS (first_name || ' ' || last_name) STORED,
  email TEXT,
  phone VARCHAR(20),
  address TEXT,
  city TEXT,
  state VARCHAR(2),
  zip VARCHAR(10),
  date_of_birth DATE,
  gender VARCHAR(10),
  major TEXT,
  gpa NUMERIC(3, 2)
);


DROP TABLE IF EXISTS students_classes;

CREATE TABLE students_classes (
  id SERIAL PRIMARY KEY,
  student_id INTEGER REFERENCES students(id) ON DELETE CASCADE,
  class_id INTEGER REFERENCES classes(id) ON DELETE CASCADE,
  grade NUMERIC(4,2)
);
