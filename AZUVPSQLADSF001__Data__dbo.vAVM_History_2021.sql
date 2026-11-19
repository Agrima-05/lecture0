SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[vAVM_History_2021]
AS

SELECT [FIPS]
      ,[PropertyID]
      ,[APN]
      ,[SitusFullStreetAddress]
      ,[SitusHouseNbr]
      ,[SitusHouseNbrSuffix]
      ,[SitusDirectionLeft]
      ,[SitusStreet]
      ,[SitusMode]
      ,[SitusDirectionRight]
      ,[SitusUnitType]
      ,[SitusUnitNbr]
      ,[SitusCity]
      ,[SitusState]
      ,[SitusZIP5]
      ,[SitusZIP4]
      ,[SitusCarrierCode]
      ,[FinalValue]
      ,[HighValue]
      ,[LowValue]
      ,[ConfidenceScore]
      ,[StandardDeviation]
      ,[ValuationDate]
      ,[StdLandUseCode]
      --,[DTDB_REF_ID]
      --,[DTDB_UNFORMATTED_APN]
      --,[DTDB_FORMATTED_APN]
	 FROM [AZUVPSQLADSF006.datatree.local].[prod_AVM_History].[dbo].[AVM_History_2021_USE_I]


--Select c.FIPS
--,c.PropertyID
--,c.FormattedAPN as APN
--,c.SitusStdFullStreetAddress as SitusFullStreetAddress
--,c.SitusStdHouseNbr as SitusHouseNbr
--,c.SitusStdHouseNbrSuffix as SitusHouseNbrSuffix
--,c.SitusStdDirectionLeft as SitusDirectionLeft
--,c.SitusStdStreet as SitusStreet
--,c.SitusStdMode as SitusMode
--,c.SitusStdDirectionRight as SitusDirectionRight
--,c.SitusStdUnitType as SitusUnitType
--,c.SitusStdUnitNbr as SitusUnitNbr
--,c.SitusStdCity as SitusCity
--,c.SitusStdState as SitusState
--,c.SitusStdZIP5 as SitusZIP5
--,c.SitusStdZIP4 as SitusZIP4
--,c.SitusStdCarrierCode as SitusCarrierCode
--,a.[final_value] as FinalValue
--,a.[high] as HighValue
--,a.[low] as LowValue
--,a.[score] as ConfidenceScore
--,a.[stdev] as StandardDeviation
--,convert(datetime,Convert(Varchar(10),a.[VALUATION_DATE],120)) as ValuationDate
-----ADded 20211005---
--,c.StdLandUseCode
--,c.DTDB_FORMATTED_APN
--,c.DTDB_UNFORMATTED_APN
--,C.DTDB_REF_ID
--From [AZUVPSQLADSF006.datatree.local].[prod_AVM_History].[dbo].[AVM_History_2021_USE] a with(NOLOCK)
--JOIN [Data].dbo.[Property] c with(NOLOCK) 
----on a.FIPS = a.FIPS and a.PropertyID = a.PropertyID
--on a.PropertyID = c.PropertyID




GRANT SELECT ON [dbo].[vAVM_History_2021] TO [CORP\cbrady] AS [dbo]
