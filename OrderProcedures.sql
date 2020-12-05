--Check order
create or replace procedure CheckOrder (inDates in date, inTicketId in int)
is
 corder number;
cursor c1 is select r.id from Orders r where r.Dates = inDates and r.TicketId = inTicketId;
begin 
 open c1;
 fetch c1 into corder;
 
 if c1%notfound then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if;
 close c1;
 end;

--Add order
create or replace procedure AddOrder ( inUserId in int, inTicketId in int)
is 
corder number;
cursor c1 is select r.id from Orders r where r.UserId = inUserId and r.TicketId = inTicketId;
begin
  open c1;
  fetch c1 into corder;
 if c1%found then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if; 
 insert into Orders (Dates, States, UserId, TicketId) values (sysdate, 'formed', inUserId, inTicketId);
 commit;
 
 close c1;
 end;

--Delete order
create or replace procedure DeleteOrder (inDates in date, inTicketId in int)
is
begin
   CheckOrder(inDates, inTicketId);
  delete from Orders r where r.Dates = inDates and r.TicketId = inTicketId;
  commit;
end;

--Cancel Order

create or replace procedure CancelOrder (inId in number)
is
begin 
update Orders r set r.States = 'canceled' where r.id = inId;
commit;
end;

--Confirm order
create or replace procedure ConfirmOrder (inId in number)
is
begin 
update Orders r set r.States = 'confirmed' where r.id = inId and r.States = 'formed';
commit;
end;

