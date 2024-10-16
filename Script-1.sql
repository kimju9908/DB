-- SELECT 와 FROM 절
-- SELECT 문은 데이터베이스에ㅐ 보관되어 있눈 데이터 조회할 때 사용
-- SELECT 절은 FROM절에 명시한 태이블래에서 조회할 열을 지정 할 수 있음
-- SELECT [조회할 열] , [조회할 열] FROM 테이블 이름;
SELECT * FROM EMP; -- * 모든 컬럼을 의미, FROM 다음에 오는 것이 테이블 이름,SQL 수행문은 ;으로 끝남

--특정 컬럼만 선택해서 조회
SELECT EMPNO,ENAME, DEPTNO FROM EMP;
-- 사원번호와 부서번호만 나오도록 SQL 작성(EMPNO,DETPNO)
SELECT EMPNO,DEPTNO FROM EMP;
-- 한눈에 보기 좋게 별칭 부여 하기 
SELECT ENAME,SAL,COMM,SAL*12+COMM
	FROM EMP;
-- 한눈에 보기 좋게 별칭 부여하기 
SELECT ENAME 이름, SAL AS "급여", COMM AS "성과급", SAL*12"연봉"
	FROM EMP;
-- 중복 제거하는 DISTINCT, 데이터를 조회할 때 중복되는 행이 여러 행이 조회 될 때 중복된 행을 한 개씩만 선택
SELECT DISTINCT deptno 
	FROM EMP 
	ORDER BY deptno desc;

-- 컬럼값을 계산하는 산술 연산자 
SELECT ename,sal,sal*12"연간급여",sal*12+comm "총연봉"
	FROM EMP;
-- 연습문제 : 직책(job)을 중복 제거 하고 출력하기 
SELECT DISTINCT job FROM EMP;	

-- where 구문(조건문)
-- 데이터를 조회할 때 사용자가 원하는 조건에 맞는 데이터만 조회할 때 사용 
SELECT * FROM EMP -- 먼저 테이블 선택, WHERE 절에서 행을 제한하고  
WHERE DEPTNO = 10; 

-- 사원번호가 7369 번인 사원의 모든 정보를 보여줘
SELECT  * FROM EMP 
WHERE EMPNO = 7369; -- DB에서 비교연산자(=)

-- 급여가 2500 초과 인 사원번호,이름,직책,급여 출력 

SELECT ENAME,EMPNO,JOB,SAL FROM EMP 
WHERE SAL >2500 ;

-- WHERE 절에 기본 연산자 사용 
SELECT * FROM EMP 
	WHERE SAL*12 =36000;
--WHERE 절에 사용하는 비교 연산자 : > ,>=,+,<=
-- 입사일이 81년1월1일 이전 사람의 모든 정보 출력하기
SELECT * FROM  EMP 
 	WHERE HIREDATE <'81/01/01' ;-- 데이터베이스의 문자열 비교시 ' ' ,DATE 타입은 날짜의 형식에 맞으면 가능
 	
-- 같지 않읆을 표현하는 여러가지 방법(<>,!=,^= NOT 컬럼명= )
SELECT *FROM EMP 
	-- WHERE DEPTNO <>30;
	-- WHERE DEPTNO !=30;
--	WHERE NOT DEPTNO = 30;

-- 논리 연산자 : AND, OR, NOT 
-- 급여가 3000이상이고 부서가 20번 사원의 모든 정보 출력하기
SELECT *FROM EMP 
WHERE SAL>=3000 AND SAL =20 

SELECT * FROM  EMP 
WHERE SAL>=3000 AND (DEPTNO=20 OR HIREDATE <'82/01/01');

--급여가 2500 이상이고 직책이 MANGER인 사원의 모든 정보 출력 
SELECT  *FROM  EMP 
WHERE SAL > = 2500 AND JOB = 'MANAGER'

SELECT * FROM  EMP 
	WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK'
-- IN 연산자 : 여러개의 열 이름을 조회할 경우 연속해서 나열 할 수 있음
SELECT *FROM EMP 
	WHERE JOB IN ('MANAGER','SALESMAN','CLERK')
	
-- IN 연산자를 사용해 20번 30번 부서에 포함된 사원의 모든 정보 조회
SELECT *FROM EMP 
 	WHERE DEPTNO IN (20,30)
