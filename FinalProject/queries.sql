/*SELECT *
FROM Car_Type
;

SELECT * 
FROM Car_Options
;
*/

-- 1.I want to buy a van just search for a VAN
SELECT *
FROM Car_Type
WHERE Car_Type.BodyType = 'Van'
;

-- 2.Finding the oldest car in the database to buy a oldest model car
SELECT *
FROM Car_Type
ORDER BY Year ASC
LIMIT 1
;


-- 3.I would liek to find the cheapest car in this database
SELECT Car_Type.Year, Car_Type.Model_Name, Manufacturer.MSRP
FROM Car_Type 
JOIN Manufacturer ON Car_Type.VIN = Manufacturer.Car_VIN
ORDER BY Manufacturer.MSRP ASC
;

-- 4.List all distinct body types available in the Car_Type 
SELECT DISTINCT BodyType 
FROM Car_Type
;

-- 5.Organizing the Color of cars for easier search
SELECT Car_Type.Model_Name, Car_Inventory.Car_Color 
FROM Car_Type JOIN Car_Inventory ON Car_Type.VIN = Car_Inventory.Car_VIN
;

-- 6. Find the list the brands and their headquarters from the Car_Brand table
SELECT BrandName, HQ_Location 
FROM Car_Brand
;

-- 7. Finding the top 5 most expensive cars in the Car_Inventory table
SELECT * 
FROM Car_Inventory ORDER BY Cost DESC LIMIT 5
;

-- 8.List all dealerships with their total MSRP and total sell price
SELECT DealerID, SUM(MSRP) AS TotalMSRP, SUM(Sell_price) AS TotalSellPrice 
FROM Car_Dealership GROUP BY DealerID

--9. Find the average cost of cars in each color from the Car_Inventory table to see which color costs the most
SELECT Car_Color, AVG(Cost) AS AvgCost 
FROM Car_Inventory GROUP BY Car_Color;


-- 10. List the brands that started before 1950 from the Car_Brand table to see which ones have longer history
SELECT BrandName 
FROM Car_Brand WHERE Start_Year < 1950;


DELIMITER //

CREATE TRIGGER updateCarType
AFTER INSERT ON Car_Inventory
FOR EACH ROW
BEGIN
  -- Check if the VIN already exists in Car_Type
  IF (SELECT COUNT(*) FROM Car_Type WHERE VIN = NEW.VIN) > 0 THEN
    -- Update the existing entry in Car_Type
    UPDATE Car_Type
    SET
      Year = (SELECT Year FROM Car_Inventory WHERE VIN = NEW.VIN),
      BodyType = (SELECT BodyType FROM Car_Inventory WHERE VIN = NEW.VIN),
      Model_Name = (SELECT Model_Name FROM Car_Inventory WHERE VIN = NEW.VIN)
    WHERE VIN = NEW.VIN;
  ELSE
    -- Insert a new entry into Car_Type
    INSERT INTO Car_Type (Year, BodyType, Model_Name, VIN)
    VALUES (
      (SELECT Year FROM Car_Inventory WHERE VIN = NEW.VIN),
      (SELECT BodyType FROM Car_Inventory WHERE VIN = NEW.VIN),
      (SELECT Model_Name FROM Car_Inventory WHERE VIN = NEW.VIN),
      NEW.VIN
    );
  END IF;
END //

DELIMITER ;


