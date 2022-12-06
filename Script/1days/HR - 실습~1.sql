
-- ��� ���̺� ����ϱ�
SELECT * FROM tab;

-- ���̺��� ���� Ȯ���ϱ�
    -- SELECT : ����ϱ�
    /*
        select �÷��� *: ��� �÷�
        from ���̺� �̸�
        
    */
    --1. employee ���̺��� ��� �÷��� ����϶�.
        -- �ٷ���(�����)�� ���� ������ ����
SELECT *
FROM employee;

--2. department ���̺��� ��� �÷��� ���.
    -- �μ��� ���� ������ �����ϴ� ���̺�
SELECT * 
from department;

--3. selgrade ���̺��� ��� �÷�(�ʵ�, ��ƼƼ)�� ���
    -- �Ǹ� ������ �����ϴ� ���̺�.
SELECT *
FROM salgrade;


-- ========================================================

-- �� ���̺��� ������ �÷� ����
--1. employee ���̺�
SELECT * FROM employee;
/*
    ENO : �����ȣ
    ENAME : �����
    JOB : ��å
    MANGER : ����� �����ȣ(����� �����ȣ)
    HIREDATE : �Ի���
    SALARY : ����
    COMMISSION : ���ʽ�
    DNO : �μ���ȣ
*/

--2. �μ������� �����ϴ� ���̺�
SELECT * FROM department;
/*
    DNO : �μ���ȣ
    DNAME : �μ���
    LOC : �μ��� ��ġ
*/

--3. salgrade ������ ������ �����ϴ� ���̺�
SELECT * FROM salgrade;
/*
    GRADE : ����   <== ������ ����: 
    LOSAL : ���� ���� ����
    HISAL : ���� ���� ����
    
*/

--==================================================
-- SELECT : ����϶�.
-- �÷�, �ʵ�, ��ƼƼ
-- ���ڵ� : �� �÷��� �� ��, 1����
-- ���ڵ� �� : ���ڵ���� ����
SELECT * FROM employee;

-- Ư�� �÷��� ����ϱ�
SELECT eno
FROM employee;

-- Ư�� �÷� ������ ����ϱ� (�ϳ��� �÷��� ���� ��� , <= ����)
SELECT ename, salary
FROM employee;

-- ��� �÷� ����ϱ�
SELECT eno, ename, job,manager,hiredate,salary,commission,dno 
FROM employee;

-- Ư�� �÷��� ��� �� ������ ����ϱ�
SELECT eno,ename, salary, ename, ename
FROM employee;

-- ���̺��� ���� Ȯ���ϱ� : ���̺��� �÷����� Ȯ��
DESCRIBE employee;
Desc employee;

-- �÷��� ��Ī���� ����ϱ� (as ��Ī)
SELECT eno AS �����ȣ, ename AS �����, job AS ��å
FROM employee;

SELECT eno  �����ȣ, ename  �����, job  ��å
FROM employee;


-- employee ���̺��� ��� �÷��� ��Ī���� ����ϱ�
SELECT eno �����ȣ, ename �����, job ��å, manager �����ȣ, 
hiredate �Ի���, salary "��#��", commission ���ʽ�, dno "�μ� ��ȣ"
FROM employee;

-- ������ ����Ͽ� ����ϱ� : where

SELECT *
FROM employee
WHERE eno = 7499;       -- ������ ����ؼ� ��� �� ���, eno, �÷��� ���� 7499

desc employee;      -- <== employee ���̺��� ������ Ȯ��

-- ���� ��� �� : number ������ Ÿ���� ���� ' ' ���� ���
--               number �̿��� ������ Ÿ���� '' : char, varchar, date

SELECT * FROM employee
WHERE job = 'MANAGER' ;     -- job (varchar2), ���� ������ ���� ��ҹ��ڸ� ������.
    -- job
    
desc employee;

SELECT * FROM employee

-- �μ� ��ȣ�� 20���� ��� �÷��� ����϶�.
select * from employee
where dno = 20;

-- <����>
-- salary (����) 2000���� �̻��� ����ڸ� ��� ��� �÷� ���.
select * from employee
where salary >=2000;

-- �̸��� clark�� ������� ���޸� ���
select salary, ename, eno
from employee
where ename = 'CLARK';

-- ��� ��ȣ (ENO) 7788�� �̸��� �Ի� ��¥�� ���.     <== �÷� �̸��� ��Ī���� ���
select ename ����̸� , hiredate �Ի糯¥
from employee
where eno = 7788;


--- ====Select���� ��ü ����=======================================
/*
    
select   -- �÷��� : * (��� �÷�), 
distinct -- �ߺ��� ���� �����ؼ� �ⷢ�ض� (��������)
from     -- ���̺��, �� �̸�
where    -- ����
group by -- �÷��� : Ư�� �÷��� ������ ���� �׷���
Having   -- group by���� ���� ����� ������ ó��
Order by -- �����ؼ� ��� �� �÷�, asc : �������� ����, desc : �������� ����

*/

