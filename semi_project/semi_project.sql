-- 1. 데이터베이스 생성 및 진입
CREATE DATABASE semi_project;
USE semi_project;

-- 2. 회원(user) 테이블 생성 및 샘플 데이터 삽입
CREATE TABLE user (
	user_no INT UNSIGNED AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
	user_rrn VARCHAR(255) NOT NULL,
    user_seat INT UNSIGNED NOT NULL,
    PRIMARY KEY (user_no)
);

INSERT INTO user (user_name, user_rrn, user_seat)
VALUES 
	('권준하', '0010201234567', 0),
	('고두현', '0010201234567', 0),
    ('김혜원', '1231231231233', 1),
    ('고은빈', '1230984129381', 0),
    ('홍길동', '1029381092843', 0),
    ('김첨지', '1324098713084', 1),
    ('김삿갓', '1209437012394', 0),
    ('정길훈', '1209478012910', 0),
    ('백준수', '1231239081420', 1),
    ('이임생', '9182734981231', 0);
-- 조회
-- SELECT * FROM user; 
SELECT * FROM user;   
    
-- 3. member 테이블 생성 및 관리자 데이터 + 샘플 데이터 삽입
CREATE TABLE member (
	  member_no INT UNSIGNED AUTO_INCREMENT,
    user_no INT UNSIGNED NOT NULL,
    member_id VARCHAR(50) UNIQUE NOT NULL,
    member_name VARCHAR(20) NOT NULL,
    member_pw VARCHAR(255) NOT NULL,
    member_phone VARCHAR(20) UNIQUE,
    member_rrn VARCHAR(255) UNIQUE,
    member_address VARCHAR(255),
    member_school VARCHAR(20),
    member_grade INT UNSIGNED,
    member_seat INT,
    member_penalty INT UNSIGNED DEFAULT 0,
    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    active_status INT NOT NULL DEFAULT 1,
    PRIMARY KEY (member_no),
    FOREIGN KEY (user_no) REFERENCES user (user_no)
);

INSERT INTO member (user_no, member_id, member_name, member_pw) VALUES (1, 'admin', '관리자', 'admin1234');
INSERT INTO member (user_no, member_id, member_name, member_pw, member_phone, member_rrn, member_address, member_school, member_grade, member_seat)
VALUES 
	(2, 'go1234', '고두현', '123qweasd', '01012345678', '0010203333333', '경기도 안양시 만안구 병목안로 81 103동 707호', '인천고', 2, 0),
	(8, 'askjdh123', '정길훈', 'wjdrlfgns312', '01098765432', '0006021231231', '경기도 성남시 구월동 개천아파트 202동 103호', '한성고', 3, 0),
    (9, 'zinnjasd', '백준수', '1!qweasd', '01013245768', '0012259384712', '경기도 화성시 삼계동 승천아파트 107동 908호', '원미고', 1, 1);
-- 조회    
-- SELECT * FROM member;
SELECT * FROM member;

-- 3. 회원 프로필 사진 테이블 생성 및 샘플 데이터 삽입
CREATE TABLE member_avatar (
	avatar_id INT UNSIGNED AUTO_INCREMENT,
    member_no INT UNSIGNED UNIQUE NOT NULL,
	ori_name VARCHAR(255) NOT NULL,           
	re_name VARCHAR(255) NOT NULL,  
	path VARCHAR(255) NOT NULL,
    PRIMARY KEY (avatar_id),
    FOREIGN KEY (member_no) REFERENCES member (member_no) 
);

INSERT INTO member_avatar (member_no, ori_name, re_name, path) VALUES (3, 'pics.png', '%123123124143#!2413%$!3.png', 'C://');
-- 조회
-- SELECT * FROM member_avatar;

SELECT * FROM member_avatar;



--  계정별 세부목표 테이블 생성  
CREATE TABLE member_goal_detail (
    member_goal_detail_id INT UNSIGNED AUTO_INCREMENT  PRIMARY KEY,  -- 계정별 시험 고유 ID
    member_no INT UNSIGNED NOT NULL,  -- 회원번호(member 테이블 참조)
    exam_type_id INT UNSIGNED NOT NULL, -- 시험 분류 고유 ID(exam_type 테이블 참조)
    goal_detail TEXT NOT NULL -- 세부 목표 작성(50자 이상 반드시 작성 )
);


-- 시험 분류 테이블 생성
CREATE TABLE exam_type (
    exam_type_id INT UNSIGNED AUTO_INCREMENT  PRIMARY KEY,  -- 시험 분류 ID
    member_grade INT UNSIGNED NOT NULL,  -- 학년(1학년, 2학년, 3학년)
    exam_type INT UNSIGNED NOT NULL  -- 시험 분류(3월, 6월, 9월, 11월(수능))
);

-- 시험 분류 테이블 샘플 데이터 삽입 
INSERT INTO exam_type (member_grade, exam_type) 
VALUES 
(1, 3),  -- 1학년 3월
(1, 6),  -- 1학년 6월
(1, 9),  -- 1학년 9월
(2, 3),  -- 2학년 3월
(2, 6),  -- 2학년 6월
(2, 9),  -- 2학년 9월
(3, 3),  -- 3학년 3월
(3, 6),  -- 3학년 6월
(3, 9),  -- 3학년 9월
(3, 11);  -- 3학년 11월


