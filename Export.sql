Create or replace directory export_dir as 'Z:\Rattler';
grant read, write on directory export_dir to pdb_Rattler_admin;

create or replace procedure ExportUsers
is
l_file UTL_FILE.file_type;
l_file_name varchar2 (60) := 'export.xml';
cursor c1 is select * from Users;
cuser xmltype;
 u_string varchar2(200);
 u Users%rowtype;

 begin
 l_file:=UTL_FIlE.fopen ('EXPORT_DIR', l_file_name, 'w');
 UTL_FILE.put_line(l_file, '<?xml version = "1.0"?>');
 UTL_FILE.put_line(l_file, '<Users>');
 open c1;
 fetch c1 into u;
 while c1%found loop
 select XMLElement("user", XMLElement("Login", u.login), XMLELEMENT("Password", u.password)) into cuser from dual;
 u_string :=cuser.getStringVal();
 UTL_FILE.put_line(l_file, u_string);
 fetch c1 into u;
 end loop;
 close c1;
 UTL_FILE.put_line(l_file, '</Users>');
 UTL_FILE.fclose(l_file);
 end ExportUsers;
 



