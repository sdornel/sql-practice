-- CREATE TABLE IF NOT EXISTS users ( 
-- user_id serial PRIMARY KEY,
-- name VARCHAR ( 50 ) UNIQUE NOT NULL
-- );

-- CREATE TABLE if not exists books ( 
-- book_id serial PRIMARY KEY,
-- title VARCHAR ( 50 ) UNIQUE NOT NULL
-- );

-- CREATE TABLE reviews(
-- review_id INT GENERATED ALWAYS AS IDENTITY,
-- book_id INT,
-- user_id INT,
-- text varchar(255),
-- PRIMARY KEY(review_id),
-- CONSTRAINT fk_book
-- FOREIGN KEY(book_id)
-- REFERENCES books(book_id),
-- CONSTRAINT fk_user
-- );

CREATE TABLE users (
    user_id int,
    PRIMARY KEY(user_id),
    name varchar(255)
);

CREATE TABLE books (
    book_id int,
    PRIMARY KEY(book_id),
    title varchar(255)
);

CREATE TABLE reviews (
    review_id int,
    book_id int,
    user_id int,
    text varchar(255),
    PRIMARY KEY(review_id),
    CONSTRAINT fk_book
    FOREIGN KEY(book_id)
    REFERENCES books(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY(user_id)
    REFERENCES users(user_id)
);