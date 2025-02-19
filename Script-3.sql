--DML(DATA MANIPULATION LANGUAGE) : INSERT(입력),UPDATE(수정),DELTE(삭제)
-- 연습용 테이블 생성하기
CREATE TABLE DEPT_TEMP 
AS SELECT * FROM DEPT;

SELECT * FROM DEPT_TEMP;

-- 테이블에 데이터를 추가하는 INSERT 문
-- INSERT INTO 테이블명(컬럼명...) VALUSE(데이터...)
INSERT INTO DEPT_TEMP(DEPTNO,DNAME,LOC) VALUES(50,'DATABASE','SEOUL');

INSERT INTO DEPT_TEMP VALUES(60,'BACKEND','BUSAN');
INSERT INTO DEPT_TEMP(DEPTNO) VALUES(70);
INSERT INTO DEPT_TEMP VALUES (80,'FRONTEND');
INSERT INTO DEPT_TEMP (DNAME,LOC) VALUES ('APP','DAEGU');
INSERT INTO DEPT_TEMP VALUES(80,'FRONTEND','INCHUN');

--DELETE 
SELECT *FROM DEPT_TEMP;
DELETE FROM DEPT_TEMP
WHERE DEPTNO = 80;

INSERT INTO DEPT_TEMP VALUES(70,'웹개발','');-- 빈문자열 NULL값

CREATE TABLE EMP_TEMP 
AS SELECT * FROM EMP
WHERE 1 != 1; -- 부정 FALSE 
SELECT *FROM EMP_TEMP;
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
	VALUES(9001,'나영석','PD',NULL,'2020/01/01',9000,1000,50);
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
	VALUES(9002,'강호동','MC',NULL,'2020/01/02',8000,1000,60);
INSERT INTO EMP_TEMP(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO)
	VALUES(9003,'서장훈','MC',NULL,SYSDATE,8000,1000,40);
	
UPDATE DEPT_TEMP 
	SET DNAME = 'WEN-PROGRAM',
	LOC = 'SUWAN'
	WHERE DEPTNO = 70;