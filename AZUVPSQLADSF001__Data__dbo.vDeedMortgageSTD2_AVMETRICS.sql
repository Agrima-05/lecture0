SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[vDeedMortgageSTD2_AVMETRICS]
AS

----•	Last Known fields - Per John – USE THE Holocron fields with PUBLIC in the field name
----•	Result Comment = MESSAGE TEXT fields (which are one per model) in the AVM data per John
----•	Property Type Code = Land use code
----•	NO Orphans per Emily
----•	& NO Deeds where neither AVM is populated!!! Per Emily
----•	CURENT AVM – Not matching valuation date to recording date of Deed



/*--------------------------------------------------          FROM DEED          ---------------------------------------------------*/ 

		SELECT  D.FIPS AS FIPS
		, D.FAPropertyId AS PROPERTYID
		, CASE WHEN P.FormattedAPN IS NULL THEN D.APN ELSE P.FormattedAPN END AS APN
		
		
		, D.FAMatchInd AS MatchedFlag
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdHouseNbr ELSE D.SitusStdHouseNbr END AS SitusStdHouseNbr
		
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdHouseNbrSuffix ELSE D.SitusStdHouseNbrSuffix END AS SitusStdHouseNbrSuffix
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdDirectionLeft ELSE D.SitusStdDirectionLeft END AS SitusStdDirectionLeft
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdStreet ELSE D.SitusStdStreet END AS SitusStdStreet
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdMode ELSE D.SitusStdMode END AS SitusStdMode
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdDirectionRight ELSE D.SitusStdDirectionRight END AS SitusStdDirectionRight
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdUnitType ELSE D.SitusStdUnitType END AS SitusStdUnitType
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdUnitNbr ELSE D.SitusStdUnitNbr END AS SitusStdUnitNbr
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdCity ELSE D.SitusStdCity END AS SitusStdCity
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdState ELSE D.SitusStdState END AS SitusStdState
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdZIP5 ELSE D.SitusStdZIP5 END AS SitusStdZIP5
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdZip4 ELSE D.SitusStdZip4 END AS SitusStdZip4
		
		, CASE WHEN D.[Buyer1NoParsInd] = 1 THEN 'Y' ELSE NULL END AS BuyerBorrower1CorpInd
	
		, CASE WHEN D.[Buyer2NoParsInd] = 1 THEN 'Y' ELSE NULL END AS BuyerBorrower2CorpInd
		
		
		, D.TransactionId AS FATransactionID
		, RecordingDt AS RecordingDate
		, SaleDate AS SaleDate




		, DocumentTypeCode AS DocumentType
		, DeedTransactionType AS TransactionType
		, SalesPrice AS SaleAmt
		,D.SalesPriceCode AS SalesPriceCode
	
		
		, CASE WHEN [Reo] = 1 THEN 'Y' ELSE NULL END AS ForeclosureFlag
		, CASE WHEN [REOSale] = 1 THEN 'Y' ELSE NULL END AS ReoSaleFlag

		
		, [MultiAPNCode] AS MULTIAPN


		
		
		, D.FATimeStamp AS FATimeStamp
		, D.FAUCIDFlag AS FARecordType

		, P.StdLandUseCode AS LandUseCode


		,C.PREMIER_FINAL_VALUE as 'PremierAVMValue'
		,C.PREMIER_LOW_VALUE as 'PremierLowValue'
		,C.PREMIER_HIGH_VALUE as 'PremierHighValue'
		,C.PREMIER_CONFIDENCE_SCORE as 'PremierConfidenceScore'
		,C.PREMIER_FORECAST_STANDARD_DEVIATION as 'Premier FSD'
		,convert(varchar(8),convert(date,C.[VALUE_AS_OF]),112) as 'PremierValuationDate'
		,C.Premier_MEssage_TEXT as 'Premier Result Comment'
		
		,C.POWER_FINAL_VALUE as 'PowerAVMValue'
		,C.Power_LOW_VALUE as 'PowerLowValue'
		,C.Power_HIGH_VALUE as 'PowerHighValue'
		,C.Power_CONFIDENCE_SCORE as 'PowerConfidenceScore'
		,C.Power_FORECAST_STANDARD_DEVIATION as 'PowerFSD'
		,convert(varchar(8),convert(date,C.[VALUE_AS_OF]),112) as 'PowerValuationDate'
		,C.Power_MEssage_TEXT as 'PowerResultComment'
		
		,C.[LAST_KNOWN_PUBLIC_SALE] as 'LastKnownSalePrice'
		,C.[LAST_KNOWN_PUBLIC_DATE] as 'LastKnownSaleDate'
		, P.StdLandUseCode as 'PropertyTypeCode'


	

		

FROM            Data.dbo.Deed as D WITH (NOLOCK)  
				JOIN Data.dbo.Property AS P WITH (NOLOCK) ON 
				--D.FIPS = P.FIPS AND 
				D.FAPropertyID = P.PropertyID
				JOIN [Holocron].[dbo].[Holocron] as C with(NOLOCK) 
				on P.FIPS = C.FIPSCODE
				AND P.DTDB_REF_ID = C.REF_ID
				where 
				C.PREMIER_FINAL_VALUE > 0 or 
				C.POWER_FINAL_VALUE > 0

				





GRANT SELECT ON [dbo].[vDeedMortgageSTD2_AVMETRICS] TO [CORP\cbrady] AS [dbo]
