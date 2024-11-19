 # Documentação de Consultas SQL

## Tabela com Detalhes dos Pedidos Vendidos

CREATE VIEW f_pedidos AS 
SELECT
    o.order_date,
    o.required_date,
    o.shipped_date,
    od.order_id,
    od.product_id AS sk_product,
    p.supplier_id AS sk_supplier,
    o.employee_id AS sk_employee,
    o.customer_id AS sk_customer,
    od.unit_price,
    od.quantity,
    od.discount,
    CAST( SUM((od.unit_price * od.quantity) * (1 - od.discount)) AS DECIMAL(10, 2)) AS valor_venda,
    CAST( SUM((od.unit_price * od.quantity)) - SUM((od.unit_price * od.quantity) * (1 - od.discount)) AS DECIMAL(10, 2)) AS valor_desconto
FROM
    order_details od
JOIN
    orders o 
    ON o.order_id = od.order_id
JOIN 
    products p 
    ON p.product_id = od.product_id 
GROUP BY
    1, 2, 3, 4, 5, 6, 7, 8
ORDER BY 
    o.order_date DESC;



-- Tabela com detalhes dos pedidos vendidos

CREATE VIEW f_pedidos AS 
SELECT
	o.order_date,
	o.required_date,
	o.shipped_date,
	od.order_id,
	od.product_id AS sk_product,
	p.supplier_id AS sk_supplier,
	o.employee_id AS sk_employee,
	o.customer_id AS sk_customer,
	od.unit_price,
	od.quantity,
	od.discount,
	CAST( SUM((od.unit_price * od.quantity) * (1 - od.discount)) AS DECIMAL(10, 2)) AS valor_venda,
	CAST( SUM((od.unit_price * od.quantity)) - SUM((od.unit_price * od.quantity) * (1 - od.discount)) AS DECIMAL(10, 2)) AS valor_desconto
FROM
	order_details od
JOIN
	orders o 
	ON o.order_id = od.order_id
JOIN 
	products p 
	ON p.product_id = od.product_id 
GROUP BY
	1,2,3,4,5,6,7,8
ORDER BY 
	o.order_date DESC;
	
	
-- Dimensão Clientes
	
CREATE VIEW d_clientes AS	
SELECT
	c.customer_id,
	c.company_name,
	c.city,
	c.country 
FROM
	customers c;
	
	
-- Dimensão Fornecedores
	
CREATE VIEW d_fornecedores AS	
SELECT
	ROW_NUMBER() OVER (ORDER BY supplier_id) AS sk_supplier,
	s.supplier_id,
	s.company_name,
	s.contact_name,
	s.country,
	s.city 
FROM
	suppliers s;
	
	
-- Dimensão Funcionarios
	
CREATE VIEW d_funcionarios AS		
SELECT
	e.employee_id,
	e.first_name,
	e.last_name,
	CONCAT( e.first_name, ' ', e.last_name) AS full_name 
FROM
	employees e; 
	
	
-- Dimensão Categoria de Produto

CREATE VIEW d_categoria_produto AS	
SELECT
	c.category_id,
	c.category_name,
	c.description 
FROM
	categories c;
	

-- Dimensão Produtos
	
CREATE VIEW d_produto AS	
SELECT 
	p.product_id,
	p.product_name
FROM
	products p; 
