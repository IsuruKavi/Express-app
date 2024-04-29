CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255),
    age INT
);

INSERT INTO users (name, email, age) VALUES
('Tom', 'tom@gmail.com', 16),
('Jane', 'jane@gmail.com', 17),
('Smith', 'smith@gmail.com', 18);
