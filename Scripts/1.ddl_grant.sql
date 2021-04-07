
INSERT INTO DEPARTMENT VALUES(1, '영업', 8);
INSERT INTO DEPARTMENT VALUES(2, '기획', 10);
INSERT INTO DEPARTMENT VALUES(3, '개발', 9);
INSERT INTO DEPARTMENT VALUES(4, '총무', 7);

INSERT INTO TITLE VALUES (1, '사장');
INSERT INTO TITLE VALUES (2, '부장');
INSERT INTO TITLE VALUES (3, '과장');
INSERT INTO TITLE VALUES (4, '대리');
INSERT INTO TITLE VALUES (5, '사원');

INSERT INTO EMPLOYEE VALUES(4377, '이성래', 1, NULL, 5000000, 2, '1999-03-01');
INSERT INTO EMPLOYEE VALUES(3426, '박영권', 3, 4377, 3000000, 1, '2000-03-01');
INSERT INTO EMPLOYEE VALUES(3011, '이수민', 2, 4377, 4000000, 3, '2001-03-01');
INSERT INTO EMPLOYEE VALUES(3427, '최종철', 5, 3011, 1500000, 3, '2002-03-01');
INSERT INTO EMPLOYEE VALUES(1003, '조민희', 3, 4377, 3000000, 2, '2003-03-01');
INSERT INTO EMPLOYEE VALUES(2106, '김창섭', 4, 1003, 2500000, 2, '2004-03-01');
INSERT INTO EMPLOYEE VALUES(1365, '김상원', 5, 3426, 1500000, 1, '2005-03-01');





-- 내 스키마
DROP SCHEMA IF EXISTS web_gradle_erp;

-- 내 스키마
CREATE SCHEMA web_gradle_erp;

-- 직책
CREATE TABLE web_gradle_erp.Title (
   titleNo   INT         NOT NULL COMMENT '직책코드', -- 직책코드
   titleName VARCHAR(20) NOT NULL COMMENT '직책명' -- 직책명
)
COMMENT '직책';

-- 직책
ALTER TABLE web_gradle_erp.Title
   ADD CONSTRAINT PK_Title -- 직책 기본키
      PRIMARY KEY (
         titleNo -- 직책코드
      );

-- 부서
CREATE TABLE web_gradle_erp.department (
   deptNo   INT         NOT NULL COMMENT '부서번호', -- 부서번호
   deptName VARCHAR(20) NOT NULL COMMENT '부서명', -- 부서명
   floor    INT         NULL     COMMENT '위치' -- 위치
)
COMMENT '부서';

-- 부서
ALTER TABLE web_gradle_erp.department
   ADD CONSTRAINT PK_department -- 부서 기본키
      PRIMARY KEY (
         deptNo -- 부서번호
      );

-- 사원
CREATE TABLE web_gradle_erp.employee (
   empno   INT         NOT NULL COMMENT '사원번호', -- 사원번호
   empname VARCHAR(20) NOT NULL COMMENT '사원명', -- 사원명
   title   INT         NULL     COMMENT '직책', -- 직책
   manager INT         NULL     COMMENT '직속상사', -- 직속상사
   salary  INT         NULL     COMMENT '급여', -- 급여
   dept    INT         NULL     COMMENT '부서', -- 부서
   hiredate date       NULL     COMMENT '입사일' -- 입사일
)
COMMENT '사원';

-- 사원
ALTER TABLE web_gradle_erp.employee
   ADD CONSTRAINT PK_employee -- 사원 기본키
      PRIMARY KEY (
         empno -- 사원번호
      );

-- 사원
ALTER TABLE web_gradle_erp.employee
   ADD CONSTRAINT FK_Title_TO_employee -- 직책 -> 사원
      FOREIGN KEY (
         title -- 직책
      )
      REFERENCES web_gradle_erp.Title ( -- 직책
        titleNo -- 직책코드
      );

-- 사원
ALTER TABLE web_gradle_erp.employee
   ADD CONSTRAINT FK_employee_TO_employee -- 사원 -> 사원
      FOREIGN KEY (
         manager -- 직속상사
      )
      REFERENCES web_gradle_erp.employee ( -- 사원
         empno -- 사원번호
      );

-- 사원
ALTER TABLE web_gradle_erp.employee
   ADD CONSTRAINT FK_department_TO_employee -- 부서 -> 사원
      FOREIGN KEY (
         dept -- 부서
      )
      REFERENCES web_gradle_erp.department ( -- 부서
         deptNo -- 부서번호
      );
      
-- 계정 권한 부여
grant all 
   on web_gradle_erp.* 
   to 'user_gradle_erp'@'localhost' identified by 'rootroot';

-- file 권한(backup, load) -- root만 권한 부여 가능
GRANT File 
   ON *.* 
   TO 'user_gradle_erp'@'localhost';