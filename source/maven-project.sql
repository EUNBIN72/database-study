-- Active: 1749606788911@@127.0.0.1@3306@maven_project
-- maven_project 데이터베이스 생성
CREATE DATABASE maven_project CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 생성된 데이터베이스 사용
USE maven_project;

-- 회원(member) 테이블 생성
CREATE TABLE member (
    member_no INT AUTO_INCREMENT PRIMARY KEY,
    member_id VARCHAR(50),
    member_pw VARCHAR(100)
);

-- 게시판(board) 테이블 생성
CREATE TABLE board (
	board_no INT AUTO_INCREMENT PRIMARY KEY,
  board_title VARCHAR(100) NOT NULL,
  board_content TEXT,
  board_writer INT NOT NULL,
  reg_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  mod_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 첨부파일(attach) 테이블 생성
CREATE TABLE attach (
  attach_no INT AUTO_INCREMENT PRIMARY KEY,
  board_no INT NOT NULL,                         
  ori_name VARCHAR(255) NOT NULL,           
  re_name VARCHAR(255) NOT NULL,             
  reg_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


SELECT * FROM member;

SELECT * FROM attach;

SELECT * FROM board;

INSERT INTO board (board_title, board_content, board_writer) 
VALUES 
('111', '테스트 게시글1', 1),
('222', '테스트 게시글2', 2),
('333', '테스트 게시글3', 3),
('444', '테스트 게시글4', 4),
('555', '테스트 게시글5', 5),
('666', '테스트 게시글6', 6),
('777', '테스트 게시글7', 7),
('888', '테스트 게시글8', 8),
('999', '테스트 게시글9', 9);

VALUES ('10', '테스트 게시글10', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('11', '테스트 게시글11', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('12', '테스트 게시글13', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('13', '테스트 게시글13', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('14', '테스트 게시글14', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('15', '테스트 게시글15', 1);
INSERT INTO board (board_title, board_content, board_writer) 
VALUES ('16', '테스트 게시글16', 1);

INSERT INTO board (board_title, board_content, board_writer) 
VALUES 
('17', '테스트 게시글17', 2),
('18', '테스트 게시글18', 2),
('19', '테스트 게시글19', 2),
('20', '테스트 게시글20', 2),
('21', '테스트 게시글21', 2),
('22', '테스트 게시글22', 2),
('23', '테스트 게시글23', 2);

INSERT INTO board (board_title, board_content, board_writer) 
VALUES 
('24', '테스트 게시글24', 2),
('25', '테스트 게시글25', 2),
('26', '테스트 게시글26', 2);

INSERT INTO board (board_title, board_content, board_writer) 
VALUES 
('27', '테스트 게시글27', 2),
('28', '테스트 게시글28', 2),
('29', '테스트 게시글29', 2),
('30', '테스트 게시글30', 2),
('31', '테스트 게시글31', 2);

UPDATE board SET board_writer = 2;


SELECT B.board_no
		,B.board_writer
		,B.board_content
		,DATE_FORMAT(B.reg_date, '%Y-%m-%d') AS reg_date
		FROM board B
		JOIN member M ON B.board_writer = M.member_no
    WHERE board_no = 3;


    SELECT * FROM board WHERE (SELECT board_no FROM attach WHERE attach_no = 1);