select * from Users;
select * from Orders;
select * from Trains;
select * from Trips;
select * from Tickets;

truncate table Users;
truncate table Orders;
truncate table Trains;
truncate table Trips;
truncate table Tickets;

-----Trains-----
begin
AddTrain('qweeryty', '1123df4');
end;

select * from Trains t where t.type = 'qweeryty';

begin
UpdateType('qweeeryty', 150023);
end;

begin
UpdateNumber('1111123df4', 150023);
end;

select * from Trains t where t.id = 501;

begin
DeleteTrain('qweeeryty', '1111123df4');
end;

begin
DeleteTrain('Anselma', '12qwaszx');
end;

-----Trip-------

begin 
AddTrip(To_Date('2020/11/11', 'yyyy/mm/dd'), To_Date('2020/11/11', 'yyyy/mm/dd'), 'Pinsk', 'Minsk', 102, 1, 506);
end;

begin 
UpdateDateDeparture(To_Date('2020/11/12', 'yyyy/mm/dd'), 26);
end;

begin 
UpdateDateArrival(To_Date('2020/11/13', 'yyyy/mm/dd'), 26);
end;

begin 
UpdatePlaceArrival('Pupa', 26);
end;

begin 
UpdatePlaceDeparture('Lupa', 26);
end;

begin 
UpdateCost(23.7, 26);
end;

begin 
UpdateNumberSeats(3, 26);
end;


begin 
DeleteTrip('Lupa', 26);
end;

-------Order------

begin 
CancelOrder(2);
end; 

begin 
DeleteOrder(150005, 2);
end;

------XML-----
begin
ExportUsers;
end;

begin
ImportUsers('Export.xml');
end;