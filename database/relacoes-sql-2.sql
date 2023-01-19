-- Active: 1674130889709@@127.0.0.1@3306

-- Prática 1
CREATE TABLE users(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL
);

INSERT INTO users(id, name, email, password)
VALUES
    ('u001', 'fulana', 'fulana@emaol.com', 'fulana123'),
    ('u002', 'ciclana', 'ciclana@emaol.com', 'ciclana123'),
    ('u003', 'beltrana', 'beltrana@emaol.com', 'beltrana123');

SELECT * FROM users;

-- Prática 2 e 3

CREATE TABLE follows(
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

INSERT INTO follows(follower_id, followed_id)
VALUES
    ('u001', 'u002'), -- Pessoa A segue B
    ('u001', 'u003'), -- Pessoa A segue C
    ('u002', 'u001'); -- Pessoa B segue A

SELECT * FROM follows;

SELECT * FROM follows
INNER JOIN users
ON follows.follower_id = users.id;

SELECT * FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id;

SELECT 
    follows.follower_id AS followerId,
    follows.followed_id AS followedId,
    users.name AS followerName,
    followedUsers.name AS followedName,
    users.email AS followerEmail
FROM follows
RIGHT JOIN users
ON follows.follower_id = users.id
LEFT JOIN users AS users2
ON follows.followed_id = followedUsers.id;

--Fixação

CREATE TABLE books(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL
);

CREATE TABLE author(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    author_name TEXT NOT NULL
);

CREATE TABLE books_author(
    books_id TEXT NOT NULL,
    author_books_id TEXT NOT NULL,
    FOREIGN KEY (books_id) REFERENCES books(id),
    FOREIGN KEY (author_books_id) REFERENCES author_books(id)
);

DROP TABLE books;

DROP TABLE author;

DROP TABLE books_author;

INSERT INTO books(id, name)
VALUES
    ('l001', 'Um dia sem reclamar'),
    ('l002', 'Marketing 5.0: Tecnologia para a humanidade');

INSERT INTO author(id, author_name)
VALUES
    ('a001', 'Davi Lago'),
    ('a002', 'Marcelo Galuppo'),
    ('a003', 'Philip Kotler'),
    ('a004', 'Hermawan Kartajaya'),
    ('a005', 'Iwan Setiawan');

INSERT INTO books_author(books_id, author_books_id)
VALUES
    ('l001','a001'),
    ('l001','a002'),
    ('l002','a003'),
    ('l002','a004'),
    ('l002','a005');

SELECT * FROM books;

SELECT * FROM author;

SELECT * FROM books_author;

SELECT
    books.id AS booksId,
    books.name AS booksName,
    author.id AS authorId,
    author.author_name AS authorName
FROM books_author
INNER JOIN books
ON books_author.books_id = books.id
INNER JOIN author
ON books_author.author_books_id = author.id;