-- NOT IN 연산자를 사용해 20번과 30번 부서에 포함된 사원 조회
 SELECT *FROM EMP 
 	WHERE DEPTNO NOT IN (10);
-- 비교 연산자와 AND 연산자를 사용하여 출력하기
 SELECT *FROM EMP 
	WHEREJOB !='MANAGER'AND JOB <>'SALESMAN'AND JOB ^='CLERK'
--BETWWEN A AND B 연산자 : 일정한 범위를 초과할 때 사용하는 연산자
-- 급여가 2000에서 3000사이의 모든 정보를 출력
SELECT *FROM  
	WHERE SALC >= 2000 AND SAL <=3000;

SELECT *FROM EMP 	
WHERE SAL BTWEEN 2000 AND 300;

--사원번호거 7689에서 7902까지의 사원의 모든 정보를 출력 
SELECT * FROM EMP 
WHERE EMPNO BETWEEN 7689 AND 7902
-- 1980년이 아닌해에 입사한 사원의 모든 정보를 출력
SELECT  * FROM EMP 
	WHERE NOT HIREDATE BETWEEN '1980/01/01' AND '1980/12/31'
	
--LIKE, NOT LIKE 연산자 : 문자열을 검색할 때 사용하는 연산자 
--% : 길이와 상관없이 모든 문자 데이터를 의미 
--_ : 문자 1개를 의미
SELECT empno,ename FROM EMP 
	WHERE ename LIKE '%K%';-- 앞과 뒤의 문자열 길이에 상관없이 K라는 문자가 emnae에 사원의 정보 출력
	
-- [실습] 사원 이름에 AM이 포함되어 있는 사원 데이터만 출력 
SELECT  * FROM EMP 
	WHERE ENAME LIKE '%AM%';
-- [실습] 사원 이름에 AM이 포함되어 있지 않은 사원 데이터만 출력
	SELECT  * FROM EMP 
	WHERE ENAME NOT LIKE '%AM%';

-- 와일드 카드 문자가 데이터 일부일 경우 :(%,) escape로 지정된 '\' 뒤에 오는 %와일드카드가 아니라는 의미_
SELECT * FROM  EMP 
	WHERE ENAME LIKE '%\%S' ESCAPE '\';

INSERT INTO EMP (EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,deptno)
	VALUES(1001,'JAME%S','MANAGER',7893,'2024-10-15',3500,450,30)

DELETE FROM EMP WHERE EMPNO =1001;

-- 해당 데이터가 NULL 이 아닌 데이터만 출력하기
SELECT * FROM EMP 
	WHERE COMM IS NOT NULL;
-- 직속상관 있는 사원 데이터 출력하기 
SELECT * FROM  EMP 
	WHERE MGR IS NULL;
-- 정렬을 위한 ORDER BY 절 : 오름차순 또는 내림차순 정렬 가능 
SELECT * FROM EMP 
 ORDER BY SAL DESC;
 -- 정렬 조건을 여러 컬럼으로 설정하기 
SELECT *FROM EMP 
	ORDER BY SAL DESC , ENAME  -- 급여가 많은 사람 순으로 정렬하고, 급여가 같으면 이름순 정렬   
-- 별칭 사용과 ORDER BY 
SELECT EMPNO 사원번호 , ENAME 사원명 , SAL 원급 , HIREDATE 입사일, 
	FROM EMP -- 1.먼저 테이블을 가져옴 
	WHERE SAL>=2000 --2.해당 조건에 맞는 행을 가져옴
	ORDER BY 월급 DESC, 사원명 ASC ;
-- 연결 연산자 : SELECT문 조회 시 컬럼 사이에 특정한 문자를 넣을 때 사용
SELECT ELNAME || '의 직책은 '|| JOB "사원정보";

