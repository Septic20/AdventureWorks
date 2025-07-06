with
Sohsr as (
  SELECT SalesOrderID, Max(SalesReasonID) as SalesReasonID
  FROM  [AdventureWorks2022].[Sales].[SalesOrderHeaderSalesReason]
  GROUP BY SalesOrderID
),
Pre_dataset as(
  SELECT  
  	P.Name as product_name, 
  	Pmodel.Name as model_name,
  	P.MakeFlag as product_make_flag,
  	P.ProductLine as product_line,
  	P.Class as product_class,
  	P.Style as product_style,
  	pch.StandardCost as standard_cost,
        ROW_NUMBER() OVER ( PARTITION BY S.SalesOrderDetailID ORDER BY pch.StartDate DESC) AS rn,
  	Psubcat.Name as subcat_name, 
  	Pcat.Name as cat_name,
  	Soff.Type as offer_type,
  	Soff.Category as offer_category,
  	Sr.Name as sale_reason_name,
  	Sr.ReasonType as sale_reason_type,
  	Store.Name as store_name,
  	Sterritory.Name as territory,
  
  	CASE 
       WHEN Sterritory.CountryRegionCode='US' THEN Sterritory.CountryRegionCode
       ELSE Sterritory.Name 
    END as country,
  
  	Sterritory.CountryRegionCode as country_code,
  	Sterritory.[Group] as country_group,
  	Ship_method.Name as ship_company,
  	Scustomer.CustomerID as customer_id,
  	Person.PersonType as customer_type,
  	Person.EmailPromotion as customer_email_promotion,
  	Paddress.City as customer_city,
  	Paddress.AddressLine1 as customer_address,
  	Soh.Status as order_status,
  	Soh.OnlineOrderFlag as order_online_flag,
  	S.*
  FROM Sales.SalesOrderDetail as S 
  LEFT JOIN Production.Product as P on S.ProductID=P.ProductID
  LEFT Join Production.ProductSubcategory as Psubcat on P.ProductSubcategoryID=Psubcat.ProductSubcategoryID
  LEFT JOIN Production.ProductCategory as Pcat on Psubcat.ProductCategoryID=Pcat.ProductCategoryID
  LEFT JOIN Sales.SpecialOffer as Soff on S.SpecialOfferID=Soff.SpecialOfferID
  LEFT JOIN Sales.SalesOrderHeader as Soh on S.SalesOrderID=Soh.SalesOrderID
  LEFT JOIN Sohsr on Soh.SalesOrderID=Sohsr.SalesOrderID
  LEFT JOIN Sales.SalesReason as Sr on Sohsr.SalesReasonID=Sr.SalesReasonID
  LEFT JOIN Sales.Customer as Scustomer on Soh.CustomerID= Scustomer.CustomerID
  LEFT JOIN Sales.Store as Store on Scustomer.StoreID=Store.BusinessEntityID
  LEFT JOIN Sales.SalesTerritory as Sterritory on Soh.TerritoryID = Sterritory.TerritoryID
  LEFT JOIN Purchasing.ShipMethod as Ship_method on Soh.ShipMethodID = Ship_method.ShipMethodID
  LEFT JOIN Person.Person as Person on Scustomer.PersonID=Person.BusinessEntityID
  LEFT JOIN Person.Address as Paddress on Soh.ShipToAddressID=Paddress.AddressID
  LEFT JOIN Production.ProductModel as Pmodel on P.ProductModelID=Pmodel.ProductModelID
  LEFT JOIN Production.ProductCostHistory Pch ON S.ProductID = Pch.ProductID AND Pch.StartDate <= Soh.OrderDate
)

SELECT * 
FROM Pre_dataset
WHERE rn=1;
