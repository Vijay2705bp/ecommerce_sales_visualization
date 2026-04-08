create table ecommerce(
	InvoiceNo VARCHAR(20),
	StockCode VARCHAR(20),
	Description TEXT,
	Quantity INT,
	InvoiceDate TIMESTAMP,
	UnitPrice FLOAT,
	CustomerID INT,
	Country VARCHAR(50),
);

select * from ecommerce;

alter table ecommerce
add column Revenue NUMERIC,
add column Year INT,
add column Month TEXT,
add column MonthNumber INT;

update ecommerce
set
	Revenue = UnitPrice * Quantity,
	Year = EXTRACT(YEAR FROM InvoiceDate),
	Month = TO_CHAR(InvoiceDate, 'Mon'),
	MonthNumber = EXTRACT(MONTH FROM InvoiceDate);
	
delete from ecommerce
where quantity < 0;

delete from ecommerce
where UnitPrice <= 0;

select * from ecommerce limit 10;

select invoicedate,year,month,monthnumber,revenue
from ecommerce;

copy ecommerce
to '/Users/vijaykumar/Desktop/future_intern/Task1/final_data.csv'
delimiter ',' csv header;