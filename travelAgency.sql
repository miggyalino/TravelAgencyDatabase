-- Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    role VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    salary DECIMAL(10, 2)
);
-- EmployeeAttendance Table
CREATE TABLE EmployeeAttendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    date DATE,
    time_in TIME,
    time_out TIME,
    hours_worked DECIMAL(5, 2),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);
CREATE TABLE TourOperators (
    operator_id INT PRIMARY KEY AUTO_INCREMENT,
    operator_name VARCHAR(100),
    operator_contact VARCHAR(100),
    operator_email VARCHAR(100),
    operator_country VARCHAR(50)
);
-- TourPackages Table
CREATE TABLE TourPackages (
    package_id INT PRIMARY KEY AUTO_INCREMENT,
    package_name VARCHAR(100),
    destination VARCHAR(100),
    description TEXT,
    itinerary TEXT,
    price_per_person DECIMAL(10, 2),
    capacity INT,
    start_date DATE,
    end_date DATE,
    includes_meals BOOLEAN
);
-- Clients Table
CREATE TABLE Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address TEXT,
    passport_number VARCHAR(20),
    nationality VARCHAR(50)
);
-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    package_id INT,
    booking_date DATE,
    total_cost DECIMAL(10, 2),
    status VARCHAR(20),
    feedback TEXT,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (package_id) REFERENCES TourPackages(package_id)
);
-- CancelledBookings Table
CREATE TABLE CancelledBookings (
    cancelled_booking_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    cancellation_date DATE,
    cancellation_reason TEXT,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
-- VisaApplications Table
CREATE TABLE VisaApplications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    application_date DATE,
    status VARCHAR(20),
    country VARCHAR(50),
    visa_type VARCHAR(50),
    submission_date DATE,
    decision_date DATE,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);
-- PassportApplications Table
CREATE TABLE PassportApplications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    application_date DATE,
    status VARCHAR(20),
    passport_type VARCHAR(50),
    submission_date DATE,
    decision_date DATE,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);
-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    booking_id INT,
    payment_date DATE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    transaction_id VARCHAR(50),
    payment_status VARCHAR(20),
    total_due DECIMAL(10, 2),
    last_payment_date DATE,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id) FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
CREATE TABLE TravelInsurance (
    insurance_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    insurance_provider VARCHAR(100),
    coverage_amount DECIMAL(10, 2),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);