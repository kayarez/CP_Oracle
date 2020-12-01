--check trip
create or replace procedure CheckTrip (inDateDeparture in date, inTrainId in int)
is
 ctrip number;
cursor c1 is select t.id from Trips t where t.DateDeparture = inDateDeparture and t.TrainId = inTrainId;
begin 
 open c1;
 fetch c1 into ctrip;
 
 if c1%notfound then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if;
 close c1;
 end;
 
--Add Trip
create or replace procedure AddTrip (inDateDeparture in DATE,
	inDateArrival in DATE,
	inPlaceDeparture in NVARCHAR2,
	inPlaceArrival in NVARCHAR2,
	inCost in FLOAT,
	inNumberSeats in INT,
	inTrainId in INT)
is 
ctrip number;
cursor c1 is select t.id from Trips t where t.DateDeparture = inDateDeparture and t.DateArrival = inDateArrival
and t.PlaceDeparture = inPlaceDeparture and t.PlaceArrival = inPlaceArrival and t.Cost = inCost and t.NumberSeats = inNumberSeats and t.TrainId = inTrainId;
begin
  open c1;
  fetch c1 into ctrip;
 if c1%found then
 raise_application_error(-20010, 'Error detected - '||SQLCODE||' ERROR '||SQLERRM);
 end if; 
 insert into Trips (DateDeparture, DateArrival, PlaceDeparture, PlaceArrival, Cost, NumberSeats, TrainId) values (inDateDeparture,
	inDateArrival,
	inPlaceDeparture,
	inPlaceArrival,
	inCost,
	inNumberSeats,
	inTrainId);
 commit;
 
 close c1;
 end;


--delete trip 
 create or replace procedure DeleteTrip (inDateDeparture in date, inTrainId in int)
is
begin
   CheckTrain(inDateDeparture, inTrainId);
  delete from Trips t where t.DateDeparture = inDateDeparture and t.TrainId = inTrainId;
  commit;
end;

--update DateDeparture
create or replace procedure UpdateDateDeparture(inDateDeparture in date, inId in number)
is
begin 
update Trips t set t.DateDeparture = inDateDeparture where t.id = inId;
commit;
end;

--update DateArrival
create or replace procedure UpdateDateArrival(inDateArrival in date, inId in number)
is
begin 
update Trips t set t.DateArrival = inDateArrival where t.id = inId;
commit;
end;

--update PlaceDeparture
create or replace procedure UpdatePlaceDeparture(inPlaceDeparture in nvarchar2, inId in number)
is
begin 
update Trips t set t.PlaceDeparture = inPlaceDeparture where t.id = inId;
commit;
end;

--update PlaceArrival
create or replace procedure UpdatePlaceArrival(inPlaceArrival in nvarchar2, inId in number)
is
begin 
update Trips t set t.PlaceArrival = inPlaceArrival where t.id = inId;
commit;
end;


--update Cost
create or replace procedure UpdateCost (inCost in float, inId in number)
is
begin 
update Trips t set t.Cost = inCost where t.id = inId;
commit;
end;


--update NumberSeats
create or replace procedure UpdateNumberSeats(inNumberSeats in date, inId in number)
is
begin 
update Trips t set t.NumberSeats = inNumberSeats where t.id = inId;
commit;
end;