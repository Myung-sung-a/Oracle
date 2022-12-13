--1.EQUI 조인을 사용하여 SCOTT 사원의 부서 번호와 부서 이름을 출력 하시오.
select e.ename, e.dno,dname
from employee e, department d
where e.dno = d.dno and e.ename='SCOTT'         -- 공통 키 컬럼을 찾아야 한다.

--2. INNER JOIN과 ON 연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하시오.
select e.ename,dname,loc
from employee e inner join department d
on e.dno = d.dno
order by dname

--3. INNER JOIN과 사용하여 10번 부서에 속하는 
--모든 담당 업무의 고유한 목록(한번씩만 표시)을 부서의 지역명을 포함하여 출력 하시오.
select e.eno 사원번호, loc 지역명, job 담당업무
from employee e inner join department d
on e.dno = d.dno and d.dno = 10
----------------------------------------
select e.eno 사원번호, loc 지역명, job 담당업무, dno 부서번호
from employee e inner join department d
using (dno)
where dno = 10

--4. NATURAL JOIN을 사용하여 커밋션을 받는 모든 사원의 이름, 부서이름, 지역명을 출력 하시오. 
select ename, dname, loc
from employee natural join department
where not commission is null;
---------------------------------
select ename, dname, loc
from employee e natural join department d
where commission is not null

--5. EQUI 조인과 WildCard ( _ , %)를 사용하여 이름에 A 가 포함된 모든 사원의 이름과 부서명을 출력 하시오. 
select e.ename, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename like '%A%';

--6. NATURAL JOIN을 사용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오. 
select ename, job, dno, dname,loc
from employee natural join department
where loc = 'NEW YORK'

--7. SELF JOIN을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력 하시오. 
 	--각 열(컬럼)에 별칭값을 한글로 넣으시오.
select e.ename 사원명, e.dno 사원번호, e.ename "관리자 이름", e.manager "관리자 번호"
from employee e, employee m
where e.eno = m.manager
order by e.ename

--8. OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력 하시오.
select e.ename, e.eno
from employee e, employee m
where e.manager = m.eno(+)
order by e.eno desc;

-----------------------------
select e.ename, e.eno, m.eno, m.ename
from employee e left outer join employee m
on e.manager = m.eno
order by e.eno desc

--9. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. 
   --단, 각 열의 별칭은 이름, 부서번호, 동료로 하시오. 
select e.ename 이름, m.dno 부서번호, m.ename 동료
from employee e, employee m
where e.dno = m.dno
and e.ename = 'SCOTT'

--10. SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오. 
select e.ename 사원명, e.hiredate 입사일, m.hiredate "WARD 의 입사일", m.ename
from employee e, employee m
where e.hiredate < m.hiredate
and m.ename = 'WARD'

--11. SELF JOIN을 사용하여 관리자 보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자 이름 및 입사일과 함께 출력하시오. 
   -- 단, 각 열의 별칭을 한글로 넣어서 출력 하시오. 
select m.ename 사원이름, m.hiredate 사원입사, e.hiredate "관리자 입사", e.ename "관리자 이름"
from employee e, employee m
where e.eno = m.manager and m.hiredate < e.hiredate

-------------------------------
select e.ename 이름, e.hiredate 입사일, m.ename 관리자이름, m.hiredate 관리자입사일
from employee e join employee m
on e.manager = m.eno
where e.hiredate < m.hiredate; 

--1. 사원번호가 7788인 사원과 담당 업무가 같은 사원을 표시(사원이름 과 담당업무) 하시오.
select m.ename,m.job
from employee e, employee m
where e.eno = 7788 and e.job = m.job and m.eno <> 7788

--2. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시 (사원이름 과 담당업무) 하시오. 
select m.ename, m.job, m.salary
from employee e, employee m
where e.eno = 7499 and e.salary < m.salary

--3. 최소 급여를 받는 사원의 이름, 담당 업무 및 급여를 표시 하시오(그룹 함수 사용)
select ename, salary, job
from employee
where salary = (select min(salary)from employee)

--4. 평균 급여가 적은 사원의 담당 업무를 찾아 직급과 평균 급여를 표시하시오.
select job ,round(avg(salary),2)
from employee
group by job
order by avg(salary)

--5. 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select e.ename, e.salary, e.dno
from employee e, (select dno, min(salary) as salary from employee group by dno)m
where e.salary = m.salary
order by e.dno

--6. 담당 업무가 분석가(ANALYST) 인 사원보다 급여가 적으면서 업무가 분석가가 아닌 사원들을 표시 (사원번호, 이름, 담당업무, 급여) 하시오.
select distinct(e.eno), e.ename, e.job, e.salary
from employee e, (select salary from employee where job = 'ANALYST')m
where e.salary < m.salary
order by e.salary

--7. 부하직원이 없는 사원의 이름을 표시 하시오. 
select distinct(ename)
from employee
where ename not in(select e.ename from employee e, employee m where e.eno = m.manager)

--8. 부하직원이 있는 사원의 이름을 표시 하시오.
select distinct(e.ename)
from employee e, employee m
where e.eno = m.manager
order by e.ename

--9. BLAKE 와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하시오(단, BLAKE 는 제외). 
select m.ename, m.hiredate
from employee e, employee m
where e.dno = m.dno 
and e.ename = 'BLAKE' and not m.ename = 'BLAKE'

--10. 급여가 평균보다 많은 사원들의 사원번호와 이름을 표시하되 결과를 급여에 대해서 오름 차순으로 정렬 하시오.
select eno, ename, salary
from employee
where salary > (select avg(salary) from employee)
order by salary

--11. 이름에 K 가 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 표시하는 질의를 작성하시오.
select distinct(e.eno), m.ename
from employee e, employee m
where e.dno = m.dno
and e.ename like '%K%'

--12. 부서 위치가 DALLAS 인 사원의 이름과 부서 번호 및 담당 업무를 표시하시오.
select e.ename, e.dno, e.job, d.loc
from employee e, department d
where e.dno = d.dno
and d.loc = 'DALLAS'

--13. KING에게 보고하는 사원의 이름과 급여를 표시하시오. 
select m.ename, m.salary
from employee e, employee m
where e.eno = m.manager and e.ename = 'KING'

--14. RESEARCH 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시 하시오. 
select e.dno, e.ename, e.job
from employee e, department d
where e.dno = d.dno and d.dname = 'RESEARCH'

--15. 평균 급여보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원번호, 이름, 급여를 표시하시오.
select eno, ename, salary
from employee
where salary > (select avg(salary) from employee)
and ename like '%M%';
select ename from employee;

--16. 평균 급여가 가장 적은 업무를 찾으시오.
select job
from (select job as job from employee group by job order by avg(salary)
where rownum= 1

--17. 담당업무가 MANAGER인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오. 
select e.ename
from employee e (select dno from employee where job = 'MANAGER')m
where e.dno = m.dno