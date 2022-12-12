/*
    조인, 뷰 인덱스
*/

/*
    조인 (Join) : 두개 이상의 테이블의 컬럼을 출력 시 join을 사용해서 컬럼의 정보를 가져온다.
        -- employee, department 테이블은 원래 하나의 테이블이었다.
        -- 모델링(중복제거, 성능향상)을 사용해서 두 테이블로 분리 되었습니다.
        -- 두 개 이상의 테이블에 컬럼을 가져오기 위해서는 JOIN 문을 사용해서 출력
        -- 두 테이블을 JOIN 하기위해서는 두 테이블에서 공통의 키 컬럼이 존재 해야한다.
        -- ANSI 호환 JOIN : 모든 SQL에서 공통으로 사용하는 JOIN 구문
            Oracle, My_SQL(MariaDB), MS-SQL, IBM DB2,...  <== DBMS
    
*/

select * from employee;
select * from department;

-- EQUI JOIN : 오라클에서 제일 많이 사용하는 JOIN, <== 오라클에서만 사용.
    -- from절에 join 할 테이블을 명시, ' , '를 사용해서 나열
    -- where절에 두 테이블의 공통의 key 컬럼을 찾아서 ' = '
    -- and 절에서 조건을 처리
    
select eno 사원번호, ename 사원명, employee.dno 부서번호, dname 부서명, loc 부서위치
from employee, department
where employee.dno = department.dno
and employee.dno >= 20;