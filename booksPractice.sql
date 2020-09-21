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

ALTER TABLE users
ADD bio varchar(255);

UPDATE users
SET bio='bio one'
WHERE user_id=1;

INSERT INTO reviews (review_id, book_id, user_id, text)
VALUES (1, 1, 1, 'good book one');

INSERT INTO users (user_id, name, bio)
VALUES (3, 'Chuck', 'bio three');


SELECT user.name, review.text
FROM book
INNER JOIN call ON review.book_id = book.id
INNER JOIN call_outcome ON review.user_id = review.user_id;

-- inner join
SELECT users.name, reviews.text, books.title
from users
INNER JOIN reviews ON reviews.user_id = users.user_id
INNER JOIN books ON reviews.book_id = books.book_id;

-- inner join
SELECT users.name, reviews.text, books.title
from books
INNER JOIN reviews ON reviews.book_id = books.book_id
INNER JOIN users ON reviews.user_id = users.user_id;

SELECT users.name, reviews.text
from users
INNER JOIN reviews ON reviews.user_id = users.user_id;

SELECT * FROM reviews inner join books on reviews.book_id = books.book_id;

-- left join
SELECT country.country_name_eng, city.city_name, customer.customer_name
FROM customer
LEFT JOIN city ON customer.city_id = city.id
LEFT JOIN country ON city.country_id = country.id;

-- left join. this one triples everything
SELECT users.name, users.bio, reviews.text, books.title
FROM books
LEFT JOIN reviews ON books.book_id = books.book_id
LEFT JOIN users ON users.user_id = users.user_id;

SELECT users.name, reviews.text  -- this repeats everything twice
FROM users
LEFT JOIN reviews 
ON reviews.text = reviews.text;

-- left join
SELECT * FROM reviews Left Join users on reviews.user_id = users.user_id;
-- left join
SELECT * FROM users Left Join reviews on reviews.user_id = users.user_id;
-- left join
SELECT * FROM books Left Join reviews on reviews.book_id = books.book_id;

SELECT users.name, users.bio, reviews.text
FROM users
LEFT JOIN reviews ON reviews.user_id = users.user_id;

SELECT reviews.text, reviews.user_id, users.name
FROM reviews
LEFT JOIN users ON users.user_id = reviews.user_id;


SELECT books.title, books.book_id, reviews.text, users.name
FROM books 
LEFT JOIN reviews on reviews.book_id = books.book_id
LEFT JOIN users on reviews.user_id = users.user_id;

-- right join
SELECT users.name, users.bio, reviews.text
FROM reviews
RIGHT JOIN users ON users.user_id = reviews.user_id;
-- right join
SELECT users.name, users.bio, reviews.text
FROM users
RIGHT JOIN reviews ON reviews.user_id = users.user_id;
-- right join
SELECT * FROM users RIGHT JOIN reviews ON reviews.user_id = users.user_id;
-- right join
SELECT * FROM reviews RIGHT JOIN users ON users.user_id = reviews.user_id;

SELECT reviews.review_id, reviews.text, books.title
FROM reviews
RIGHT JOIN books ON books.book_id = reviews.book_id;