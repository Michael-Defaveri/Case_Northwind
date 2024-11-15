# 📊 Case Northwind - Aumentando a Eficiência de Vendas

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

---

## 🗂️ Tabelas Relevantes no Banco de Dados

- **Customers**: Informações sobre os clientes, incluindo país e cidade.
- **Orders**: Detalhes dos pedidos realizados.
- **Order Details**: Informações detalhadas de cada produto em um pedido, incluindo preço e quantidade.
- **Products**: Lista de produtos com informações como nome, preço e fornecedor.
- **Categories**: Categorias associadas aos produtos.
- **Suppliers**: Informações sobre os fornecedores.
- **Employees**: Detalhes sobre os funcionários.

---

## 🛠️ Requisitos Técnicos

1. Utilize o banco de dados **Northwind** para responder aos objetivos mencionados.
2. Crie consultas SQL que atendam às perguntas levantadas.
3. Use **JOINs** para conectar tabelas e extrair informações relevantes.
4. (Opcional) Visualize os resultados em gráficos ou dashboards usando ferramentas como Excel, Power BI ou Python.

---

## 🚀 Desafio Extra

Calcule a **margem de lucro por produto** com base no preço de venda e no custo do fornecedor (caso disponível). Identifique:
- Os produtos com maior margem.
- Os produtos com margens negativas ou muito baixas.