--1
SELECT *FROM EMP 
WHERE ENAME LIKE '%S'
--2 
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP 
WHERE DEPTNO =30 
AND JOB = 'SALESMAN'
--3 
SELECT EMPNO,ENAME,JOB,SAL,DEPTNO FROM EMP 
WHERE (DEPTNO =30 OR DEPTNO =20)
AND SAL>2000;
--4 
SELECT *FROM EMP 
WHERE SAL>=2000 
AND SAL<=3000
--5
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
AND ENAME LIKE '%E%'
AND SAL NOT BETWEEN 1000
AND 2000;
--6 
SELECT *
FROM EMP
WHERE COMM IS NULL
AND MGR IS NOT NULL
AND JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%';
--1. **EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회**
--2. **EMP테이블에서 커미션을 받지 못하는 직원 조회**
--3. **EMP테이블에서 관리자가 없는 직원 정보 조회**
--4. **EMP테이블에서 급여를 많이 받는 직원 순으로 조회**
--5. **EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회**
--6. **EMP테이블에서 사원번호, 사원명,직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)**
--7. **EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)**
--8. **EMP테이블에서 사번, 입사일, 사원명, 급여 조회  (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)**
--10. **EMP테이블에서 사번, 사원명, 급여 조회  (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)**
--12. **EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)**
--14. **EMP테이블에서 81년도에 입사한 직원 조회**
--15. **EMP테이블에서 이름이 'E'로 끝나는 직원 조회**
--16. **EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회**
--- **LIKE 사용**


--1
SELECT * FROM EMP 
WHERE COMM IS NOT NULL
--2 
SELECT * FROM EMP 
WHERE COMM IS  NULL
--3 
SELECT * FROM EMP 
WHERE MGR IS  NULL
--4 
SELECT  ENAME FROM EMP
 ORDER BY SAL ASC
 --5
 SELECT *FROM EMP 
	ORDER BY SAL DESC ,COMM
--6
SELECTEMPNO, ENAME,HIREDATE   FROM EMP 
ORDER BY HIREDATE ASC
--7
SELECTEMPNO, ENAME FROM EMP 
ORDER BY EMPNO ASC
--8
SELECT EMPNO, ENAME,HIREDATE,SAL FROM  EMP 
ORDER BY DEPTNO ASC , HIREDATE 
--10. **EMP테이블에서 사번, 사원명, 급여 조회  (단, 급여는 100단위까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)**
SELECT EMPNO,ENAME, SAL/10 FROM EMP 
ORDER BY SAL DESC 
--14
SELECT *FROM EMP
WHERE EXTRACT(YEAR FROM HIREDATE) = 1981;
-- 15. 
SELECT *FROM EMP
WHERE ENAME LIKE '%E';
--16t
SELECT *FROM EMP
WHERE ENAME LIKE '__R%';

-- 함수 : 특정 결과 데이터를 얻기 위해 데이터를 입력 할 수 있는 특수명령어를 의미 
-- 함수에는 내장 함수와 사용자 정의 함수가 있음
-- 내장 함수에는 단일행 함수와 다중행 함수로 나누어짐 
-- 단일행 함수 : 데이터가 한 행씩 입력되고 결과가 한 행씩 나오는 함수 
-- 다중행 함수 : 여러 행이 입력되어서 하나의 행으로 결과가 반환되는 것 
-- 숫자 함수 : 수학 계산식을 처리하기 위한 함수 
SELECT -10, ABS(-10) FROM DUAL;
-- ROUND(숫자,반올림할 위치) : 반올림한 결과를 반환하는 함수
SELECT  TRUNC(1234.5678) AS TRUNC,  --소숫점 첫자리에서 반올림해서 결과를 반환
	TRUNC (1234.5678,0) AS TRUNC_0,
	TRUNC(1234.5678,-1) AS TRUNC_MINUS1, --정수 첫번째 자리 반올림 1230
	TRUNC(1234.5678,-2) AS TRUNC_MINUS2,--정수 두번째 짜리에서 반올림
FROM DUAL;

--TRUNC : 버림을 한 결과를 반환하는 함수, 자릴수 지정 가능
SELECT -10, ABS(-10) FROM DUAL;
-- ROUND(숫자,반올림할 위치) : 반올림한 결과를 반환하는 함수
SELECT  TRUNC(1234.5678) AS TRUNC,  --소숫점 첫자리에서 반올림해서 결과를 반환
	TRUNC (1234.5678,0) AS TRUNC_0,
	TRUNC(1234.5678,-1) AS TRUNC_MINUS1, --정수 첫번째 자리 반올림 1230
	TRUNC(1234.5678,-2) AS TRUNC_MINUS2,--정수 두번째 짜리에서 반올림
FROM DUAL;

