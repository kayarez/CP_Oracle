begin 
RegistrationUser('Katyxkkcvqa', 'qtxcy');
end;
select * from Users;

begin 
AuthorizationUser('Katyxkkcvqa', 'qtxcy');
end;

begin 
DeleteUser('Katyxkkcvqa', 'qtxcy');
end;

begin
DeleteUser ('Katyxkkkkkkkkcvqa', 'qtxcy');
end;

begin
DeleteUser ('Kakkkkkcvqa', 'qtxcy');
end;

begin 
dbms_output.put_line('hello');
end;
insert into Users(login, password) values ('Katya', 'qwerty');

begin
CheckUser('Katya', 'qwerty');
end;

begin 
encryptpassword('asdfg');
end;