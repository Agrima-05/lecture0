SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
/****** Script for SelectTopNRows command from SSMS  ******/
create view vTicket_7219_Data_Parcel
as
SELECT [FIPS]
      ,[PropertyID]
      ,[APN]
      ,[SitusFullStreetAddress]
      ,[SitusCity]
      ,[SitusState]
      ,[SitusZIP5]
      ,[SitusLatitude]
      ,[SitusLongitude]
      ,[SitusGeoStatusCode]
      ,[PropertyClassID]
      ,[LandUseCode]
      ,[Zoning]
      ,cast ([LotSizeAcres] as bigint)[LotSizeAcres]
      ,[Owner1CorpInd]
      ,[OwnerNAME1FULL]
      ,[OwnerOccupied]
      ,[AssdTotalValue]
      ,[FATimeStamp]
      ,[FARecordType]
      ,[Parcel] as Geom
      --,[Point]
  FROM [zCust_Exxon].[dbo].[Ticket_7219_Data]
