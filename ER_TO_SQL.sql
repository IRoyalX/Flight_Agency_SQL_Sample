-- Tables
CREATE TABLE Address (
  addressID INT PRIMARY KEY,
  province CHAR(50),
  city CHAR(50),
  street CHAR(50),
  postalcode CHAR(10)
);

CREATE TABLE Agency (
  registerationNO INT PRIMARY KEY,
  name CHAR(70),
  phone CHAR(10),
  website VARCHAR(255)
);

CREATE TABLE Airline (
  code INT PRIMARY KEY,
  name CHAR(70),
  phone VARCHAR(15),
  addressID INT,
  FOREIGN KEY (addressID) REFERENCES Address(addressID)
);

CREATE TABLE Airplane (
  code INT PRIMARY KEY,
  name CHAR(70),
  typ CHAR(70),
  seats INT,
  Airlinecode INT,
  FOREIGN KEY (Airlinecode) REFERENCES Airline(code)
);

CREATE TABLE Flight (
  flightNO INT PRIMARY KEY,
  origin VARCHAR(255),
  destination VARCHAR(255),
  departure DATE,
  arrival DATE,
  Airlinecode INT,
  AgencyregisterationNO INT,
  FOREIGN KEY (Airlinecode) REFERENCES Airline(code),
  FOREIGN KEY (AgencyregisterationNO) REFERENCES Agency(registerationNO)
);

CREATE TABLE Members (
  memberID INT PRIMARY KEY,
  Name CHAR(70),
  job CHAR(70),
  age INT,
  gender CHAR(10),
  FlightflightNO INT,
  FOREIGN KEY (FlightflightNO) REFERENCES Flight(flightNO)
);

CREATE TABLE Ticket (
  ticketNO INT PRIMARY KEY,
  seat INT,
  typ CHAR(2),
  issue DATE,
  fee INT,
  AgencyregisterationNO INT,
  FOREIGN KEY (AgencyregisterationNO) REFERENCES Agency(registerationNO)
);

CREATE TABLE Passenger (
  NationalID CHAR(10),
  PassengerID INT PRIMARY KEY,
  gender CHAR(10),
  Name CHAR(70),
  age INT,
  phone VARCHAR(15),
  AddressaddressID INT,
  FOREIGN KEY (AddressaddressID) REFERENCES Address(addressID)
);

-- N-M relationships
CREATE TABLE Buying (
  ticketNO INT PRIMARY KEY,
  PassengerID INT,
  FOREIGN KEY (ticketNO) REFERENCES Ticket(ticketNO),
  FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);

CREATE TABLE Partnership (
  registerationNO INT,
  code INT,
  PRIMARY KEY (registerationNO, code),
  FOREIGN KEY (registerationNO) REFERENCES Agency(registerationNO),
  FOREIGN KEY (code) REFERENCES Airline(code)
);

-- Address INSERTs
INSERT INTO Address VALUES
(1, 'Esfahan', 'City1', 'Street1', '12345'),
(2, 'Esfahan', 'City2', 'Street2', '67890'),
(3, 'Shiraz', 'City3', 'Street2', '10101'),
(4, 'Mashhad', 'City2', 'Street3', '10000'),
(5, 'Kerman', 'City5', 'Street9', '22222'),
(6, 'Lorestan', 'City3', 'Street1', '33221'),
(7, 'Qeshm', 'City6', 'Street0', '66881');

-- Agency INSERTs
INSERT INTO Agency VALUES
(1, 'Asmane Sepid', '1234567890', 'www.AsmaneSepid.com'),
(2, 'Sabz Gasht', '9876543210', 'www.SabzGasht.com'),
(3, 'Safar Omid', '0900000000', 'www.SafarOmid.com'),
(4, 'ShahrTash Seir', '0800000001', 'www.ShahrTashSeir.com');

-- Airline INSERTs
INSERT INTO Airline VALUES
(1, 'Iran Air', '123-456-7890', 2),
(2, 'Mahan Air', '987-654-3210', 1),
(3, 'Qeshm Air', '111-000-222', 7);

-- Airplane INSERTs
INSERT INTO Airplane VALUES
(1, 'Boeing 747', 'Large', 300, 1),
(2, 'Airbus A320', 'Medium', 150, 2),
(3, 'Cessna 172', 'Small', 20, 1),
(4, 'Boeing 747', 'Large', 300, 3);

-- Flight INSERTs
INSERT INTO Flight VALUES 
(1001, 'Mashhad', 'Shiraz', '1402-07-04', '1402-07-05', 2, 1),
(1002, 'Esfahan', 'Shiraz', '1402-07-04', '1402-07-05', 2, 2),
(1003, 'Shiraz', 'Kerman', '1403-08-07', '1403-08-08', 1, 1),
(1004, 'Zerman', 'Yazd', '1402-07-04', '1402-07-05', 3, 3),
(1005, 'Mashhad', 'Shiraz', '1402-08-09', '1402-08-10', 1, 4),
(1006, 'Tehran', 'Rasht', '1403-12-15', '1403-12-16', 3, 4);

