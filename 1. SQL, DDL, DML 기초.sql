
-- 테이블 ( 엔터티 ) 생성
-- 성적 정보 저장 테이블

CREATE TABLE tbl_score
(
    name VARCHAR2(4) NOT NULL,
    kor  NUMBER(3)   NOT NULL CHECK ( kor >= 0 AND kor < 101 ),
    eng  NUMBER(3)   NOT NULL CHECK ( eng >= 0 AND eng < 101 ),
    math NUMBER(3)   NOT NULL CHECK ( math >= 0 AND math < 101 ),
    total NUMBER(3),
    average NUMBER(5, 2),
    grade CHAR(1),
    stu_num NUMBER(6),
    -- PK 거는법
    CONSTRAINT pk_stu_num PRIMARY KEY (stu_num)
);

-- 컬럼 추가 하기
ALTER TABLE tbl_score ADD (sci NUMBER(3) default 0 NOT NULL CHECK ( sci >= 0 AND sci < 101 ));

-- 컬럼 제거 하기
ALTER TABLE tbl_score DROP COLUMN sci;

-- 테이블 복사 (tb_emp)
-- CTAS (CREATE TABLE AS)
CREATE TABLE tb_emp_copy
AS SELECT * FROM tb_emp;

-- 복사 테이블 조회
SELECT * FROM tb_emp_copy;
SELECT * FROM tb_emp;

-- drop table
DROP TABLE tb_emp_copy;

-- truncate table
TRUNCATE TABLE tb_emp_copy;

-- 테이블 생성 후 PK 적용하기
ALTER TABLE TBL_SCORE
    ADD CONSTRAINT PK_STU_NUM PRIMARY KEY (STU_NUM);

-- 예시 테이블
CREATE TABLE goods (
    id NUMBER(6) PRIMARY KEY,
    g_name VARCHAR2(10) NOT NULL,
    price NUMBER(10) DEFAULT 1000,
    reg_date DATE
);

-- INSERT
INSERT INTO goods
    (id, g_name, price, reg_date)
VALUES (1, '선풍기', 120000, SYSDATE);

INSERT INTO goods
    (id, g_name, reg_date)
VALUES (2, '달고나', SYSDATE);

-- 컬럼명 생략시 모든 컬럼에 대해 순서대로 넣어야 함. ( 실무에서는 사용 금지 )
INSERT INTO goods
VALUES (4, '하하', 10000,  SYSDATE);

INSERT INTO goods
    (id, g_name, price, reg_date)
SELECT
    id, g_name, price, reg_date
FROM goods;

-- 수정 UPDATE
UPDATE goods
SET g_name = '냉장고'
WHERE id = 3;

UPDATE goods
SET  g_name = '콜라', price = 3000
WHERE ID = 2;

UPDATE goods
SET price = 9999;

-- 행을 삭제 DELETE
DELETE FROM goods
WHERE id = 2;

-- 모든 행 삭제
DELETE FROM goods;

SELECT * FROM goods;

-- SELECT 조회
SELECT
    CERTI_NM
    , ISSUE_INSTI_NM
    , CERTI_CD
FROM
     TB_CERTI;

SELECT
    CERTI_NM
    , ISSUE_INSTI_NM
FROM
     TB_CERTI;

-- 중복 제거 DISTINCT
SELECT DISTINCT
    ISSUE_INSTI_NM
FROM
    TB_CERTI;

-- 모든 컬럼 조회
-- 실무에서는 사용하지 마세요
SELECT
    *
FROM
    TB_CERTI;

-- 별칭
SELECT
    EMP_NM 이름
    , ADDR "사원의 거주지 주소"
FROM
    TB_EMP
;

-- 문자열 연결하기
SELECT
    CERTI_NM || '(' || ISSUE_INSTI_NM || ')' "자격증 정보"
FROM
    TB_CERTI
;