-- 과목 분류 테이블(subject_type) 생성
CREATE TABLE subject (
    subject_id INT UNSIGNED AUTO_INCREMENT  PRIMARY KEY,  -- 과목 분류 ID
    subject_type VARCHAR(50) NOT NULL, -- 과목 타입(필수과목, 사회탐구, 과학탐구1, 과학탐구2, 제2외국어어)
    subject_name VARCHAR(50) NOT NULL 
    /* 과목명(필수과목 : 국어, 수학, 영어, 한국사
            사회탐구 : 경제, 사회문화, 법과정치, 윤리와 사상, 세계지리, 한국지리, 세계사, 동아시아사, 생활과 윤리
            과학탐구1 : 물리1, 화학1, 생명과학1, 지구과학1
            과학탐구2 : 물리2, 화학2, 생명과학2, 지구과학2
            제2외국어 : 독일어, 프랑스어, 스페인어, 중국어, 일본어, 러시아어, 아랍어, 베트남어, 한문문    )*/ 
);

-- 과목 분류 테이블 샘플 데이터 삽입 
INSERT INTO subject (subject_type, subject_name)
VALUES
('필수과목', '국어'),
('필수과목', '수학'),
('필수과목', '영어'),
('필수과목', '한국사'),
('사회탐구', '경제'),
('사회탐구', '사회문화'),
('사회탐구', '법과정치'),
('사회탐구', '윤리와 사상'),
('사회탐구', '세계지리'),
('사회탐구', '한국지리'),
('사회탐구', '세계사'),
('사회탐구', '동아시아사'),
('사회탐구', '생활과 윤리'),
('과학탐구1', '물리1'),
('과학탐구1', '화학1'),
('과학탐구1', '생명과학1'),
('과학탐구1', '지구과학1'),
('과학탐구2', '물리2'),
('과학탐구2', '화학2'),
('과학탐구2', '생명과학2'),
('과학탐구2', '지구과학2'),
('제2외국어', '독일어'),
('제2외국어', '프랑스어'),
('제2외국어', '스페인어'),
('제2외국어', '중국어'),
('제2외국어', '일본어'),
('제2외국어', '러시아어'),
('제2외국어', '아랍어'),
('제2외국어', '베트남어'),
('제2외국어', '한문');



-- 목표 성적 테이블 생성
CREATE TABLE goal_score (
    goal_score_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,     -- 목표 성적 고유 ID
    member_no INT UNSIGNED NOT NULL,                           -- 회원 번호(member 테이블 참조)
    exam_type_id INT UNSIGNED NOT NULL,                        -- 시험 분류(exam_type 참조)
    subject_id INT UNSIGNED NOT NULL,                          -- 과목(subject 테이블 참조)
    target_score INT UNSIGNED NOT NULL,                        -- 목표 원점수 (0~100)
    target_level INT UNSIGNED NOT NULL,                        -- 목표 등급 (1~9)
    FOREIGN KEY (member_no) REFERENCES member(member_no),
    FOREIGN KEY (exam_type_id) REFERENCES exam_type(exam_type_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);



-- 실제 성적 테이블 생성 
CREATE TABLE actual_score (
    actual_score_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,   -- 실제 성적 고유 ID
    member_no INT UNSIGNED NOT NULL,                           -- 회원 번호
    exam_type_id INT UNSIGNED NOT NULL,                        -- 시험 분류
    subject_id INT UNSIGNED NOT NULL,                          -- 과목
    actual_score INT UNSIGNED NOT NULL,                        -- 실제 원점수
    actual_level INT UNSIGNED NOT NULL CHECK (actual_level BETWEEN 1 AND 9),  -- 등급 (1~9)
    actual_percentage DECIMAL(5,2) NOT NULL CHECK (actual_percentage BETWEEN 0 AND 100),  -- 백분위
    actual_rank VARCHAR(30),                                   -- 석차 (예: "123/421")
    FOREIGN KEY (member_no) REFERENCES member(member_no),
    FOREIGN KEY (exam_type_id) REFERENCES exam_type(exam_type_id),
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);




SELECT * FROM goal_score WHERE member_no = 2;
SELECT * FROM exam_type WHERE member_grade = 2 AND exam_type = 3;
SELECT * FROM subject WHERE subject_name = '국어';
INSERT INTO goal_score (member_no, exam_type_id, subject_id, target_score, target_level)
VALUES
(2, 4, 1, 85, 2),  -- 고두현, 2학년 3월, 국어
(2, 4, 2, 90, 1);  -- 고두현, 2학년 3월, 수학


INSERT INTO member_goal_detail (member_no, exam_type_id, goal_detail)
VALUES (2, 4, '국어와 수학에서 모두 1등급을 목표로 꾸준히 학습하겠습니다.');

SELECT 
  m.member_name,
  et.exam_type AS exam_month,
  s.subject_name,
  gs.target_score,
  gs.target_level
FROM goal_score gs
JOIN member m ON gs.member_no = m.member_no
JOIN exam_type et ON gs.exam_type_id = et.exam_type_id
JOIN subject s ON gs.subject_id = s.subject_id
WHERE gs.member_no = 2;

INSERT INTO actual_score (member_no, exam_type_id, subject_id, actual_score, actual_level, actual_percentage, actual_rank)
VALUES (2, 4, 1, 78, 3, 85.23, '124/532');

SELECT 
  JSON_ARRAYAGG(
    JSON_OBJECT(
      'subjectId', subject_id,
      'subjectName', subject_name,
      'subjectType', subject_type
    )
  ) AS subjects
FROM subject
WHERE subject_name IN ('국어', '수학', '영어', '한국사', '물리1', '화학1');

SELECT 
  JSON_OBJECT(
    'examTypeId', exam_type_id,
    'memberGrade', member_grade,
    'examMonth', exam_type
  ) AS examInfo
FROM exam_type
WHERE member_grade = 2 AND exam_type = 3;