--MOD : 나누기한 후 나머지를 출력하는 함수
SELECT MOD(21,5) FROM dual;
-- CEIL : 소수점 이하를 올림
SELECT CEIL(21.444) FROM DUAL;
-- FLOOR : 소수점 이하를 날림
SELECT FLOOR(12.999)FROM DUAL;
-- POWER : 제곱하는 함수
SELECT POWER(3,4) FROM DUAL;
-- DUAL : SYS 계정에서 제공하는 테이블, 테이블 참조없이 실행해보기 위해 FROM절에 사용하는 더미 테이블
SELECT 20*30 FROM DUAL;
-- 문자 함수 : 문제 데이터로 부터 특정 결과를 얻고자 할 때 사용하는 함수 
SELECT ENAME , UPPER(ENAME),LOWER(ENAME),INITCAP(ENAME)
	FROM EMP ;
	
--UPPER 함수로 문자열 비교하기 
SELECT *FROM  EMP 
	WHERER UPPER(ENAME) LIKE UPPER('%JAMES%');
	
-- 문자열 길이를 구하는 LENGTH 함수, LENGRHB 함수 
-- LENGTH : 문자열 길이를 반환 
-- LENGTHB : 문자열의 바이트를 변환
SELECT LENGTH(ENAME), LENGTHB(ENAME) -- 영어는 한바이트를 차지하기 때문에 길이와 바이트 수가 동일 
	FROM EMP;

