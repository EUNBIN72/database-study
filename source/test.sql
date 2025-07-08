-- Active: 1749606788911@@127.0.0.1@3306@test
CREATE DATABASE test;

USE test;


CREATE TABLE mem (
  mem_no INTEGER NOT NULL PRIMARY KEY,
  user_no INTEGER NOT NULL,
  mem_grade INTEGER
);

CREATE TABLE subject_type (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(30) NOT NULL
);


CREATE TABLE exam_type (
  exam_type_id INT AUTO_INCREMENT PRIMARY KEY,
  mem_grade INT,
  exam_type INT
);

CREATE TABLE goal_score (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    member_no INT NOT NULL,
    exam_type_id INT NOT NULL,
    subject_id INT NOT NULL,
    goal_score INT NOT NULL,  -- 목표 점수 (0~100점)
    goal_level TEXT NOT NULL, -- 목표 등급 (1~9등급)
    FOREIGN KEY (member_no) REFERENCES mem(mem_no),
    FOREIGN KEY (exam_type_id) REFERENCES exam_type(exam_type_id),
    FOREIGN KEY (subject_id) REFERENCES subject_type(subject_id)
);

CREATE TABLE account_exam (
    goal_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    member_no INT NOT NULL,
    exam_type_id INT NOT NULL,
    goal_detail TEXT NOT NULL, -- 세부 목표 작성
    FOREIGN KEY (member_no) REFERENCES mem(mem_no),
    FOREIGN KEY (exam_type_id) REFERENCES exam_type(exam_type_id)
);


CREATE TABLE actual_score (
  actual_score_id INT AUTO_INCREMENT PRIMARY KEY,
  member_no INT NOT NULL,
  exam_type_id INT NOT NULL,
  subject_id INT NOT NULL,
  actual_score INT NOT NULL,
  actual_level INT NOT NULL,
  actual_score_percentage FLOAT NOT NULL,
  school_ranking INT,
  FOREIGN KEY (member_no) REFERENCES mem(mem_no),
  FOREIGN KEY (exam_type_id) REFERENCES exam_type(exam_type_id),
  FOREIGN KEY (subject_id) REFERENCES subject_type(subject_id)
);


INSERT INTO mem (mem_no, user_no, mem_grade) VALUES (1, 1, 1);

INSERT INTO mem (mem_no, user_no, mem_grade) 
VALUES (2, 2, 2),
        (3, 3, 2),
        (4, 4, 3),
        (5, 5, 3);
  


INSERT INTO exam_type (mem_grade, exam_type)
VALUES (1, 3),
        (1, 6),
        (1, 9),
        (2, 3),
        (2, 6),       
        (2, 9), 
        (3, 3), 
        (3, 6), 
        (3, 9), 
        (3, 11);
        

INSERT INTO subject_type (subject_name)
VALUES ('국어'),
        ('수학'),
        ('영어'),
        ('한국사'),
        ('경제'),
        ('사회문화'),
        ('법과정치'),
        ('윤리와사상'),
        ('세계지리'),
        ('한국지리'),
        ('세계사'),
        ('동아시아사'),
        ('생활과윤리'),
        ('물리1'),
        ('화학1'),
        ('생명과학1'),
        ('지구과학1'),
        ('물리2'),
        ('화학2'),
        ('생명과학2'),
        ('지구과학2'),
        ('독일어'),
        ('프랑스어'),
        ('스페인어'),
        ('중국어'),
        ('일본어'),
        ('러시아어'),
        ('아랍어'),
        ('베트남어'),
        ('한문');


INSERT INTO account_exam (member_no, exam_type_id, goal_detail) 
VALUES (1, 1, '세부목표1'),
        (2, 5, '세부목표2'),
        (3, 6, '세부목표3'),
        (4, 9, '세부목표4'),
        (5, 10, '세부목표5');

INSERT INTO goal_score (member_no, exam_type_id, subject_id, goal_score, goal_level)
VALUES (1, 1, 1, 80, 2),
        (2, 5, 3, 90, 1),
        (3, 6, 5, 70, 5),
        (4, 9, 7, 60, 8),
        (5, 10, 9, 100, 1);

INSERT INTO actual_score (member_no, exam_type_id, subject_id, actual_score, actual_level, actual_score_percentage, school_ranking)
VALUES (1, 1, 1, 80, 2, 90, 150),
        (2, 5, 3, 90, 1, 99, 151),
        (3, 6, 5, 70, 5, 70, 152),
        (4, 9, 7, 60, 8, 88, 153),
        (5, 10, 9, 100, 1, 99, 154);


SELECT * FROM goal_score;
SELECT * FROM exam_type;

SELECT * FROM actual_score;


SELECT 
    m.mem_no,
    m.user_no,
    m.mem_grade,
    et.exam_type,
    st.subject_name
FROM 
    mem m
JOIN 
    exam_type et ON m.mem_grade = et.mem_grade
JOIN 
    goal_score gs ON m.mem_no = gs.member_no AND gs.exam_type_id = et.exam_type_id
JOIN 
    subject_type st ON gs.subject_id = st.subject_id
WHERE 
    m.mem_grade = 1
    AND et.exam_type = 3
    AND st.subject_name IN ('국어', '수학', '영어', '한국사', '프랑스어');
