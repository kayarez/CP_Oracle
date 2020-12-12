begin 
DeleteUser('Kaqcva', 'qdfgntxcy');
end;

begin 
UpdateLogin('Katya', 'qtxcy');
end;
select count(*) from Users;
select * from Users;
truncate table Users;
begin 
AuthorizationUser('Katyxkkcvqa', 'qtxcy');
end;

begin 
DeleteUser('Kaqqwa', 'qdfgntxcy');
end;


begin
AddTrain('general', '201a');
end;

begin
DeleteTrain('general', '201a');
end;

begin
UpdateType('geneeeeeeeeeral', 3);
end;

begin
UpdateNumber('202b', 3);
end;

select * from Trains;

begin 
AddTrip(To_Date('2020/11/11 17:21', 'yyyy/mm/dd HH24:MI'), To_Date('2020/11/11 17:30', 'yyyy/mm/dd HH24:MI'), 'Brest', 'Minsk', 102, 1, 1);
end;

begin 
AddTrip(To_Date('2020/11/11 17:21', 'yyyy/mm/dd HH24:MI'), To_Date('2020/11/11 17:32', 'yyyy/mm/dd HH24:MI'), 'Brest', 'Minsk', 102, 1, 1);
end;


begin
updatenumberseats(2, 2);
end;

select * from Trips;

begin
AddTicket('Prprp', 'qqw299494', 2);
end;

select * from Tickets;

begin
AddOrder(1, 1);
end;

select * from Orders;

begin
ConfirmOrder(1);
end;

begin
CancelOrder(1);
end;

begin
ExportUsers;
end;