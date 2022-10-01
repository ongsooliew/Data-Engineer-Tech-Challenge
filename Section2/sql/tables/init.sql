--create manufacturer table (dimension)
create table if not exists manufacturer (
  manufacturer_id varchar(10) NOT null UNIQUE PRIMARY KEY, 
  manufacturer_name varchar NOT NULL, 
  manufacturer_address varchar NOT NULL, 
  manufacturer_phone varchar(20) NOT NULL
);

--create cars table (dimension)
create table if not exists cars (
  serial_number varchar(10) NOT null UNIQUE PRIMARY KEY, 
  model_name varchar NOT NULL, 
  car_price float NOT NULL, 
  car_weight float NOT null, 
  manufacturer_id varchar(10) NOT null, 
  CONSTRAINT FK_manufacturer_id FOREIGN KEY(manufacturer_id) REFERENCES public.manufacturer(manufacturer_id)
);

--create customers table (dimension)
create table if not exists customers (
  customer_id varchar(10) NOT null UNIQUE PRIMARY KEY, 
  customer_name varchar NOT NULL, 
  customer_phone varchar NOT NULL
);

--create sales_person table (dimension)
create table if not exists sales_person (
  employee_id varchar(10) NOT null UNIQUE PRIMARY KEY, 
  employee_name varchar NOT NULL, 
  employee_phone varchar NOT NULL
);


--create sales table (transaction)
create table if not exists sales (
  order_id varchar(10) NOT null UNIQUE PRIMARY KEY, 
  order_date date NOT NULL, 
  serial_number varchar(10) NOT NULL, 
  customer_id varchar(10) NOT NULL, 
  employee_id varchar(10) NOT NULL, 
  transaction_price FLOAT NOT NULL, 
  order_status VARCHAR, 
  CONSTRAINT FK_serial_number FOREIGN KEY(serial_number) REFERENCES public.cars(serial_number), 
  CONSTRAINT FK_customer_id FOREIGN KEY(customer_id) REFERENCES public.customers(customer_id), 
  CONSTRAINT FK_employee_id FOREIGN KEY(employee_id) REFERENCES public.sales_person(employee_id)
);

