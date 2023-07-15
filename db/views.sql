CREATE OR REPLACE VIEW substitute_teachers AS
SELECT classes.name AS class_name,
  t2.first_name AS original_teacher,
  t1.first_name AS teacher,
  t1.department
FROM classes
  JOIN teachers AS t1 ON classes.department = t1.department
  JOIN teachers AS t2 ON classes.teacher_id = t2.id;

CREATE OR REPLACE VIEW teachers_public AS
SELECT first_name,
  last_name,
  email,
  department
FROM teachers;

CREATE OR REPLACE VIEW students_in_classes AS
SELECT students.name, classes.name AS class_name
FROM students
JOIN students_classes AS sc ON students.id = sc.student_id
JOIN classes ON sc.class_id = classes.id;

CREATE OR REPLACE VIEW students_and_teachers AS
SELECT students.name, classes.name AS class_name, teachers.first_name
FROM students
JOIN students_classes AS sc ON students.id = sc.student_id
JOIN classes ON sc.class_id = classes.id
JOIN teachers ON classes.teacher_id = teachers.id;
