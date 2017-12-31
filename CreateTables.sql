CREATE TABLE product_class
(	class_id	Integer 	NOT NULL,
	class_code	Char(2) 	NOT NULL,
	class_name	Char(12) 	NOT NULL,

	CONSTRAINT product_class_class_id_pk
		PRIMARY KEY (class_id) );

CREATE TABLE supplier
(	supplier_id		Integer 	NOT NULL,
	supplier_name 	Char(15)	NOT NULL,
	
	CONSTRAINT supplier_supplier_id_pk
		PRIMARY KEY	(supplier_id) );

CREATE TABLE product
(	product_id 		Integer 	NOT NULL,
	product_name	Char(15)	NOT NULL,
	description		Char(32)	NOT NULL,
	isle			Integer 	NOT NULL,
	cost 			Decimal 	NOT NULL,
	markup			Decimal 	NOT NULL,
	class_id 		Integer		NOT NULL,
	supplier_id     Integer		NOT NULL,

	CONSTRAINT product_product_id_pk
		PRIMARY KEY (product_id) );  

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
	salesrep_name	Char(32)	NOT NULL,	
	
	CONSTRAINT salesrep_salesrep_id_pk
		PRIMARY KEY (salesrep_id) );

CREATE TABLE customer
(	customer_id		Integer		NOT NULL,
	customer_name	Char(32)	NOT NULL,
	customer_addr	Char(32)	NOT NULL,
	
	CONSTRAINT customer_customer_id_pk
		PRIMARY KEY (customer_id) );

CREATE TABLE sales
(	sales_id		Integer		NOT NULL,
	sale_date		Date 		NOT NULL,
	customer_id 	Integer 	NOT NULL,
	salesrep_id 	Integer 	NOT NULL,

	CONSTRAINT sales_sales_id_pk
		PRIMARY KEY (sales_id) );

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
	qty				Integer 	NOT NULL);

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
		PRIMARY KEY(invoice_id) );

ALTER TABLE invoice
	ADD CONSTRAINT invoice_customer_id_fk
		FOREIGN KEY(customer_id)
		REFERENCES customer(customer_id);

CREATE TABlE team
( 	team_id 		Integer		NOT NULL,
	job_desc		Char(64)	NOT NULL,

	CONSTRAINT team_team_id_pk
		PRIMARY KEY(team_id) );

ALTER TABLE invoice
	ADD CONSTRAINT invoice_team_id_fk
		FOREIGN KEY(team_id)
		REFERENCES team(team_id);


