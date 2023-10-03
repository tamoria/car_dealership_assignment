create table customer (
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	city VARCHAR(50),
	country VARCHAR(50),
	phone VARCHAR(15)
);

create table salesperson (
	salesperson_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone VARCHAR(15),
	address VARCHAR(150),
	hourly_rate INTEGER
);

create table car (
	car_id SERIAL primary key,
	year INTEGER,
	model VARCHAR(100),
	color VARCHAR(50),
	customer_id SERIAL,
	salesperson_id SERIAL,
	foreign key(customer_id) references customer(customer_id),
	foreign key(salesperson_id) references salesperson(salesperson_id)
);

create table car_invoice (
	invoice_id INTEGER primary key,
	car_id SERIAL,
	customer_id SERIAL,
	invoice_date DATE,
	salesperson_id SERIAL,
	foreign key(customer_id) references customer(customer_id),
	foreign key(salesperson_id) references salesperson(salesperson_id)
);

create table service (
	service_id SERIAL primary key,
	service_type VARCHAR(150),
	service_cost INTEGER,
	customer_id SERIAL,
	foreign key(customer_id) references customer(customer_id)
);

create table service_ticket (
	car_id SERIAL,
	service_id SERIAL,
	customer_id SERIAL,
	service_date DATE,
	service_time TIME,
	service_type VARCHAR(150),
	ticket_id INTEGER primary key,
	foreign key(car_id) references car(car_id),
	foreign key(service_id) references service(service_id),
	foreign key(customer_id) references customer(customer_id)
);

create table service_record (
	ticket_id INTEGER,
	record_id SERIAL primary key,
	customer_id SERIAL,
	car_id SERIAL,
	foreign key(ticket_id) references service_ticket(ticket_id),
	foreign key(car_id) references car(car_id)
);

create table car_parts (
	item_id SERIAL primary key,
	purchase_price NUMERIC(8,2),
	retail_price NUMERIC(10,2),
	service_id SERIAL,
	foreign key(service_id) references service(service_id)
);

create table mechanic (
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone VARCHAR(15),
	address VARCHAR(150),
	hourly_rate INTEGER,
	service_id SERIAL,
	car_id SERIAL,
	foreign key(service_id) references service(service_id),
	foreign key(car_id) references car(car_id)
);