-- Members INSERTs
INSERT INTO Members VALUES
(101, 'Ali Rezaei', 'Pilot', 35, 'Male', 1001),
(107, 'Reza Gholami', 'Co-Pilot', 38, 'Male', 1001),
(106, 'Parisa Ahmadi', 'Cabin Crew', 26, 'Female', 1001),
(102, 'Fariba Rahimi', 'Pilot', 28, 'Female', 1002),
(111, 'Khosro Ebrahimi', 'Co-Pilot', 29, 'Male', 1002),
(108, 'Sara Khosravi', 'Cabin Crew', 31, 'Female', 1002),
(103, 'Mehrdad Jafari', 'Pilot', 40, 'Male', 1003),
(104, 'Nasrin Mohammadi', 'Co-Pilot', 32, 'Female', 1003),
(109, 'Amir Talebi', 'Cabin Crew', 42, 'Male', 1003),
(105, 'Hossein Kazemi', 'Pilot', 45, 'Male', 1004),
(127, 'Reza Gholami', 'Co-Pilot', 38, 'Male', 1004),
(126, 'Parisa Ahmadi', 'Cabin Crew', 26, 'Female', 1004),
(138, 'Sara Khosravi', 'Pilot', 31, 'Female', 1005),
(141, 'Khosro Ebrahimi', 'Co-Pilot', 29, 'Male', 1005),
(112, 'Sanaz Rostami', 'Cabin Crew', 37, 'Female', 1005),
(131, 'Ali Rezaei', 'Pilot', 35, 'Male', 1006),
(110, 'Leila Abbasi', 'Co-Pilot', 33, 'Female', 1006),
(146, 'Parisa Ahmadi', 'Cabin Crew', 26, 'Female', 1006),
(113, 'Mohammad Karimi', 'Engineer', 34, 'Male', 1001),
(114, 'Maryam Hosseini', 'Dispatcher', 30, 'Female', 1002),
(115, 'Ahmad Rezaei', 'Technician', 41, 'Male', 1003),
(116, 'Zahra Mohseni', 'Co-Pilot', 29, 'Female', 1004),
(117, 'Ehsan Fallahi', 'Technician', 36, 'Male', 1005),
(118, 'Fatemeh Rahimi', 'Cabin Crew', 27, 'Female', 1006),
(119, 'Ali Akbari', 'Engineer', 39, 'Male', 1001),
(120, 'Sahar Mousavi', 'Dispatcher', 32, 'Female', 1002),
(121, 'Reza Davoodi', 'Pilot', 37, 'Male', 1003);



-- Ticket INSERTs
INSERT INTO Ticket VALUES
(1, 5, 'A', '1402-02-01', 100000, 1),
(2, 8, 'C', '1400-04-07', 400000, 2),
(3, 12, 'C', '1398-06-03', 700000, 1),
(4, 15, 'A', '1402-03-05', 250000, 2),
(5, 3, 'B', '1402-02-08', 250000, 3),
(6, 3, 'B', '1402-02-18', 300000, 3),
(7, 5, 'A', '1402-03-08', 300000, 4),
(8, 7, 'B', '1402-02-08', 500000, 4),
(9, 3, 'C', '1400-05-20', 375000, 1);

-- Passenger INSERTs
INSERT INTO Passenger VALUES
('1234567890', 102, 'Male', 'Reza Naghdi', 21, '09112233445', 3),
('2222222222', 103, 'Female', 'Maryam Naghdi', 38, '09111111111', 3),
('0987654321', 101, 'Female', 'Maryam Akbari', 50, '09100000000', 4),  
('4444444444', 105, 'Male', 'Hamid Ebadi', 18, '09136665566', 5),
('6666666666', 108, 'Male', 'Akbar Mahmoodi', 20, '09136665566', 6);

-- Buying INSERTs
INSERT INTO Buying VALUES
(1, 101),
(2, 103),
(3, 108),
(4, 105),
(5, 108),
(6, 103),
(7, 102),
(8, 102),
(9, 105);

-- Partnership INSERTs
INSERT INTO Partnership VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(3, 3),
(1, 3);

SELECT Agency.name, COUNT(Buying.ticketNO) AS SoldTickets
FROM Agency
LEFT JOIN Ticket ON Agency.registerationNO = Ticket.AgencyregisterationNO
LEFT JOIN Buying ON Ticket.ticketNO = Buying.ticketNO
GROUP BY Agency.registerationNO;

SELECT Members.Name AS member_name, Members.job, Flight.flightNO, Airline.name AS airline_name
FROM Members
INNER JOIN Flight ON Members.FlightflightNO = Flight.flightNO
INNER JOIN Airline ON Flight.Airlinecode = Airline.code
WHERE Airline.name LIKE 'Iran Air';

SELECT Passenger.gender, AVG(Passenger.age) AS AgeAVG
FROM Passenger
JOIN Buying ON Passenger.PassengerID = Buying.PassengerID
GROUP BY Passenger.gender;

SELECT Ticket.ticketNO, Ticket.fee, Agency.name
FROM Ticket
INNER JOIN Partnership ON Ticket.AgencyregisterationNO = Partnership.registerationNO
INNER JOIN Agency ON Partnership.registerationNO = Agency.registerationNO
LEFT JOIN Airline ON Partnership.code = Airline.code
WHERE Airline.name LIKE 'Mahan Air';

SELECT Flight.flightNO, Flight.origin, Flight.destination, Airline.name
FROM Flight
INNER JOIN Airline ON Flight.Airlinecode = Airline.code
INNER JOIN Address ON Airline.addressID = Address.addressID
WHERE Address.province = 'Esfahan';