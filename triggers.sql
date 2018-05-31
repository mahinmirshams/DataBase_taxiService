
CREATE TRIGGER before_passenger_update 
    BEFORE UPDATE ON passenger
    FOR EACH ROW 
BEGIN
    INSERT INTO passengerslog
    SET action = 'update',
     p_id = OLD.p_id,
     fname = OLD.fname,
     lname = old.lname,
     profilePic = old.profilePic,
     username = old.username,
     isUser = old.isUser,
     credit = old.credit,
     regiserDate = old.regiserDate,
     change_date = NOW(); 
END；

CREATE TRIGGER before_passenger_delete
    BEFORE Delete ON passenger
    FOR EACH ROW 
BEGIN
    INSERT INTO passengerslog
    SET action = 'Delete',
     p_id = OLD.p_id,
     fname = OLD.fname,
     lname = old.lname,
     profilePic = old.profilePic,
     username = old.username,
     isUser = old.isUser,
     credit = old.credit,
     regiserDate = old.regiserDate,
     change_date = NOW(); 
END；


CREATE TRIGGER before_passengerPhoneNumber_update 
    BEFORE UPDATE ON passengersPhoneNumber
    FOR EACH ROW 
BEGIN
    INSERT INTO PassengersPhoneNumberLog
    SET action = 'update',
     p_id = OLD.p_id,
     phone_num = OLD.phone_num,
     change_date = NOW(); 
END；

CREATE TRIGGER before_passengerPhoneNumber_delete 
    BEFORE Delete ON passengersPhoneNumber
    FOR EACH ROW 
BEGIN
    INSERT INTO PassengersPhoneNumberLog
    SET action = 'Delete',
     p_id = OLD.p_id,
     phone_num = OLD.phone_num,
     change_date = NOW(); 
END；

CREATE TRIGGER before_PassengersAddress_update 
    BEFORE UPDATE ON PassengersAddress
    FOR EACH ROW 
BEGIN
    INSERT INTO PassengersAddressLog
    SET action = 'update',
     p_id = OLD.p_id,
     address = OLD.address,
     change_date = NOW(); 
END；

CREATE TRIGGER before_PassengersAddress_delete 
    BEFORE Delete ON PassengersAddress
    FOR EACH ROW 
BEGIN
    INSERT INTO PassengersAddressLog
    SET action = 'Delete',
     p_id = OLD.p_id,
     address = OLD.address,
     change_date = NOW(); 
END；



CREATE TRIGGER before_diver_update 
    BEFORE UPDATE ON Drivers
    FOR EACH ROW 
BEGIN
    INSERT INTO driverslog
    SET action = 'update',
     d_id = OLD.d_id,
     fname = OLD.fname,
     lname = old.lname,
     profilePic = old.profilePic,
     dateOfbirth = old.dateOfbirth,
     licenseYear = old.licenseYear,
     outOfService = old.outOfService,
     state = old.state,
     credit = old.credit,
     regiserDate = old.regiserDate,
     change_date = NOW(); 
END；

CREATE TRIGGER before_driver_delete
    BEFORE Delete ON Drivers
    FOR EACH ROW 
BEGIN
    INSERT INTO Driverslog
    SET action = 'Delete',
     d_id = OLD.d_id,
     fname = OLD.fname,
     lname = old.lname,
     profilePic = old.profilePic,
     dateOfbirth = old.dateOfbirth,
     licenseYear = old.licenseYear,
     outOfService = true,
     state = old.state,
     credit = old.credit,
     regiserDate = old.regiserDate,
     change_date = NOW(); 
END；


CREATE TRIGGER before_DriverPhoneNumber_update 
    BEFORE UPDATE ON DriversPhoneNumber
    FOR EACH ROW 
BEGIN
    INSERT INTO DriversPhoneNumberLog
    SET action = 'update',
     d_id = OLD.d_id,
     phone_num = OLD.phone_num,
     change_date = NOW(); 
END；

CREATE TRIGGER before_DriversPhoneNumber_delete 
    BEFORE Delete ON DriversPhoneNumber
    FOR EACH ROW 
BEGIN
    INSERT INTO DriversPhoneNumberLog
    SET action = 'Delete',
     d_id = OLD.d_id,
     phone_num = OLD.phone_num,
     change_date = NOW(); 
END；

CREATE TRIGGER before_DriverMoblieNumber_update 
    BEFORE UPDATE ON DriversMobNumber
    FOR EACH ROW 
BEGIN
    INSERT INTO DriversMobNumberLog
    SET action = 'update',
     d_id = OLD.d_id,
     phone_num = OLD.phone_num,
     change_date = NOW(); 
END；

CREATE TRIGGER before_DriversMobileNumber_delete 
    BEFORE Delete ON DriversMobNumber
    FOR EACH ROW 
BEGIN
    INSERT INTO DriversMobNumberLog
    SET action = 'Delete',
     d_id = OLD.d_id,
     phone_num = OLD.phone_num,
     change_date = NOW(); 
END；

CREATE TRIGGER before_DriversBankAccount_update 
    BEFORE UPDATE ON DriversBankAccount
    FOR EACH ROW 
BEGIN
    INSERT INTO DriversBankAccountLog
    SET action = 'update',
     d_id = OLD.d_id,
     bank_account = OLD.bank_account,
     change_date = NOW(); 
END；

CREATE TRIGGER before_DriversBankAccount_delete 
    BEFORE Delete ON DriversBankAccount
    FOR EACH ROW 
BEGIN
    INSERT INTO DriversBankAccountLog
    SET action = 'Delete',
     d_id = OLD.d_id,
     bank_account = OLD.bank_account,
     change_date = NOW(); 
END；



CREATE TRIGGER request_accepted
    BEFORE update ON RequestMoney
    FOR EACH ROW 
 	SET 
      credit = 0.61*cost;


CREATE TRIGGER update_request
    AFTER update ON RequestMoney
    FOR EACH ROW 
 	SET 
      isPayed = true;
   
