TRUNCATE TABLE students RESTART IDENTITY CASCADE;

INSERT INTO students (first_name, last_name, email, phone, address)
SELECT 'Student ',
  generate_series(1, 100),
  'student' || generate_series(1, 100) || '@example.com',
  '555-' || lpad(trunc(random() * 10000)::text, 4, '0'),
  trunc(random() * 1000) || ' Main St'
FROM generate_series(1, 1);
