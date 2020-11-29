--Check train
create or replace procedure CheckUser (inType in nvarchar2, inNumberTrain in nvarchar2)
is
 ctrain number;
cursor c1 is select t.id from Trains t where t.Type = inType and t.NumberTrain = inNumberTrain;
begin 
 open c1;
 fetch c1 into ctrain;
 
 if c1%notfound then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if;
 close c1;
 end;

--Add train
create or replace procedure AddTrain (inType in nvarchar2, inNumberTrain in nvarchar2)
is 
ctrain number;
cursor c1 is select t.id from Trains t where t.Type = inType and t.NumberTrain = inNumberTrain;
begin
  open c1;
  fetch c1 into ctrain;
 if c1%found then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if; 
 insert into Trains (type, numbertrain) values (inType, innumbertrain);
 commit;
 
 close c1;
 end;

--delete train
create or replace procedure DeleteTrain (inType in nvarchar2, inNumberTrain in nvarchar2)
is
begin
   CheckTrain(inType, inNumberTrain);
  delete from Trains t where t.Type = inType and t.NumberTrain = inNumberTrain;
  commit;
end;

--update train
create or replace procedure UpdateType(inType in nvarchar2, inId in number)
is
begin 
update Trains set type = inType where id = inId;
commit;
end;