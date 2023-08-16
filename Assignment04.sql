create database Assesment04Db
use Assesment04Db

create database Assesment04Db
use Assesment04Db

create table Products
(PId int primary Key identity(500,1),

PName nvarchar(50) not null,
PPrice float,
PTax as PPrice * 0.10 persisted,
PCompany nvarchar (50),
PQty int)

insert into Products values ('TV',25000.0,'Samsung',1)

insert into Products values ('Mobile',85000.0,'Apple',2)

insert into Products values ('TV',28000.0,'Redmi',3)

insert into Products values ('Laptop',65000.0,'HTC',4)

insert into Products values ('Mobile',15000.0,'RealMe',5)

insert into Products values ('HeadSet',2000.0,'Xiaomi',6)
select * from Products
--------------------------------------------------------------------------------------
create proc GetTotalPrice
with encryption
as 
begin
select PId,PName,(PPrice+PTax) "PriceWithTax",PCompany,(PQty*(PPrice+PTax)) "TotalPrice" from Products
end

exec GetTotalPrice
---------------------------------------------------------------------------------------

create proc TotalTax
@PCompany nvarchar(100),
@TotalTax float output
with encryption
as
begin
select
@TotalTax=SUM(PTax)
from Products
where PCompany = @PCompany
end

declare @TotalTax float
exec TotalTax 'Apple', @TotalTax output
print 'Total Tax for Apple: ' + CONVERT(varchar, @TotalTax)

declare @TotalTax float
exec TotalTax 'Redmi', @TotalTax output
print 'Total Tax for Redmi: ' + CONVERT(varchar, @TotalTax)

declare @TotalTax float
exec TotalTax 'Realme', @TotalTax output
print 'Total Tax for Realme: ' + CONVERT(varchar, @TotalTax)

declare @TotalTax float
exec TotalTax 'Xiaomi', @TotalTax output
print 'Total Tax for Xiaomi: ' + CONVERT(varchar, @TotalTax)

declare @TotalTax float
exec TotalTax 'HTC', @TotalTax output
print 'Total Tax for HTC: ' + CONVERT(varchar, @TotalTax)



