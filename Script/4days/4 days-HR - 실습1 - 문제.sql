

-- 복사된 테이블
select * from emp;
desc emp;
--1. 값을 3 레코드 입력, 모든 값 입력, null이 허용된 컬럼에 null 넣기
insert into emp
values(6549, 'MARY', 'ANALYST', 7458, '98/02/22', 2600,300,20);

insert into emp
values(6539, 'MARIA', 'ANALYST', null, '80/01/22', 1600,300,10);

insert into emp
values(6579, 'SAM', null, null, '81/03/17', 3600,120,30);


--2. update를 사용해서 데이터 수정, scott의 보너스 500으로 수정
update emp
set commission = 500
where ename = 'SCOTT'

 -- 영업사원들의 보너스 300만원으로 수정,
 update emp
 set commission = 300
 where job = 'SALESMAN'
    
 -- ward의 부서를 10번으로 수정
 update emp
 set dno = 10
 where ename = 'WARD'
 
-- allen의 manager를 7839, 월급을 1800, 입사월 22/01/01로 수정
update emp
set manager = 7839, salary = 1800, hiredate = '22/01/01'
where ename = 'ALLEN'
    
--3. delete : eno 7782 와 eno 7698의 레코드를 삭제

delete emp
where eno in(7782,7698)


