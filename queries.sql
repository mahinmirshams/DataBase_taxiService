--1
select *
from(
    select fname as Firstname , lname as Lastname  ,  registerDate as registerDate , isUser as isUser ,'Passenger' as role ,username as Username
    from Passenger
    Union
    select fname as Firstname , lname as Lastname , registerDate as registerDate ,isAvailable as isAvailable ,'Driver' as role , d_id as username
    from Drivers
    )

-- —2
select Drivers.lname , Drivers.fname , Drivers.state , DriversDirections.startTime
from DriversDirections natural join Driver
where date(DriversDirections.startTime) = GetDate()

-- —3
select Passenger.id , comments.comment, (select  sum(rank) /count(rank) as ave
from ranks natural join driver
where drivers.d_id = "A") as average rank
from  passenger natural join comments natural join Drivers
where  drivers.lanme ="A"


-- —4
-- not suppose to handle

-- —5
select *
from passenger,RequestRide
where passenger.p_id = RequestRide.p_id and passenger.isUser = False;

-- —6
select  drivers.d_id as DriverID , Drivers.fname as driverFirstName , Drivers.lanme as DriverLastname, RequestRide.rname as rideName , Passenger.username as PassengerUserName , Passenger.fname as PassengerFirstName , Passenger.lname as passengerLastName
from  RequestRide natural join passenger natural join Drivers
where drivers.state = "inService" and isAcceptedP = true  and isAcceptedD = true

-- —7
select sum(cost*0.3)
from RequestRide
where data_request >='2012-12-25 00:00:00'
AND data_request <'2012-12-26 00:00:00';


-- —8
select passneger.p_id as ID , passneger.username As Username
from passenger natural join RequestRide
where RequestRide.d_id = "A" and RequestRide.isAcceptedD = false

-- —9
select drivers.d_id as ID , drivers.lname as LastName
from Driver natural join request
where RequestRide.p_id = "B" and RequestRide.isAcceptedP = false

-- —10
select *
from(
    select s_id 
    from Complaint 
    where s_id = '1')
    as A
   
Union
select *
from ( select s_id 
    from RequestMoney 
    where s_id = '1'
) as B


-- 11
select *
from RequestMoney,Drivers,BackUpTeam,DriversBankAccount
where s_id = '1' and RequestMoney.d_id = Drivers.d_id and SupportTeams.s_id = RequestMoney.s_id and DriversBankAccount.d_id = RequestMoney.d_id;

-- 12
select *
from(
    select p_id , 'Passenger' as role
    from PassengerLog
    Union
    select d_id , 'Driver' as role
    from DriversLog
    Union
    select d_id , 'Driver' as role
    from DriversPhoneNumberLog
    Union
    select d_id , 'Driver' as role
    from DriversMobNumberLog
  ) as C

-- 13
select p_id,s_id,description,date_complaint,date_request
from Complaint
