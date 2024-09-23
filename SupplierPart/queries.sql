/*
SELECT *
FROM Supplier
;

-- line comment
SELECT *
FROM Parts
;

SELECT *
FROM Shipment
;

SELECT Supplier.SNUM, Supplier.CITY
FROM Supplier
LIMIT 3
;

SELECT DISTINCT Supplier.CITY
FROM Supplier
;

SELECT Supplier.SNUM, Supplier.CITY
FROM Supplier
WHERE Supplier.CITY = 'Paris'
;*/
/*
SELECT* 
FROM Supplier
ORDER BY SNUM DESC
;*/
/*
SELECT COUNT(Shipment.SNUM) AS NumShipments
FROM Shipment
;*/
/*
SELECT Supplier.SNAME
FROM Supplier
;*/
/*
SELECT MAX(Parts.WEIGHT) AS MaxWeight
FROM Parts
;*/
/*
SELECT DISTINCT PNAME
FROM Parts
;
*/
/*
SELECT AVG(Shipment.QTY) AS AvgShipmentQty
FROM Shipment
;
*/
/*
SELECT *
FROM Parts
WHERE Parts.COLOR = 'Red'
;
*/
/*
SELECT Shipment.SNUM, COUNT(Shipment.SNUM) AS NumShipments
FROM Shipment
GROUP BY Shipment.SNUM
;
*/
/*
SELECT Parts.COLOR, COUNT(Parts.PNUM) AS NumbPartsByColor
FROM Parts
GROUP BY Parts.COLOR
;
*/
/*
Select MIN(Shipment.QTY) AS MINShipment
FROM Shipment
;*/

/*
SELECT Supplier.CIty, COUNT(Supplier.SNUM) AS NUMSuppliers
FROM Supplier
GROUP BY CIty
;*/

/*
SELECT Shipment.SNUM, COUNT(Shipment.SNUM) AS NumShipments
FROM Shipment
GROUP BY Shipment.SNUM
HAVING COUNT(Shipment.SNUM) > 2
;
*/

-- SELECT *
-- FROM Shipment
-- WHERE Qty BETWEEN 300 AND 400
-- ;

-- SELECT *
-- FROM Shipment
-- WHERE Qty in(200,300)
-- ;

-- SELECT *
-- FROM Parts
-- -- WHERE PNAME LIKE 'c%'
-- -- WHERE PNAME LIKE '%g'
-- WHERE PNAME LIKE '_o_'
-- ;

-- SELECT PNUM,COLOR, WEIGHT
-- FROM Parts
-- ORDER By WEIGHT DESC
-- ;

-- SELECT MAX(WEIGHT)
-- FROM Parts;

-- SELECT Supplier.SNAME, Shipment.PNUM, Shipment.Qty
-- FROM Supplier INNER JOIN Shipment ON Supplier.SNUM = Shipment.SNUM
-- ;

-- SELECT Supplier.SNAME, Parts.PNAME, Shipment.Qty
-- FROM Supplier INNER JOIN Shipment ON Supplier.SNUM = Shipment.SNUM
--               INNER JOIN Parts ON Parts.PNUM = Shipment.PNUM
-- ;

-- SELECT *
-- FROM Parts
-- WHERE WEIGHT = (SELECT MAX(WEIGHT) FROM Parts)
-- ;

-- SELECT Parts.CITY,COUNT(Parts.PNUM) AS PartNumByCity
-- FROM Parts
-- GROUP BY Parts.CITY
-- ;

SELECT 
FROM Shipment