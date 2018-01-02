CREATE TABLE product_class
(	class_id	Integer 	NOT NULL,
	class_code	Char(2) 	NOT NULL,
	class_name	Char(12) 	NOT NULL,

	CONSTRAINT product_class_class_id_pk
		PRIMARY KEY (class_id))

CREATE TABLE supplier
(	supplier_id		Integer 	NOT NULL,
	supplier_name 	Char(15)	NOT NULL,
	
	CONSTRAINT supplier_supplier_id_pk
		PRIMARY KEY	(supplier_id))

CREATE TABLE product
(	product_id 		Integer 	NOT NULL,
	product_name	Char(15),
	description		Char(32),
	isle			Integer ,
	qty				Integer ,
	cost 			Decimal ,
	markup			Decimal ,
	class_id 		Integer 	NOT NULL,
	supplier_id     Integer		NOT NULL,

	CONSTRAINT product_product_id_pk
		PRIMARY KEY (product_id) )  

ALTER TABLE product
	ADD CONSTRAINT product_class_id_fk
		FOREIGN KEY (class_id)
		REFERENCES product_class (class_id);
 
ALTER TABLE product
	ADD CONSTRAINT product_supplier_id_fk
		FOREIGN KEY (supplier_id)
		REFERENCES supplier_class (supplier_id);

CREATE TABLE salesrep
(	salesrep_id		Integer		NOT NULL,
	salesrep_name	Char(32),	
	
	CONSTRAINT salesrep_salesrep_id_pk
		PRIMARY KEY (salesrep_id) )

CREATE TABLE customer
(	customer_id		Integer		NOT NULL,
	customer_name	Char(32),
	customer_addr	Char(32),
	
	CONSTRAINT customer_customer_id_pk
		PRIMARY KEY (customer_id) )

CREATE TABLE sales
(	sales_id		Integer		NOT NULL,
	sale_date		Date 		NOT NULL,
	customer_id 	Integer 	NOT NULL,
	salesrep_id 	Integer 	NOT NULL,

	CONSTRAINT sales_sales_id_pk
		PRIMARY KEY (sales_id) )

ALTER TABLE sales
	ADD CONSTRAINT sales_customer_id_fk
		FOREIGN KEY(customer_id)
		REFERENCES customer (customer_id);

ALTER TABlE sales
	ADD CONSTRAINT sales_salesrep_id_fk
		FOREIGN KEY(salesrep_id)
		REFERENCES salesrep (salesrep_id);

CREATE TABLE sales_product
(	sales_id 		Integer 	NOT NULL,
	product_id 		Integer 	NOT NULL,
	qty				Integer 	NOT NULL)

ALTER TABLE sales_product
	ADD CONSTRAINT sales_product_sales_id_fk
		FOREIGN KEY(sales_id)
		REFERENCES sales (sales_id);

ALTER TABLE sales_product
	ADD CONSTRAINT sales_product_product_id_fk
		FOREIGN KEY(product_id)
		REFERENCES product (product_id);


CREATE TABLE invoice
(	invoice_id 		Integer 	NOT NULL,
	invoice_date 	Date 		NOT NULL,
	work_team		Integer 	NOT NULL,
	customer_id 	Integer 	NOT NULL,

	CONSTRAINT invoice_invoice_id_pk
		PRIMARY KEY(invoice_id))

ALTER TABLE invoice
	ADD CONSTRAINT invoice_customer_id_fk
		FOREIGN KEY(customer_id)
		REFERENCES customer(customer_id);

CREATE TABLE team
( 	teasm_id 		Integer		NOT NULL,
	job_desc		Char(64),

	CONSTRAINT team_team_id_pk
		PRIMARY KEY(team_id))

ALTER TABLE invoice
	ADD CONSTRAINT invoice_team_id_fk
		FOREIGN KEY(team_id)
		REFERENCES team(team_id);

CREATE TABLE service
(	service_code	Integer 	NOT NULL,
	service_name	Char(64),
	service_desc 	Char(64),
	service_hourly	Decimal ,

	CONSTRAINT service_service_code_pk
		PRIMARY KEY(service_code))

CREATE TABLE invoice_service
(	invoice_id 		Integer		NOT NULL,
	service_code 	Integer 	NOT NULL,
	workDuration	Decimal 	NOT NULL)

ALTER TABLE invoice_service
	ADD CONSTRAINT invoice_service_invoice_id_fk
		FOREIGN KEY(invoice_id)
		REFERENCES invoice(invoice_id);

ALTER TABLE invoice_service
	ADD CONSTRAINT invoice_service_service_code_fk
		FOREIGN KEY(service_code)
		REFERENCES service(service_code);

CREATE TABLE equipment
(	equip_id	 	Integer 	NOT NULL,
	equip_desc	 	Integer,

	CONSTRAINT equipment_equip_id_pk
		PRIMARY KEY(equip_id) )

CREATE TABlE equipment_service
( 	equip_id 		Integer 	NOT NULL,
	service_code 	Integer 	NOT NULL)

ALTER TABLE equipment_service
	ADD CONSTRAINT equipment_service_equip_id_fk
		FOREIGN KEY(equip_id)
		REFERENCES equipment(equip_id);

ALTER TABLE equipment_service
	ADD CONSTRAINT equipment_service_service_code_fk
		FOREIGN KEY(service_code)
		REFERENCES service(service_code);

CREATE TABLE employee
(	employee_id 	Integer 	NOT NULL,
	employee_name	char(64),
	OHIP			Integer		NOT NULL,
	Phone			Integer 	NOT NULL,
	startDate 		Date 		NOT NULL,
	team_id 		Integer 	NOT NULL,
	position		Char(64)    NOT NULL,

	CONSTRAINT employee_employee_id_pk
		PRIMARY KEY(employee_id) )

ALTER TABlE employee
	ADD CONSTRAINT employee_team_id_fk
		FOREIGN KEY(team_id)
		REFERENCES team(team_id);

CREATE TABLE service_employee
( 	service_code 	Integer 	NOT NULL,
	employee_id 	Integer 	NOT NULL )

ALTER TABLE service_employee
	ADD CONSTRAINT service_employee_service_code_fk
		FOREIGN KEY(service_code)
		REFERENCES service(service_code);

ALTER TABLE service_employee
	ADD CONSTRAINT service_employee_employee_id_fk
		FOREIGN KEY(employee_id)
		REFERENCES employee(employee_id);