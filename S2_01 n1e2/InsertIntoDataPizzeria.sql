Use databasepizzeria;

DELETE FROM products;
alter table `databasepizzeria`.`products` AUTO_INCREMENT = 1;
INSERT INTO `databasepizzeria`.`products` (`Products_Id`, `ProductsToChoise`, `Name`, `Description`, `Photo_URL`, `Preu`) VALUES (null, 'Pizza', 'Mediterranea', 'completa', 'www.Pizza.com', '20');
INSERT INTO `databasepizzeria`.`products` (`Products_Id`, `ProductsToChoise`, `Name`, `Description`, `Photo_URL`, `Preu`) VALUES (null, 'Burguer', 'Cabrona', 'sin lechuga', 'www.burger.com', '15');
INSERT INTO `databasepizzeria`.`products` (`Products_Id`, `ProductsToChoise`, `Name`, `Description`, `Photo_URL`, `Preu`) VALUES (null, 'Drinks', 'CocaCola', 'Zero', 'www.cocacola.com', '3');

DELETE FROM categoryproduct;
alter table `databasepizzeria`.`categoryproduct` AUTO_INCREMENT = 1;
INSERT INTO `databasepizzeria`.`categoryproduct` (`Category_Id`, `Products_Id`, `Category_Name`) VALUES (null, '1', 'Large');
INSERT INTO `databasepizzeria`.`categoryproduct` (`Category_Id`, `Products_Id`, `Category_Name`) VALUES (null, '2', 'small');
INSERT INTO `databasepizzeria`.`categoryproduct` (`Category_Id`, `Products_Id`, `Category_Name`) VALUES (null, '3', 'mediun');

DELETE FROM province;
alter table `databasepizzeria`.`province` AUTO_INCREMENT = 1;
INSERT INTO `databasepizzeria`.`province` (`Province_Id`, `Province_Name`) VALUES (null, 'Barcelona');
INSERT INTO `databasepizzeria`.`province` (`Province_Id`, `Province_Name`) VALUES (null, 'Tarragona');
INSERT INTO `databasepizzeria`.`province` (`Province_Id`, `Province_Name`) VALUES (null, 'Gerona');
INSERT INTO `databasepizzeria`.`province` (`Province_Id`, `Province_Name`) VALUES (null, 'Lerida');

DELETE FROM location;
alter table `databasepizzeria`.`location` AUTO_INCREMENT = 1;
INSERT INTO `databasepizzeria`.`location` (`Location_Id`, `Location_Name`, `Province_Province_Id`) VALUES (null, 'Alto Panadés', '1');
INSERT INTO `databasepizzeria`.`location` (`Location_Id`, `Location_Name`, `Province_Province_Id`) VALUES (null, 'Bajo Llobregat', '1');
INSERT INTO `databasepizzeria`.`location` (`Location_Id`, `Location_Name`, `Province_Province_Id`) VALUES (null, 'Alto Ampurdán', '3');
INSERT INTO `databasepizzeria`.`location` (`Location_Id`, `Location_Name`, `Province_Province_Id`) VALUES (null, 'Ripollés', '3');
INSERT INTO `databasepizzeria`.`location` (`Location_Id`, `Location_Name`, `Province_Province_Id`) VALUES (null, 'Bajo Ebro', '2');

