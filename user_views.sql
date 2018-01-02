CREATE VIEW invoice_statement AS
	SELECT  i.invoice_id, i.invoice_date, i.work_team,
			c.customer_id, c.customer_name, c.customer_addr,
			s.service_code, s.service_desc, s.service_hourly,
			a.workDuration, s.service_hourly * a.workDuration as TotalCharge,
			e.equip_id, e.equip_desc
	FROM	invoice i, invoice_service a, service s, 
			equimpent_service b, equimpent e, customer c
	WHERE	i.customer_id = c.customer_id
		AND i.invoice_id = a.invoice_id
		AND a.service_code = s.service_code
		AND s.service_code = b.service_code
		AND b.equip_id = e.equip_id;

CREATE VIEW Employee_Reports AS
	SELECT 	t.team_id, t.job_desc, e.position, e.employee_name, 
			e.employee_id, e.OHIP, e.phone, e.startDate, s.service_name
	FROM  	team t, employee e, service_employee  a, service s
	WHERE 		e.team_id = t.team_id
		AND		e.employee_i = a.employee_id
		AND 	a.service_code = s.service_code;

CREATE VIEW Product_Sales AS
	SELECT  c.class_code, p.product_id, p.product_name,  p.cost * p.markup AS charge
			a.qty, s.sales_id, s.sale_date, r.salesrep_id, salesrep_name,
			s.customer_id
	FROM	product_class c, product p, sales s, sales_rep r, sales_product a
	WHERE	p.class_id = c.class_id
		AND s.sales_id = a.sales_id
		AND a.product_id = p.product_id
		AND s.salesrep_id = r.salesrep_id;

CREATE VIEW Product_Report AS
	SELECT 	c.class_code, c.class_name, p.product_id, p.description
			p.cost, p.markup, p.cost * p.markup AS charge
	FROM	product_class c, product p
	WHERE 	p.class_id = c.class_id;


CREATE VIEW Invetory_Report AS
	SELECT 	p.product_id, p.description, p.qty, p.aisle, s.supplier_name
	FROM 	product p, supplier s
	WHERE	p.supplier_id = s.supplier_id;


