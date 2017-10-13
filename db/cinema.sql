DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;





CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);

CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT2
);

CREATE TABLE tickets (
id SERIAL4 PRIMARY KEY,
customer_id INT2 REFERENCES customers(id),
-- REFERENCES customers(id) ON DELETE CASCADE
film_id INT2 REFERENCES films(id)
-- REFERENCES films(id) ON DELETE CASCADE
);
