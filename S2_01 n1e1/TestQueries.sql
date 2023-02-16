-- 1) Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT 
    glasses.Brands
FROM
    databaseglasses.glasses
        LEFT JOIN
    databaseglasses.clients ON clients.Client_Id = glasses.Client_Id
        LEFT JOIN
    databaseglasses.employee ON employee.EmployeeId = clients.SellsAttends_EmployeeId
WHERE
    YEAR(clients.DataRegister) = '2023' AND  employee.name = 'Miguel';
    
-- 2) Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.

SELECT 
    supplier.Supplier_Name
FROM
    databaseglasses.supplier
        LEFT JOIN
    databaseglasses.glasses ON glasses.SupplierId = supplier.Supplier_Id
        LEFT JOIN
    databaseglasses.clients ON clients.Client_Id = glasses.Client_Id
WHERE
    clients.Client_Id = 1;
