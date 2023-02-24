Use databasepizzeria;
-- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
SELECT 
    products.ProductsToChoise AS Drinks,
    count(order_has_product.quantityProducts) AS totalDrinksSellingInLocation
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
	employee.name AS 'Name employ',
    databasepizzeria.order.Order_Id,    
    COUNT(databasepizzeria.order.Order_Id) AS 'TotalOrders'
FROM
    databasepizzeria.Order
        LEFT JOIN
    databasepizzeria.Shop ON databasepizzeria.order.Shop_Shop_Id = shop.shop_ID
        LEFT JOIN
    databasepizzeria.Employee ON shop.shop_ID = databasepizzeria.Employee.Employee_id
WHERE
    employee.Name = 'carlos'
GROUP BY databasepizzeria.order.Order_Id;   
