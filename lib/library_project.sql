CREATE DATABASE library_project;
USE library_project;


CREATE Table book (
  isbn VARCHAR(13) PRIMARY KEY,
  type VARCHAR(10),
  price INTEGER
);

INSERT INTO book (isbn, type, price)
VALUES ();