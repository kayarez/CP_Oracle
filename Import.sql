create table tab1( id number,
clob_data CLOB);
drop table tab1;

create or replace procedure ImportUsers(fname varchar2)
is
--work with file
l_bfile BFILE;
l_clob CLOB;
l_dest_offset integer:=1;
l_src_offset integer:= 1;
l_bfile_csid NUMBER := 0;
l_lang_context INTEGER := 0;
l_warning INTEGER := 0;
xml clob;
type curtype is ref cursor;
cur curtype;
u_row Users%rowtype;
begin
INSERT INTO tab1 (id, clob_data)
VALUES (1, empty_clob())
RETURN clob_data INTO l_clob;
l_bfile := BFILENAME('EXPORT_DIR', fname);
DBMS_LOB.fileopen(l_bfile, DBMS_LOB.file_readonly);
DBMS_LOB.loadclobfromfile (
dest_lob => l_clob,
src_bfile => l_bfile,
amount => DBMS_LOB.lobmaxsize,
dest_offset => l_dest_offset,
src_offset => l_src_offset,
bfile_csid => l_bfile_csid ,
lang_context => l_lang_context,
warning => l_warning);
DBMS_LOB.fileclose(l_bfile);
COMMIT;
end;

create or replace procedure Import
is
xml clob;
type curtype is ref cursor;
cur curtype;
u_row Users%rowtype;
begin
select clob_data into xml from tab1;
open cur for select *
FROM XMLTABLE('/Users/user'
PASSING
xmltype( to_char(xml))
COLUMNS
Id number PATH './Id',
login varchar2(30) PATH './Login',
password varchar2(100) PATH './Password');
fetch cur into u_row;
while cur%found loop
Registrationuser(u_row.login, u_row.password);
dbms_output.put_line(u_row.login|| ' '|| u_row.password);
fetch cur into u_row;
end loop;
close cur;
--truncate table tab1;
EXECUTE IMMEDIATE 'TRUNCATE TABLE tab1';
commit;
end Import;

select * from tab1;
begin
ImportUsers('Export.xml');
end;

begin
Import();
end;