SELECT LENGTH ('하니') , LENGTHB('하니') FROM DUAL; -- 오라클XE에서 한글은 3바이트를 차지
-- 직책이름의 길이가 6글자 이상이고,COMM있는 사원의 모든정보 출력
 SELECT *FROM EMP 
  WHERE LENGTH(JOB) >=6 
  AND COMM IS NOT NULL 
  AND COMM!=0;
  
 -- SUBSTR / SUBSTRB : 시작 위치로 부터 선택 갯수만큼의 문자를 반환하는 함수, 인덱스는 1부터 시작 
 SELECT JOB, SUBSTR(JOB,1,2),SUBSTR(JOB,3,2),SUBSTR(JOB,5) FROM EMP 
 --SUBSTR 함수와 다른 함수 함께 사용
 SELECT JOB, 
 	 SUBSTR(JOB,-LENGTH(JOB),
 	 SUBSTR(JOB,-LENGTH(JOB),2),
 	 SUBSTR(JOB,-3)
 	 FROM EMP;
 	
 --INSTR : 문자열 데이터 안에 특정 문자나 문자열이 어디에 포함되어 있는지를 알고자 할 때사용 
 SELECT  INSTR('HELLO, ORACLE','R') AS INSTR_1, -- 'R'문자의 위치 
 	INSTR('HELLO,ORACLE', 'L',5) AS INSTR_2 ,-- 5번째 위치에서 시작해서 'L' 문자의 위치 찾기 
 	INSTR('HELLO, ORACLE','L',2,2) AS INSTR_3 -- 2번째 위치에서 시작해서 2번째 나타나는 문자 위치
 	FROM DUAL;
 -- 특정 문자가 포함된 행찾기 
 SELECT *FROM EMP 
 	WHERE INSTR(ENAME,'S')>0;-- 'S' 라는 문자가 포함된 행 출력
 	
 --REPLACE : 특정 문자열 데이터에 포함된 문자를 다른 문자로 대체 할 때 사용 
 SELECT '010-5006-4146' AS 변경이전 ,
 	REPLACE('010-5006-4146','-',' ') AS "변경이후",
 	REPLACE('010-5006-4146','-') AS 변경이후2
 FROM dual;
 
-- LPAD / RPAD : 기준 공간 칸수를 지정하거 반칸 만큼을 특정 문자로 채우는 함수
SELECT LPAD('ORACLE',10,'+' )FROM DUAL;
SELECT RPAD('ORACLE',10,'+' )FROM DUAL;

SELECT RPAD('010222-',14,'*') AS RPAD_JUMIN,
  	RPADA('010-5000-',13,'*') AS RPAD_PHONE
  FROM duwal ;
  
 -- 두 문자열을 합치는 concat 함수
 SELECT CONCAT(EMPNO,ENAME) AS "사원 정보",
 	CONCAT(EMPNO,CONCAT(':',ENAME)) AS " 사원정보: "
 	FROM EMP 
 	WHERE ENAME = 'JAMES';
 	
 -- TRIM / LTRIM / RTRIM : 문자열 데이터에서 특정 문자를 지우기 위해 사용, 문자를 지정하지 않으면 공백제거
 SELECT '[' || TRIM (' _ORACLE_') || ']' AS TRIM,
 '[' || LTRIM(' _ORACLE_ ') || ']' AS LTRIM,
 '[' || RTRIM(' _ORACLE_ ') || ']' AS RTRIM
 
 FROM DUAL;
 
-- 날짜 데이터를 다루는 함수 
-- 날짜 데이터+숫자: 기능,날짜에서 일수 만큼의 이 후 날짜
-- 날짜 데이터 - 날짜 데이터 : 가능, 두 날짜간의 일수 차이 
-- 날짜 데이터 + 날짜 데이터 : 연산불가
-- SYSDATE : 운영체제로 부터 시간을 가져오는 함수 
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE AS "현재 시간 ",
	SYSDATE -1 AS "어제",
	SYSDATE +1 AS "내일"
FROM DUAL;

-- 몇 개월 이후 날짜를 구하는 ADD_MONTH 함수 : 특정 날짜에 지정한 개월 수 이흐 닐짜 데이터를 반환
SELECT SYSDATE AS "현재 시간",
	ADD_MONTHS(SYSDATE,3)AS"3개월 후 날짜"    -- 현재 시간으로부터 3개월 이후 날짜 데이터 반환 
	FROM DUAL;	
-- 입사 10주년이 되는 사원들의 데이터 출력하기(입사일로 부터 10년이 경과한 날짜 데이터 반환)
SELECT EMPNO,ENAME, HIREDATE AS "입사일", ADD_MONTHS(HIREDATE, 120) "10주년"
FROM EMP;

-- 두 날짜간의 개월 수 구하는 MONTHS_BETWEEN 함수
SELECT EMPNO, ENAME ,HIREDATE, SYSDATE,
	MONTHS_BETWEEN(HIREDATE,SYSDATE) AS "-재직 기간",
	MONTHS_BETWEEN(SYSDATE,HIREDATE) AS "재직 기간",
	TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS "재직기간2"
	FROM EMP;
	
-- 돌아오는 요일(NEXT_DAY), 달의 마지막 날짜(LAST_DAY)
SELECT SYSDATE,
	NEXT_DAY(SYSDATE,'월요일'),
	LAST_DAY(SYSDATE)
FROM DUAL;
-- 날짜 정보 추출 함수 : EXTRACT 
SELECT EXTRACT (YEAR FROM DATE '2024-10-16')
FROM DUAL;

SELECT *FROM EMP 
	WHERE EXTRACT (MONTH FROM HIREDATE) = 12; 
	
-- 자료형을 변환하는 형 변환 함수
SELECT EMPNO, ENAME , EMPNO+'500' -- 오라클의 기본 형변환 변경가능 숫자로 변환 
 	FROM EMP
 WHERE ENAME = 'FORD';
-- 날짜, 숫자를 문자로 변환하는 TO_CHAR 함수 : 자바의 SimpleDateFormat 유사
SELECT SYSDATE AS "기본시간형태", TO_CHAR(SYSDATE,'YYYY/MM//DD HH24:MI:SS') AS "현재날짜"
FROM DUAL;

-- 숫자형식 데이터 형식을 지정하여 출력하기 
SELECT SAL,
     TO_CHAR(SAL, '$999,999') AS SAL_$,
     TO_CHAR(SAL, 'L999,999') AS SAL_L,
     TO_CHAR(SAL, '999,999.00') AS SAL_1,
     TO_CHAR(SAL, '000,999,999.00') AS SAL_2,
     TO_CHAR(SAL, '000999999.99') AS SAL_3,
     TO_CHAR(SAL, '999,999,00') AS SAL_4
FROM EMP;

-- TO_NUMBER : 숫자 타입의 문자열을 숫자 데이터로 변환 
SELECT  1300 - '1500', '1300'+'1500'
FROM DUAL;

-- TO_DATE : 문자열로 명시된 날짜로 변환하는 함수 
SELECT TO_DATE('24-10-24','YY/MM/DD') AS "날짜타입1"
 TO_DATE('20240714','YYYY/MM/DD') AS "날짜타입2"
 FROM DUAL;

 -- 1981년 7월 1일 이후 입사한 사원 정보 출력 
SELECT * 
 	FROM EMP 
 	WHERE HIREDATE >TO_DATE('1981/07/01','YYYY/MM/DD');
 	
 -- NULL 처리 함수 : 특정 열의 행에 데이터가 없는 경우 데이터 값이 NULL이 됨 (NULL 값이 없음)
 -- NULL : 값이 할당되지 않았기 떄문에 공백이나 0과는 다른 의미, 연산(계산,비교 등등)불가 
 -- NVL(검사할 데이터 또는 열, 앞의 데이터가 NULL인 경우 대체할 값)
 SELECT EMPNO, ENAME , SAL, COMM, SAL+COMM, 
 	NVL(COMM,0), SAL*12+NVL(COMM,0) AS "연봉"
 FROM EMP;
 -- NVL2(검사할 데이터, 데이터가 NULL이 아닐 때 반환 되는 값, 데이터가 NULL 일때 반환되는 값)
 SELECT EMPNO,ENAME,COMM,
 	NVL2(COMM,'O','X'),
 	NVL2(COMM,SAL*12+COMM,SAL*12)AS 연봉
 	FROM EMP;
 
 -- NULLIF : 두 값을 비교하여 동일하면 NULL, 동일하지 않으면 첫 번째 값을 반환 
 SELECT NULLIF(10,10),NULLIF ('A','B')
 FROM DUAL;
 
-- DECODE : 주어진 데이터 값이 조건 값과 일치하는 값을 출력하고 일치하는 값이 없으면 기본값 출력  
SELECT EMPNO, ENAME , JOB, SAL,
DECODE(JOB,
'MANAGER',SAL*1.1,
'SALESMAN',SAL*1.05,
'ANALYST',SAL,
SAL*1.03
) AS "연봉 인상"
FROM EMP;

-- CASE : SQL의 표준 함수, 일반적으로 SELECT절에서 많이 사용 됨 

SELECT EMPNO,ENAME, JOB, SAL,
	 CASE JOB 
	 	WHEN 'MANAGER' THEN SAL*1.1
	 	WHEN 'SALESMAN' THEN SAL*1.05
	 	WHEN 'ANALYST' THEN SAL
	 	ELSE SAL*1.03 
	 END  AS "연봉인상 "
	FROM EMP;	

-- 열 값에 따라 출력이 달라지는 CASE 문 : 기준데이터를 지정하지 않고 사용하는 방법 
SELECT EMPNO, ENAME , COMM, 
	CASE
		WHEN COMM IS NULL THEN '해당 사항 없음'
		WHEN COMM = 0 THEN '수당 업음'
		WHEN COMM>0THEN '수당: '|| COMM
	END AS "수당 정보"
	FROM EMP;

--1 EMP테이블에서 사번, 사원명 급여 조회 (단, 급여는 100단위 까지의 값만 출력 처리하고 급여 기준 내림차순 정렬)
SELECT EMPNO, ENAME ,TRUNC(SAL,-2) AS "SAL"
FROM EMP
ORDER BY  SAL DESC;
--2 EMP 테이블에서 9월에 입사한 직원의 정보 조회
SELECT * FROM EMP 
WHERE EXTRACT(MONTH FROM HIREDATE)=9;
--3 EMP테이블에서 사번,사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
SELECT ENAME,EMPNO,HIREDATE,
	ADD_MONTHS(HIREDATE,480)AS"40주년"    -- 현재 시간으로부터 3개월 이후 날짜 데이터 반환 
	FROM EMP;
--4 EMP 테이블에서 입사일로 부터 38년 이상 근무한 지원의 정보 조회
SELECT *FROM EMP  
WHERE ADD_MONTHS(HIREDATE,456) < '2024-10-16'
--Q1
SELECT EMPNO, RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO , 
ENAME, RPAD(SUBSTR(ENAME,1,1),5,'*') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME)=5;
--Q2
SELECT EMPNO, ENAME, SAL, TRUNC(SAL/21.5,2) AS DAY_PAY, ROUND(SAL/21.5/8,1) AS TIME_PAY 
FROM EMP;
--Q3 
SELECT EMPNO , ENAME,HIREDATE,TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'월요일'),'YYYY-MM-DD') AS R_JOB,
NVL(TO_CHAR(COMM),'N/A') AS COMM
FROM EMP;
--Q4 
SELECT EMPNO,ENAME,MGR,
CASE 
		WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
        WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
        WHEN SUBSTR(MGR, 1, 2) = '76' THEN '6666'
        WHEN SUBSTR(MGR, 1, 2) = '75' THEN '5555'
        ELSE TO_CHAR(MGR)
	 END  AS "CHG_MGR"
	FROM EMP;	
