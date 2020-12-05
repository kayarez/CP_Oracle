CREATE TABLE Tickets (
	Id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
	Name NVARCHAR2(30) NOT NULL,
	Passport NVARCHAR2(30) NOT NULL,
	TripId INT NOT NULL,
	constraint TICKETS_PK PRIMARY KEY (Id))
  tablespace ts_Rattler;
  
drop table Tickets;  

/
CREATE TABLE Trains (
	Id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
	Type NVARCHAR2(30) NOT NULL,
	NumberTrain NVARCHAR2(30) NOT NULL UNIQUE,
	constraint TRAINS_PK PRIMARY KEY (Id))
  tablespace ts_Rattler;

drop table Trains;

/
CREATE TABLE Trips (
	Id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
	DateDeparture DATE NOT NULL,
	DateArrival DATE NOT NULL,
	PlaceDeparture NVARCHAR2(30) NOT NULL,
	PlaceArrival NVARCHAR2(30) NOT NULL,
	Cost FLOAT NOT NULL,
	NumberSeats INT NOT NULL,
	TrainId INT NOT NULL,
	constraint TRIPS_PK PRIMARY KEY (Id))
  tablespace ts_Rattler;
  
  drop table Trips;

/
CREATE TABLE Orders (
	Id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
	Dates DATE NOT NULL,
  States NVARCHAR2(15) NOT NULL,
	UserId INT NOT NULL,
  TicketId INT NOT NULL UNIQUE,
	constraint ORDERS_PK PRIMARY KEY (Id))
  tablespace ts_Rattler;

drop table Orders;
/
CREATE TABLE Users (
	Id NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
	Login VARCHAR2(30) NOT NULL UNIQUE,
	Password VARCHAR2(100) NOT NULL,
	constraint USERS_PK PRIMARY KEY (Id))
  tablespace ts_Rattler;

drop table Users;
/
ALTER TABLE Tickets ADD CONSTRAINT Tickets_fk0 FOREIGN KEY (TripId) REFERENCES Trips(Id) ON DELETE CASCADE;

ALTER TABLE Trips ADD CONSTRAINT Trips_fk0 FOREIGN KEY (TrainId) REFERENCES Trains(Id) ON DELETE CASCADE;

ALTER TABLE Orders ADD CONSTRAINT Orders_fk0 FOREIGN KEY (UserId) REFERENCES Users(Id) ON DELETE CASCADE;

ALTER TABLE Orders ADD CONSTRAINT Orders_fk1 FOREIGN KEY (TicketId) REFERENCES Tickets(Id) ON DELETE CASCADE;

ALTER TABLE Tickets DROP CONSTRAINT Tickets_fk0;
ALTER TABLE Trips DROP CONSTRAINT Trips_fk0;
ALTER TABLE Orders DROP CONSTRAINT Orders_fk0;
ALTER TABLE Orders DROP CONSTRAINT Orders_fk1;
