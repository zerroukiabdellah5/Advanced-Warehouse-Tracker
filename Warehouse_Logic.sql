CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    company_name VARCHAR(100),
    contact_person VARCHAR(100)
);

CREATE TABLE Stock_Movements (
    movement_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    movement_type VARCHAR(10) CHECK (movement_type IN ('IN', 'OUT')),
    quantity INT,
    movement_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Query: Stock Summary per product
SELECT product_name, 
       SUM(CASE WHEN movement_type = 'IN' THEN quantity ELSE -quantity END) as current_stock
FROM Stock_Movements
GROUP BY product_name;
