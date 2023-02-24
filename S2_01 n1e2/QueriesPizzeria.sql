Use databasepizzeria;
-- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
SELECT 
    products.ProductsToChoise AS Drinks,
    SUM(order_has_product.quantityProducts) AS totalDrinksSellingInLocation
FROM
    products
	JOIN
    order_has_product ON products.Products_Id = order_has_product.Products_Products_Id
    JOIN
    databasepizzeria.order ON order_has_product.Order_Order_Id = databasepizzeria.order.Order_Id
    JOIN
    databasepizzeria.client ON databasepizzeria.order.Order_Id = Client.client_id
    JOIN
    Location ON Client.client_id = location.Location_Id
WHERE
    location.Location_Name LIKE 'Bajo Llobregat'
        or products.ProductsToChoise LIKE 'Drinks'
GROUP BY products.ProductsToChoise;


-- Llista quantes comandes ha efectuat un determinat empleat/da.


SELECT 
    sells.Sell_id AS Sells_ID,
    COUNT(sells.Sell_id) AS NumberBills, clients.Name
FROM
    databaseglasses.Sells
        LEFT JOIN
    databaseglasses.clients ON sells.Clients_Client_Id = clients.Client_Id
WHERE
    YEAR(sells.sell_date) = 2022
	AND clients.name = 'Andres'
GROUP BY sells.Sell_id;


-- 2) Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.





SELECT 
    glasses.Brands As BrandsGlasses ,  count(glasses.Brands) As NumberGlases
FROM
    databaseglasses.glasses
        LEFT JOIN
    databaseglasses.Sells ON glasses.BrandId = sells.Glasses_BrandId
        LEFT JOIN
    databaseglasses.employee ON sells.Employee_EmployeeId = employee.EmployeeId
		LEFT JOIN
    databaseglasses.clients ON sells.Clients_Client_Id = clients.Client_Id
WHERE
    YEAR (sells.sell_date) = 2022 AND  employee.name = 'Michael' 
GROUP BY glasses.Brands;
    
-- 3) Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.

SELECT DISTINCT
    supplier.Supplier_Name
FROM
    databaseglasses.supplier
        LEFT JOIN
    databaseglasses.glasses ON supplier.Supplier_Id = glasses.SupplierId
        LEFT JOIN
    databaseglasses.Sells ON glasses.BrandId = sells.Glasses_BrandId