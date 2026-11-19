SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[PropertyRadar_Eval]
AS
SELECT [Property Address]      ,[Property City]      ,[Property State]      ,[Property Zip]      ,[Property Zip + 4]      ,[Assessor's Parcel Identification Number]      ,[County FIPS]
      ,[Internal FA Property Ref ID]      ,[Property Type]      ,[Property Sub-Type]      ,[Lot Size (Sq Ft)]      ,[Home Size (Sq Ft)]      ,[Home or Building Style]      ,[Heating Type]
      ,[Heating Fuel Type]      ,[Cooling Type]      ,[Cooling Fuel Type]      ,[Number of Stories]      ,[Year Built]      ,[Roof Type]      ,[Exterior Construction]
      ,[Number of Bedrooms]      ,[Number of Bathrooms]      ,[Number of Garages]      ,[Garage Type]      ,[Pool Features]      ,[View Features]      ,[FA Calculated Days on Market]
      ,[Current Original Listing Date]      ,[Listing Number]      ,[Status]      ,[Status Sub Type]      ,[Current Listing Price]      ,[Sold Price]      ,[Sold Date]
      ,[FA Adjusted Sold Price]      ,[FA Sold Price Range]      ,[Listing Tracking ID]      ,[FA Unique Listing Identifier - Ref ID]      ,[Update Timestamp]      ,[Add, Change, Delete Indicator]
  FROM [Listing].[dbo].[PropertyRadar_Out]



