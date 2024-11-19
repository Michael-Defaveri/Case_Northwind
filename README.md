# 📊 Case Northwind - Aumentando a Eficiência de Vendas

## 🗃️ Sobre o Banco de Dados Northwind

O banco de dados **Northwind** simula uma pequena empresa de importação/exportação. Ele é amplamente utilizado para aprendizado e demonstrações de práticas em bancos de dados relacionais.

### 📋 Tabelas Principais

- **Customers**: Informações dos clientes, incluindo nome, endereço e país.
- **Orders**: Detalhes dos pedidos, como data, cliente, e remetente.
- **Order Details**: Produtos específicos de cada pedido, com preços, quantidades e descontos aplicados.
- **Products**: Lista de produtos disponíveis, com dados como nome, preço e fornecedor.
- **Categories**: Categorias às quais os produtos pertencem.
- **Suppliers**: Informações dos fornecedores, como nome, endereço e contato.
- **Employees**: Dados dos funcionários, como nome, título e cidade.
- **Shippers**: Empresas responsáveis pelas entregas, com informações de contato.

---

## Contexto
A **Northwind Traders** é uma empresa fictícia que atua no setor de importação/exportação. Você foi contratado pela diretoria para analisar o desempenho de vendas e identificar oportunidades de melhoria baseando-se nos dados do banco de dados **Northwind**.

## 🎯 Objetivos da Análise

1. **Produtos mais vendidos**:
   - Identificar os produtos mais vendidos por quantidade e por faturamento.
   - Determinar se há alguma categoria de produto com baixo desempenho.

2. **Desempenho por região**:
   - Analisar as regiões (baseadas nos países dos clientes) que geram mais receita.
   - Identificar regiões negligenciadas ou com queda no volume de vendas.

3. **Desempenho dos fornecedores**:
   - Identificar quais fornecedores estão associados aos produtos mais vendidos.
   - Avaliar se há dependência excessiva de algum fornecedor.

4. **Eficiência dos funcionários**:
   - Determinar quais funcionários estão processando mais pedidos.
   - Verificar se há correlação entre o número de pedidos processados e o valor total gerado.

5. **Sugestão estratégica**:
   - Com base nas análises, sugerir **duas estratégias** para melhorar o desempenho da empresa.

6. Calcule a **margem de lucro por produto** com base no preço de venda e no custo do fornecedor (caso disponível). Identifique:
- Os produtos com maior margem.
- Os produtos com margens negativas ou muito baixas.

---

## 🔎 Consultas utilizadas para responder as questões levantadas pelo cliente

# 📊 Banco de Dados Northwind - Estrutura de Visões

Este script cria uma estrutura de visões no banco de dados **Northwind**, organizando os dados em tabelas de fatos e dimensões. O objetivo é facilitar análises e consultas no modelo dimensional, permitindo um acesso mais eficiente às informações.

---

## 🛠️ Script Completo

```sql
-- Tabela com Detalhes dos Pedidos Vendidos
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
    CAST(SUM((od.unit_price * od.quantity) * (1 - od.discount)) AS DECIMAL(10, 2)) AS valor_venda,
    CAST(SUM((od.unit_price * od.quantity)) - SUM((od.unit_price * od.quantity) * (1 - od.discount)) AS DECIMAL(10, 2)) AS valor_desconto
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
```

```-- Dimensão Clientes
CREATE VIEW d_clientes AS	
SELECT
    c.customer_id,
    c.company_name,
    c.city,
    c.country 
FROM
    customers c;
````

```-- Dimensão Fornecedores
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
```

```-- Dimensão Funcionários
CREATE VIEW d_funcionarios AS		
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name 
FROM
    employees e;
```

```-- Dimensão Categoria de Produto
CREATE VIEW d_categoria_produto AS	
SELECT
    c.category_id,
    c.category_name,
    c.description 
FROM
    categories c;
```

```-- Dimensão Produtos
CREATE VIEW d_produto AS	
SELECT 
    p.product_id,
    p.product_name
FROM
    products p;
```

