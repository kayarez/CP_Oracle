--Check if user exists
create or replace procedure CheckUser (inLogin in varchar2, inPassword in varchar2)
is
 cuser number;
 cursor c1 is select u.id from Users u where u.login = inLogin and u.password = inPassword;
 begin 
 open c1;
 fetch c1 into cuser;
 
 if c1%notfound then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if;
 close c1;
 end;
 
 --Registration
 create or replace procedure RegistrationUser (inLogin in nvarchar2, inPassword in varchar2)
 is
 cuser number;
 cursor c1 is select u.id from Users u where u.Login = inLogin and u.password = inPassword;
   newPassword varchar2(2000);
begin
  newPassword := inPassword;
  encryptPassword(newPassword);
  open c1;
  fetch c1 into cuser;
 if c1%found then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if;
 
 insert into Users (login, password) values (inLogin, newPassword);
 commit;
 
 close c1;
 end;
  


--Encrypt password 
create or replace procedure encryptPassword (casualPassword in out varchar2) is
  l_key varchar2(2000) := '1234567890123456';
  l_mod NUMBER  :=DBMS_CRYPTO.encrypt_aes128
                    + DBMS_CRYPTO.chain_cbc
                    + DBMS_CRYPTO.pad_pkcs5;
  newPassword RAW(2000);
begin
  newPassword:= DBMS_CRYPTO.encrypt (utl_i18n.string_to_raw (casualPassword, 'AL32UTF8'),
                                      l_mod,
                                      utl_i18n.string_to_raw (l_key, 'AL32UTF8')
  );
  casualPassword := newPassword;
end;

--Authorization 
create or replace procedure AuthorizationUser (inLogin in varchar2, inPassword in varchar2)
is
  dpassword varchar2 (2000);
begin
  dpassword := inPassword;
  encryptPassword(dpassword);
  CheckUser(inLogin, dpassword);
end;

--Delete
create or replace procedure DeleteUser (inLogin in varchar2, inPassword in varchar2)
is
 dpassword varchar2 (2000);
begin
  dpassword := inPassword;
  encryptPassword(dpassword);
    CheckUser(inLogin, dPassword);
  delete from Users u where u.login = inLogin and u.password = dpassword;
  commit;
end;