select * from employee;

select distinct dno �μ���ȣ        
    -- distinct �ߺ��� ���� ���� �� ���, �ٸ� �÷��� ���ÿ� �۵��ϸ� ���� �߻�
from employee;

select distinct dno     -- �ߺ��� ������ �÷� 1���� ���
from employee;

-- �÷��� ������ ���� : �÷����� ������, alias(��Ī)�ؼ� ���
select eno, ename, salary ����, salary* 12 ����, commission ���ʽ�
from employee;

-- ��ü ���� ���ϱ� : ���� * 12 + commission(���ʽ�) = ��ü ����

-- null �÷��� ����(+,-,*,/)�� �ϰ� �Ǹ� ��ü�� NULL
select eno, ename, salary, commission, salary * 12 ����, (salary * 12) + commission ��ü����
from employee;

-- ��ü ������ ��� �� �� null �� �÷��� 0���� ���� �� ������ ���� �ؾ��Ѵ�.
    -- nvl �Լ� : null�� �� �÷��� �ٸ� ������ ��ȯ�ؼ� ó�����ִ� �Լ�
    -- nvl (commission,0)  <== commission �÷��� null�� 0���� �����ؼ� ó���ض�
    
select eno, ename, salary, commission, salary * 12 ����, 
    (salary * 12) + nvl(commission,0) ��ü����
from employee;


-- null�� �� �÷��� ����ϱ�  <== ����
    -- null�� �˻� �� ���� is�� ���, =�� ����ϸ� ���� �߻�

select * 
from employee
where commission is null;       -- null�� �͸� ���

select * 
from employee
where commission is not null;   -- null�� �ƴѰ͸� ���

-- where ���ǿ��� and, or ����ϱ�

-- �μ� ��ȣ�� 20,30���� ��� �÷� ���
select *
from employee
where dno = 20 or dno = 30;

select *
from employee
where dno = 20 or salary > = 2000;


select *
from employee
where dno = 20 and salary <=1500;


-- job(��å) MANAGER �̸鼭 ������ 2000 �̻��� ����ڸ� ���
select *
from employee
where job = 'MANAGER' and salary >=2000;

select * from employee;
/*  employee  ���̺��� �۾� , select ���� ���, where ������ ����ؼ� ���.
*/

--<����1> �÷� �˸��(��Ī) ,commission(���ʽ�) �÷��� null�� ���� ����ϵ� �����ȣ, ����̸�, �Ի糯¥�� ���>
select eno �����ȣ, hiredate �Ի糯¥, commission ���ʽ�
from employee
where commission is null;

--<����2> dno(�μ� ��ȣ)�� 20�̰� �Ի� ��¥�� 81�� 4�� ���� ����� �̸��� ��å�� �Ի糯¥�� ���
select ename, job, hiredate
from employee
where dno = 20 and hiredate >'1981.04.01';

--<����3> ������ ����ؼ� �����ȣ, ����̸�, ����, ���ʽ�, ��ü ������ ���
select eno, ename, salary, commission, (salary * 12) + nvl(commission,0) 
from employee;

--<����4> commission�� null�� �ƴ� ������� �̸��� ���
select *
from employee
where commission is not null;

--<����5> MANAGER (���� ���) 7698�� ����̸��� ��å�� ���.
select eno, job
from employee
where job = 'MANAGER' and eno =7698;

--<����6> ������ 1500 �̻��̰� �μ��� 20�� ����� ����̸��� �Ի糯¥, �μ� ��ȣ, ������ ���
select ename, hiredate,dno,salary
from employee
where salary >=1500 and dno = 20;

--<����7> �Ի� ��¥�� 81�� 4�� 1�� �̻��̰� 81�� 12�� ���ϱ����� ��� �̸��� �Ի� ��¥�� ���
select ename, hiredate
from employee
where hiredate between '1981.04.01' and '1981.12.31'


--<����8> ��å(job) salesman �̸鼭 ������ 1500�̻��̸鼭 �μ� ��ȣ�� 30�� ������� ���
select ename, dno, job, salary
from employee
where job = 'SALESMAN' and salary >=1500 and dno = 30;

--<����9> ������ 1500 ���� �̸鼭 �μ� ��ȣ�� 20���� �ƴ� ����̸���, ����, �μ���ȣ�� ���
select ename, salary, dno
from employee
where salary >=1500 and dno !=20;

--<����10> �����ȣ(eno)�� 7788, 7782�� �μ���ȣ�� �̸��� ��å�� ���
select dno, ename, job
from employee
where eno = 7788 or eno = 7782;





