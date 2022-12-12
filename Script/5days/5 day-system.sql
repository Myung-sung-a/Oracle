show user;

select * from dba_tables;

select * from dba_sequences;

select * from dba_constraints
where owner = 'C##HR';

select * from dba_constraints
where owner = 'C##HR' and table_name = 'EMPLOYEE';