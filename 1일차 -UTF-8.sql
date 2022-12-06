

insert into myTbl values ('1', '1234');
commit

select * from myTbl;

-- �� �� �ּ� : ���α׷����� �ؼ����� �ʴ� ����

/*
������ �ּ�
*/ 

-- 1. HR ���� ���� : 12 �������� ������ ������ ������ �տ� C##�� �ٿ��� �Ѵ�.
--      system �������� ������ ����â���� ����� ����Ѵ�.
-- HR : ������, ��ȣ : 1234
create user c##HR identified by 1234 ;

-- 2. HR ������ ���� �ο� : 
/* connect : ���ݿ��� DB�� ������ �� �ִ� ����, 
    resource : ��ü (resource) - Table, index, view, sotre, procedure, 
    triger, fuction�� ����, ����, ����

*/
 grant connect, resource to c##HR;
 
 --3. ���̺� �����̽��� ����� ���� �ο�, 
    -- USERS ���̺� �����̽��� ��뷮�� ������ ����� �� �ֵ��� ���� �ο�
 alter user c##HR quota unlimited on USERS;
 
 --4. HR ���� ���� - ���� ������ �Ǿ� �ִ� ��� ������ �ȵ�. ������ ���� ���� �� ���� ����
 drop user c##HR;
 
 
 show user;