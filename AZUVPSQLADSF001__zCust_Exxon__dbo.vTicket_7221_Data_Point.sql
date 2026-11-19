SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE view  [dbo].[vTicket_7221_Data_Point]
AS 
SELECT  [FIPS]
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
      ,[SumBuildingSqFt]
      ,cast([YearBuilt] as int)[YearBuilt]
	  ,cast (('01/01/'+[YearBuilt]) as datetime) DateBuilt
      ,[EffectiveYearBuilt]
      ,[FATimeStamp]
      ,[FARecordType]
      --,[Parcel]
      ,[Point] as Geom
  FROM [zCust_Exxon].[dbo].[Ticket_7221_Data]

