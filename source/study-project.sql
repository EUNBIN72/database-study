CREATE DATABASE study_project CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE study_project;

CREATE TABLE student (
    student_no INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(50),
    student_age INT
);

INSERT INTO student (student_name, student_age)
VALUES ('홍길동', 20),
       ('김철수', 22),
       ('이영희', 21);

INSERT INTO student (student_name, student_age)
VALUES ('홍덕배', 30),
       ('김춘배', 25),
       ('최영희희', 20);

UPDATE student SET student_name='최영희' WHERE student_no=6;


SELECT * FROM student;






USE study_project;

CREATE TABLE product (
    product_no INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    product_price INT,
    product_category INT
);

INSERT INTO product (product_name, product_price, product_category)
VALUES 
('노트북', 1500000, 1),
('핸드폰', 1000000, 1),
('셔츠', 20000, 2),
('젤리', 1500, 3);

SELECT * FROM product;