SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[RED_BELL_FLANK]
AS
SELECT INPUTKEY AS [Inp_Customer Unique ID], INPUTAddress AS Inp_Address, INPUTCity AS Inp_City, INPUTState AS Inp_State, INPUTZip AS Inp_Zip, Status AS STATUS, 
                  FullStreetAddress AS StandardizedAddress, INPUTAddress AS InputAddress, PropertyCity AS InputCity, PropertyState AS InputState, ZipCode AS InputZipCode, 
                  LegalDESCRIPTION AS LegalDescription, MailStreetADDRESS AS MailStreetAddress, SUBDIVISION AS Subdivision, COUNTY AS County, a.[STATE] AS State, 
                  a.CENSUSTRACT AS CensusTract, BLOCK AS Block, APN, GrossAREA AS GrossArea, LotAREA AS LotArea, TotalROOMS AS TotalRooms, BEDROOMS AS Bedrooms, 
                  BATH AS Bath_Full_Or_Half, YEARBUILT AS YearBuilt, FIREPLACE AS Fireplace, STORIES AS NumberOfStories, ParkingTYPE AS ParkingType, 
                  GarageCAPACITY AS GarageCapacity, FOUNDATION AS Foundation, RoofMATERIAL AS RoofMaterial, HeatYPE AS HeatType, ExeriorWALL AS ExteriorWall, 
                  PatioYPE AS PatioType, POOL AS Pool, AC AS AirConditioning, OtherIMPROVEMENTS AS OtherImprovements, ZONING AS Zoning, LandUSE AS LandUse, 
                  WaterTYPE AS WaterType, SewerTYPE AS SewerType, AssessedVALUE AS AssessedValue, LandVALUE AS LandValue, ImpVALUE AS ImprovementValue, 
                  ImprovedPCT AS Improved_Percent, AssessedYEAR AS AssessedYear, TaxAREA AS TaxArea, TasEXEMPTION AS TaxExemption, PropertyTAX AS PropertyTax, 
                  DelinquentYEAR AS DelinquentYear, TaxYEAR AS TaxYear
FROM     dbo.S10_Output_FLANK a join a_ASP_IN_STD b
ON a.INPUTKEY = b.RAW_ID



