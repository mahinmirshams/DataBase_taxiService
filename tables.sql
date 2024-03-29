CREATE TABLE Passenger (
    p_id int NOT NULL,
    Fname varchar(50) NOT NULL,
    Lname varchar(50) NOT NULL,
    profilePic varchar(255) NOT NULL,
    username varchar(255) UNIQUE,
    isUser boolean,
    registerDate DATETIME default CURRENT_TIMESTAMP,
    credit int default 0,
    PRIMARY KEY (p_id)
);

CREATE TABLE PassengerLog (
    p_id int NOT NULL,
    Fname varchar(50) NOT NULL,
    Lname varchar(50) NOT NULL,
    profilePic varchar(255) NOT NULL,
    username varchar(255) UNIQUE,
    isUser boolean,
    credit int default 0,
    register_date DATETIME default CURRENT_TIMESTAMP,
    date_change DATETIME default CURRENT_TIMESTAMP,
    PRIMARY KEY (p_id)
);

CREATE TABLE PassengersPhoneNumber (
  phone_number varchar(50) ,
  p_id int,
  PRIMARY KEY(phone_number,p_id),
  FOREIGN KEY (p_id) REFERENCES Passenger(p_id)
);

CREATE TABLE PassengersPhoneNumberLog (
  phone_number varchar(50) ,
  p_id int,
  date_change DATETIME default CURRENT_TIMESTAMP,
  PRIMARY KEY(phone_number,p_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE PassengersAddress (
  address varchar(200) ,
  p_id int,
  PRIMARY KEY(address,p_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE PassengersAddressLog (
  address varchar(200) ,
  p_id int,
  date_change DATETIME default CURRENT_TIMESTAMP,
  PRIMARY KEY(address,p_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);




CREATE TABLE Drivers (
    d_id int NOT NULL,
    Fname varchar(50) NOT NULL,
    Lname varchar(50) NOT NULL,
    profilePic varchar(255) NOT NULL,
    register_date DATETIME default CURRENT_TIMESTAMP,
    DateOfBirth DATETIME,
    licenceYear int,
    outOfService boolean,
    isAvailable boolean,
    state varchar(10) check (state in ('inService' , 'OutOfService' , 'InSearchOfService')),
    credit int default 0,
    date_change DATETIME default CURRENT_TIMESTAMP,
    PRIMARY KEY (d_id)
);

CREATE TABLE DriversLog (
    d_id int NOT NULL,
    Fname varchar(50) NOT NULL,
    Lname varchar(50) NOT NULL,
    profilePic varchar(255) NOT NULL,
    register_date DATETIME default CURRENT_TIMESTAMP,
    DateOfBirth DATETIME,
    licenceYear int,
    outOfService boolean,
    state varchar(10),
    credit int default 0,
    PRIMARY KEY (d_id)
);

CREATE TABLE DriversPhoneNumber (
  phone_number varchar(50) ,
  d_id int,
  PRIMARY KEY(phone_number,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversPhoneNumberLog (
  phone_number varchar(50) ,
  d_id int,
  date_change DATETIME default CURRENT_TIMESTAMP,
  PRIMARY KEY(phone_number,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversMobNumber (
  phone_number varchar(50) ,
  d_id int,
  PRIMARY KEY(phone_number,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversMobNumberLog (
  phone_number varchar(50) ,
  d_id int,
  date_change DATETIME default CURRENT_TIMESTAMP,
  PRIMARY KEY(phone_number,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversBankAccount (
  bank_account varchar(50) ,
  d_id int,
  PRIMARY KEY(bank_account,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversBankAccountLog (
  bank_account varchar(50) ,
  d_id int,
  PRIMARY KEY(bank_account,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE DriversDirections (
  dd_id int NOT NULL,
  d_id int NOT NULL,
  startname varchar(50) ,
  destinationname varchar(50) ,
  xstart int,
  ystart int,
  xdestination int,
  ydestionation int,
  iscurrent boolean,
  starttime datetime,
  endtime datetime,
  PRIMARY KEY(dd_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id)
);

CREATE TABLE BackUpTeam (
  s_id int NOT NULL,
  Fname varchar(50) ,
  Lname varchar(50) ,
  profilePic varchar(255) NOT NULL,
  isonline boolean,
  PRIMARY KEY(s_id)
);

CREATE TABLE ranks (
  d_id int NOT NULL,
  p_id int NOT NULL,
  rank int NOT NULL,
  PRIMARY KEY(p_id,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE Comments (
  d_id int NOT NULL,
  p_id int NOT NULL,
  comment varchar(400),
  PRIMARY KEY(p_id,d_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE RequestRide (
  r_id int NOT NULL,
  d_id int NOT NULL,
  p_id int NOT NULL,
  rname varchar(50),
  isAcceptedD boolean,
  isAcceptedP boolean,
  SpassengerX int not Null,
  SpassengerY int not Null,
  DpassengerX int not Null,
  DpassengerY int not Null,
  cost int,
  PRIMARY KEY(r_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id)
);

CREATE TABLE RequestMoney (
  rm_id int NOT NULL,
  d_id int NOT NULL,
  s_id int,
  date_request DATETIME default CURRENT_TIMESTAMP,
  isPayed boolean,
  description varchar(400),
  cost int,
  PRIMARY KEY(rm_id),
  FOREIGN KEY (d_id) REFERENCES Drivers(d_id),
  FOREIGN KEY (s_id) REFERENCES BackUpTeam(s_id)
);

CREATE TABLE Complaint (
  c_id int NOT NULL,
  p_id int NOT NULL,
  s_id int,
  description varchar(400),
  date_complaint DATETIME default CURRENT_TIMESTAMP,
  date_response DATETIME,
  PRIMARY KEY(c_id),
  FOREIGN KEY (p_id) REFERENCES Passengers(p_id),
  FOREIGN KEY (s_id) REFERENCES BackUpTeam(s_id)
); 