--create sample table
create table tbltest
(ID INT,
Name char(124),
TransactionTime datetime)

--insert a row using SQL DB default time zone
insert into tbltest values (1,'Azure', getdate())

--we can see it's UTC timezone
select * from tbltest

--query your timezone
select * from sys.time_zone_info

--create function to use Pacific Standard Time 
CREATE FUNCTION dReturnDate( @dFecha as datetime)
returns DATETIME
as
begin
DECLARE @D AS datetimeoffset
SET @D = CONVERT(datetimeoffset, @Dfecha) AT TIME ZONE 'Pacific Standard Time'
RETURN CONVERT(datetime, @D);
end

-- query the function to see result
select dbo.dReturnDate(getdate()) 

-- insert 2nd row using the timezone function
insert into tbltest values (2,'SQL Database', dbo.dReturnDate(getdate()))

-- query the latest row time is PST now.
select * from tbltest



