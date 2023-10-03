insert into customer (
	customer_id,
	first_name,
	last_name,
	address,
	city,
	country,
	phone
) values (
	1,
	'Mike',
	'Metro',
	'2005 Cinema Street Seattle, WA 98271',
	'Seattle',
	'United States',
	'333-333-3333'
), (
	2,
	'Amara',
	'Swan',
	'317 Cabernet Avenue Seattle, WA 98271',
	'Seattle',
	'United States',
	'444-444-4444'
);

insert into salesperson (
	salesperson_id,
	first_name,
	last_name,
	phone,
	address,
	hourly_rate
) values (
	5,
	'Eva',
	'Painter',
	'222-222-2222',
	'431 Beach Road San Deigo, CA 55555',
	28.00
), (
	7,
	'Gretal',
	'Rose',
	'123-456-7890',
	'34211 78th Street Bath, Maine 21212',
	37.00
);

insert into car (
	car_id,
	year,
	model,
	color,
	customer_id,
	salesperson_id
) values (
	10,
	2023,
	'Civic',
	'blue',
	1,
	5
), (
	11,
	2021,
	'The forester',
	'green',
	2,
	7
);

insert into car_invoice (
	invoice_id,
	car_id,
	customer_id,
	invoice_date,
	salesperson_id
) values (
	20,
	10,
	1,
	'2023-01-01',
	5
), (
	21,
	11,
	2,
	'2023-05-05',
	7
);

insert into service (
	service_id,
	service_type,
	service_cost,
	customer_id
) values (
	30,
	'repainting',
	300.00,
	1
), (
	31,
	'replacing windsheild wipers',
	300.00,
	2	
);

insert into service_ticket (
	car_id,
	service_id,
	customer_id,
	service_date,
	service_time,
	service_type,
	ticket_id
) values (
	10,
	30,
	1,
	'2023-07-07',
	'14:00:00',
	'repainting',
	40
), (
	11,
	31,
	2,
	'2023-08-08',
	'15:30:00',
	'replacing windsheild wipers',
	41
);

create or replace function add_service_record (_ticket_id INTEGER, _record_id INTEGER, _customer_id INTEGER, _car_id INTEGER)
returns void
as $MAIN$
begin 
	insert into service_record (ticket_id, record_id, customer_id, car_id)
	values (_ticket_id, _record_id, _customer_id, _car_id);
end;
$MAIN$
language plpgsql;

select add_service_record(40,70,1,10);


insert into service_record (
	ticket_id,
	record_id,
	customer_id,
	car_id
) values (
	41,
	71,
	2,
	11
);


select * from service_record

delete from car_parts;

create or replace function add_car_parts (_item_id INTEGER, _purchase_price numeric(8,2), _retail_price numeric(10,2), _service_id INTEGER)
returns void
as $MAIN$
begin 
	insert into car_parts (item_id, purchase_price, retail_price, service_id)
	values (_item_id, _purchase_price, _retail_price, _service_id);
end;
$MAIN$
language plpgsql;

select add_car_parts(80,210.00,150.00,30);

insert into car_parts (
	item_id,
	purchase_price,
	retail_price,
	service_id
) values (
	81,
	80.00,
	70.00,
	31
);

select * from car_parts

insert into mechanic (
	mechanic_id,
	first_name,
	last_name,
	phone,
	address,
	hourly_rate,
	service_id,
	car_id
) values (
	90,
	'Philip',
	'Green',
	'232-232-2323',
	'2100 15th Street Helena, Montana 41444',
	40.00,
	30,
	10
), (
	91,
	'Lilly',
	'Stone',
	'989-999-8888',
	'314 Broadway NE Boise, Idaho 99999',
	42.00,
	31,
	11
);

select * from customer