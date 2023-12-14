CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    PositionID INT,
    AddressID INT,
    FOREIGN KEY (PositionID) REFERENCES Position(PositionID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);
CREATE TABLE EmployeeSalaries (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    SalaryAmount DECIMAL(10, 2),
    1 PaymentDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
CREATE TABLE Position (
    PositionID INT PRIMARY KEY AUTO_INCREMENT,
    PositionName VARCHAR(50),
    Department VARCHAR(50)
);
CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    EmployeeID INT,
    PositionID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (PositionID) REFERENCES Position(PositionID)
);
CREATE TABLE OperationsStaff (
    OperationsStaffID INT PRIMARY KEY,
    EmployeeID INT,
    PositionID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (PositionID) REFERENCES Position(PositionID)
);
CREATE TABLE AdministrativeStaff (
    AdministrativeStaffID INT PRIMARY KEY,
    EmployeeID INT,
    PositionID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (PositionID) REFERENCES Position(PositionID)
);
CREATE TABLE SalesStaff (
    SalesStaffID INT PRIMARY KEY,
    EmployeeID INT,
    PositionID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (PositionID) REFERENCES Position(PositionID)
);
CREATE TABLE AccountingStaff (
    AccountingStaffID INT PRIMARY KEY,
    EmployeeID INT,
    PositionID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (PositionID) REFERENCES Position(PositionID)
);
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    AddressID INT,
    EmployeeID INT,
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
CREATE TABLE Address (
    AddressID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    EmployeeID INT,
    Street VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    Country VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    EmployeeID INT,
    BookingDate DATE,
    TravelDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
CREATE TABLE BookingStatus (
    BookingStatusID INT PRIMARY KEY AUTO_INCREMENT,
    StatusDescription VARCHAR(50),
    BookingID INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
CREATE TABLE BookingOutcome (
    BookingOutcomeID INT PRIMARY KEY AUTO_INCREMENT,
    OutcomeDescription VARCHAR(50),
    BookingID INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);
CREATE TABLE ServiceBookings (
    ServiceBookingID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    ServiceID INT,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
CREATE TABLE Services (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(50),
    Description TEXT,
    Price DECIMAL(10, 2)
);
CREATE TABLE VisaApplication (
    VisaApplicationID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    ServiceID INT,
    ApplicationDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
CREATE TABLE PassportApplication (
    PassportApplicationID INT PRIMARY KEY AUTO_INCREMENT,
    ClientID INT,
    ServiceID INT,
    ApplicationDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
CREATE TABLE TourPackages (
    TourPackageID INT PRIMARY KEY AUTO_INCREMENT,
    PackageName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2),
    TourOperatorID INT,
    ServiceID INT,
    FOREIGN KEY (TourOperatorID) REFERENCES TourOperators(TourOperatorID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
CREATE TABLE TourOperator (
    TourOperatorID INT PRIMARY KEY AUTO_INCREMENT,
    OperatorName VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    TourPackageID INT,
);
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    AirlineID INT,
    DepartureAirport VARCHAR(50),
    DestinationAirport VARCHAR(50),
    DepartureDateTime DATETIME,
    ArrivalDateTime DATETIME,
    Price DECIMAL(10, 2),
    ServiceID INT,
    FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
CREATE TABLE Airline (
    AirlineID INT PRIMARY KEY AUTO_INCREMENT,
    AirlineName VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    FlightID INT,
);
CREATE TABLE Transportation (
    TransportationID INT PRIMARY KEY AUTO_INCREMENT,
    TransportationOperatorID INT,
    DepartureLocation VARCHAR(50),
    Destination VARCHAR(50),
    DepartureDateTime DATETIME,
    ArrivalDateTime DATETIME,
    Price DECIMAL(10, 2),
    ServiceID INT,
    FOREIGN KEY (TransportationOperatorID) REFERENCES TransportationOperators(TransportationOperatorID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
CREATE TABLE TransportationOperator (
    TransportationOperatorID INT PRIMARY KEY AUTO_INCREMENT,
    OperatorName VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);
CREATE TABLE Accommodation (
    AccommodationID INT PRIMARY KEY AUTO_INCREMENT,
    HotelID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    Price DECIMAL(10, 2),
    ServiceID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotels(HotelID),
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID)
);
CREATE TABLE Hotel (
    HotelID INT PRIMARY KEY AUTO_INCREMENT,
    HotelName VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100) UNIQUE,
    AddressID INT,
    AccommodationID INT,
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID),
);