--Check ticket
create or replace procedure CheckTicket (inPassport in nvarchar2, inTripId in int)
is
 cticket number;
cursor c1 is select t.id from Ticket t where t.Passport = inPassport and t.TripId = inTripId;
begin 
 open c1;
 fetch c1 into cticket;
 
 if c1%notfound then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if;
 close c1;
 end;

--Encrypt Passport
create or replace procedure encryptPassport (casualPassport in out varchar2) is
  l_key varchar2(2000) := '1234567890123456';
  l_mod NUMBER  :=DBMS_CRYPTO.encrypt_aes128
                    + DBMS_CRYPTO.chain_cbc
                    + DBMS_CRYPTO.pad_pkcs5;
  newPassport RAW(2000);
begin
  newPassport:= DBMS_CRYPTO.encrypt (utl_i18n.string_to_raw (casualPassport, 'AL32UTF8'),
                                      l_mod,
                                      utl_i18n.string_to_raw (l_key, 'AL32UTF8')
  );
  casualPassport := newPassport;
end;

--Add ticket
create or replace procedure AddTicket (	inName in NVARCHAR2, inPassport in NVARCHAR2, inTripId in INT)
is 
cticket number;
cursor c1 is select t.id from Tickets t where t.Name = inName and t.Passport = inPassport and t.Tripid = inTripId;
newPassport varchar2(2000);
begin
  newPassport := inPassport;
  encryptPassport(newPassport);
  open c1;
  fetch c1 into cticket;
 if c1%found then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if; 
 insert into Tickets (name, passport, tripId) values (inName, newPassport, inTripId);
 RemoveNumberSeats(inTripId);
 commit;
 
 close c1;
 end;

--delete train
create or replace procedure DeleteTicket (inPassport in nvarchar2, inTripId in int)
is
begin
  CheckTicket (inPassport, inTripId);
  delete from Tickets t where t.Passport = inPassport and t.TripId = inTripId;
  commit;
end;


--update name
create or replace procedure UpdateName(inName in nvarchar2, inId in number)
is
begin 
update Tickets t set t.name = inName where t.id = inId;
commit;
end;
