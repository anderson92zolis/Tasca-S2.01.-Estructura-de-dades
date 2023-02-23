USE databaseglasses;

DELETE  FROM employee;
DELETE  FROM supplier;
DELETE  FROM supplieradress;
DELETE  FROM clients;
DELETE  FROM glasses;
DELETE  FROM sells;

-- Employee

alter table `databaseglasses`.`employee` AUTO_INCREMENT = 1;
INSERT INTO `databaseglasses`.`employee` (`EmployeeId`, `Name`, `Surname`) VALUES (null, 'Michael', 'Arroyo');
INSERT INTO `databaseglasses`.`employee` (`EmployeeId`, `Name`, `Surname`) VALUES (null, 'Juan', 'Pepe');
INSERT INTO `databaseglasses`.`employee` (`EmployeeId`, `Name`, `Surname`) VALUES (null, 'Pepe', 'LANDA');


-- supplier
alter table `databaseglasses`.`supplier` AUTO_INCREMENT=1;
INSERT INTO `databaseglasses`.`supplier` (`Supplier_Id`, `Supplier_Name`, `Supplier_PhoneNumber`, `Supplier_Fax`, `Supplier_NIF`) VALUES (null, 'Ricard', '682838771', '1919191919', '25782398P');
INSERT INTO `databaseglasses`.`supplier` (`Supplier_Id`, `Supplier_Name`, `Supplier_PhoneNumber`, `Supplier_Fax`, `Supplier_NIF`) VALUES (null, 'Manu', '678998871', '1199192992', '26728129T');

-- supplieradress
alter table `databaseglasses`.`supplieradress` AUTO_INCREMENT=1;
INSERT INTO `databaseglasses`.`supplieradress` (`Supplier_Supplier_Id`, `NameStreet`, `Floor`, `Door`, `City`, `CP`) VALUES (null, 'C corsega 2', '2', '2', 'Barcelona', '08021');
INSERT INTO `databaseglasses`.`supplieradress` (`Supplier_Supplier_Id`, `NameStreet`, `Floor`, `Door`, `City`, `CP`) VALUES (null, 'C granados  4', '3', '2', 'Valencia', '08022');

-- clients
alter table `databaseglasses`.`clients` AUTO_INCREMENT = 1;
INSERT INTO `databaseglasses`.`clients` (`Client_Id`, `Name`, `Address`, `Phone`, `Email`, `DataRegister`, `RecommentClient`) VALUES (null, 'Miguel', 'c/ pampo 34', '682828219', 'migue_loco@google.com', '2022-06-15', '1');
INSERT INTO `databaseglasses`.`clients` (`Client_Id`, `Name`, `Address`, `Phone`, `Email`, `DataRegister`, `RecommentClient`) VALUES (null, 'Andres', 'c/ sua 1', '632323232', 'and_12@gmail.com', '2022-12-15', '1');


-- glassessupplieradress
alter table `databaseglasses`.`glasses` AUTO_INCREMENT = 1;
INSERT INTO `databaseglasses`.`glasses` (`BrandId`, `Client_Id`, `SupplierId`, `Brands`, `GlassesGraduation`, `FrameType`, `FrameColour`, `GlassColour`, `Price`) VALUES (null, '1', '1', 'AdidasVIsion', '12.22', 'Metalic', 'Blue', 'Black', '220.12');
INSERT INTO `databaseglasses`.`glasses` (`BrandId`, `Client_Id`, `SupplierId`, `Brands`, `GlassesGraduation`, `FrameType`, `FrameColour`, `GlassColour`, `Price`) VALUES (null, '2', '2', 'Raybam', '1.232', 'Paste', 'Yellow', 'Navy Blue', '189.12');


-- sells
alter table `databaseglasses`.`sells` AUTO_INCREMENT = 1;
INSERT INTO `databaseglasses`.`sells` (`Sell_id`, `Sell_name`, `Sell_date`, `Clients_Client_Id`, `Employee_EmployeeId`, `Glasses_BrandId`) VALUES (null, 'Michael', '2022-12-12', '2', '1', '2');
INSERT INTO `databaseglasses`.`sells` (`Sell_id`, `Sell_name`, `Sell_date`, `Clients_Client_Id`, `Employee_EmployeeId`, `Glasses_BrandId`) VALUES (null, 'Michael', '2022-12-13', '1', '1', '2');
INSERT INTO `databaseglasses`.`sells` (`Sell_id`, `Sell_name`, `Sell_date`, `Clients_Client_Id`, `Employee_EmployeeId`, `Glasses_BrandId`) VALUES (null, 'Michael', '2022-12-12', '1', '1', '2');
INSERT INTO `databaseglasses`.`sells` (`Sell_id`, `Sell_name`, `Sell_date`, `Clients_Client_Id`, `Employee_EmployeeId`, `Glasses_BrandId`) VALUES (null, 'Michael', '2023-12-14', '1', '1', '2');