DELETE FROM client;
alter table `databasepizzeria`.`client` AUTO_INCREMENT = 1;
INSERT INTO `databasepizzeria`.`client` (`Client_Id`, `Name`, `Surname`, `AdressStreet`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`, `PhoneNumber`) VALUES (null, 'Juan', 'Pérez', 'Calle Mayor, 2', '28001', '2', '1', '912345678');
INSERT INTO `databasepizzeria`.`client` (`Client_Id`, `Name`, `Surname`, `AdressStreet`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`, `PhoneNumber`) VALUES (null, 'María', 'García', 'Avenida del Mar, 8', '29640', '2', '1', '951234567');
INSERT INTO `databasepizzeria`.`client` (`Client_Id`, `Name`, `Surname`, `AdressStreet`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`, `PhoneNumber`) VALUES (null, 'Carlos', 'López', 'Calle del Sol, 14', '46001', '2', '1', '963456789');
INSERT INTO `databasepizzeria`.`client` (`Client_Id`, `Name`, `Surname`, `AdressStreet`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`, `PhoneNumber`) VALUES (null, 'Ana', 'Rodríguez', 'Plaza del Ayuntamiento, 1', '07001', '4', '4', '971234567');
INSERT INTO `databasepizzeria`.`client` (`Client_Id`, `Name`, `Surname`, `AdressStreet`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`, `PhoneNumber`) VALUES (null, 'José', 'Martínez', 'Carrer de la Marina, 26', '08005', '4', '4', '932345678');


DELETE FROM shop;
alter table `databasepizzeria`.`shop` AUTO_INCREMENT = 1;
INSERT INTO `databasepizzeria`.`shop` (`Shop_Id`, `Adress`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`) VALUES (null, 'Calle Mayor, 5', '28001', '1', '1');
INSERT INTO `databasepizzeria`.`shop` (`Shop_Id`, `Adress`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`) VALUES (null, 'Avenida de la Libertad', '29631', '2', '2');
INSERT INTO `databasepizzeria`.`shop` (`Shop_Id`, `Adress`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`) VALUES (null, 'Plaza del Ayuntamiento', '46001', '3', '3');
INSERT INTO `databasepizzeria`.`shop` (`Shop_Id`, `Adress`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`) VALUES (null, 'Carrer del Passeig', '07001', '4', '4');
INSERT INTO `databasepizzeria`.`shop` (`Shop_Id`, `Adress`, `PostCode`, `Location_Location_Id`, `Province_Province_Id`) VALUES (null, 'Gran Via de les Corts Catalanes', '08005', '4', '4');

DELETE FROM employee;
alter table `databasepizzeria`.`employee` AUTO_INCREMENT = 1;
INSERT INTO `databasepizzeria`.`employee` (`Employee_Id`, `Shop_Id`, `Name`, `Surname`, `Nif`, `MovilPhone`) VALUES (null, '1', 'Carlos', 'Garcia', '12345678A', '611223344');
INSERT INTO `databasepizzeria`.`employee` (`Employee_Id`, `Shop_Id`, `Name`, `Surname`, `Nif`, `MovilPhone`) VALUES (null, '1', 'Laura', 'Perez', '23456789B', '622334455');
INSERT INTO `databasepizzeria`.`employee` (`Employee_Id`, `Shop_Id`, `Name`, `Surname`, `Nif`, `MovilPhone`) VALUES (null, '2', 'Antonio', 'Martinez', '34567890C', '633445566');
INSERT INTO `databasepizzeria`.`employee` (`Employee_Id`, `Shop_Id`, `Name`, `Surname`, `Nif`, `MovilPhone`) VALUES (null, '3', 'Maria', 'Sanchez', '45678901D', '644556677');
INSERT INTO `databasepizzeria`.`employee` (`Employee_Id`, `Shop_Id`, `Name`, `Surname`, `Nif`, `MovilPhone`) VALUES (null, '4', 'Juan', 'Jimenez', '56789012E', '655667788');

DELETE FROM deliver;
INSERT INTO `databasepizzeria`.`deliver` (`Employee_Id`, `Name`, `DataTime`) VALUES (1, 'Carlos', '2022-01-05 15:30:00');
INSERT INTO `databasepizzeria`.`deliver` (`Employee_Id`, `Name`, `DataTime`) VALUES (3, 'Antonio', '2022-02-15 20:15:00');

DELETE FROM `databasepizzeria`.`order`;
alter table `databasepizzeria`.`order` AUTO_INCREMENT = 1;
INSERT INTO `databasepizzeria`.`order` (`Order_Id`, `Client_Id`, `Shop_Shop_Id`, `OrderDate`, `PickUp_Store_TakeAway`, `TotalPrice`, `Deliver_Employee_Id`) VALUES (null, '1', '1', '2022-01-05 14:30:00', 'TakeAway', '23.50', '1');
INSERT INTO `databasepizzeria`.`order` (`Order_Id`, `Client_Id`, `Shop_Shop_Id`, `OrderDate`, `PickUp_Store_TakeAway`, `TotalPrice`, `Deliver_Employee_Id`) VALUES (null, '2', '1', '2022-02-15 19:15:00', 'TakeAway', '12.99', '1');
INSERT INTO `databasepizzeria`.`order` (`Order_Id`, `Client_Id`, `Shop_Shop_Id`, `OrderDate`, `PickUp_Store_TakeAway`, `TotalPrice`, `Deliver_Employee_Id`) VALUES (null, '3', '2', '2022-03-21 12:00:00', 'TakeAway', '45.80', '3');
INSERT INTO `databasepizzeria`.`order` (`Order_Id`, `Client_Id`, `Shop_Shop_Id`, `OrderDate`, `PickUp_Store_TakeAway`, `TotalPrice`, `Deliver_Employee_Id`) VALUES (null, '4', '3', '2022-04-04 10:45:00', 'TakeAway', '16.75', '1');
INSERT INTO `databasepizzeria`.`order` (`Order_Id`, `Client_Id`, `Shop_Shop_Id`, `OrderDate`, `PickUp_Store_TakeAway`, `TotalPrice`, `Deliver_Employee_Id`) VALUES (null, '5', '4', '2022-05-10 21:00:00', 'TakeAway', '27.99', '3');

DELETE FROM `databasepizzeria`.`order_has_product`;
INSERT INTO `databasepizzeria`.`order_has_product` (`Order_Order_Id`, `Products_Products_Id`, `quantityProducts`) VALUES ('1', '3', '1');
INSERT INTO `databasepizzeria`.`order_has_product` (`Order_Order_Id`, `Products_Products_Id`, `quantityProducts`) VALUES ('2', '3', '2');
INSERT INTO `databasepizzeria`.`order_has_product` (`Order_Order_Id`, `Products_Products_Id`, `quantityProducts`) VALUES ('3', '1', '3');
INSERT INTO `databasepizzeria`.`order_has_product` (`Order_Order_Id`, `Products_Products_Id`, `quantityProducts`) VALUES ('4', '2', '1');
INSERT INTO `databasepizzeria`.`order_has_product` (`Order_Order_Id`, `Products_Products_Id`, `quantityProducts`) VALUES ('5', '1', '10');
