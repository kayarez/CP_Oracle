--cmd
--adrci
--show homepath
--set homepath diag\rdbms\orcl\orcl
--show hm_run

--sqlPlus 
--select name, internal_check from v$hm_check;
begin
  dbms_hm.run_check(
  check_name => 'Redo Integrity Check',
  run_name => 'RIC');
  end;

--set long 100000;  
select dbms_hm.get_run_report('RIC') from dual;

begin
  dbms_hm.run_check(
  check_name => 'DB Structure Integrity Check',
  run_name => 'DBSIC');
  end;
  
select dbms_hm.get_run_report('DBSIC') from dual;

begin
  dbms_hm.run_check(
  check_name => 'Dictionary Integrity Check',
  run_name => 'DiCIC');
  end;

select dbms_hm.get_run_report('DiCIC') from dual;
  
