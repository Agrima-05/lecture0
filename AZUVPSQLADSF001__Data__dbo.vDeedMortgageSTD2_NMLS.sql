SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[vDeedMortgageSTD2_NMLS]
AS
/*--------------------------------------------------          FROM DEED          ---------------------------------------------------*/ 

		SELECT D.FIPS AS FIPS
		, D.FAPropertyId AS PROPERTYUNIQUEID
		, CASE WHEN P.FormattedAPN IS NULL THEN D.APN ELSE P.FormattedAPN END AS APN
		, NULL AS APNSEQUENCENBR
		, NULL AS PREVIOUSPARCELNUMBER
		, D.TaxAccountNbr AS TAXACCOUNTNUMBER
		, D.FAMatchInd AS MatchedFlag
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdHouseNbr ELSE D.SitusStdHouseNbr END AS HouseNumber
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdHouseNbr2 ELSE D.SitusStdHouseNbr2 END AS HouseNumber2
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdHouseNbrSuffix ELSE D.SitusStdHouseNbrSuffix END AS HouseNumberSuffix
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdDirectionLeft ELSE D.SitusStdDirectionLeft END AS DirectionLeft
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdStreet ELSE D.SitusStdStreet END AS StreetName
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdMode ELSE D.SitusStdMode END AS Suffix
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdDirectionRight ELSE D.SitusStdDirectionRight END AS DirectionRight
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdUnitType ELSE D.SitusStdUnitType END AS UnitType
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdUnitNbr ELSE D.SitusStdUnitNbr END AS UNITNUMBER
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdCity ELSE D.SitusStdCity END AS CITY
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdState ELSE D.SitusStdState END AS STATE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdZIP5 ELSE D.SitusStdZIP5 END AS ZIPCODE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdZip4 ELSE D.SitusStdZip4 END AS ZIPPLUS4
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdCarrierCode ELSE D.SitusStdCarrierCode END AS CARRIERCODE
		, CASE WHEN D.[Buyer1NoParsInd] = 1 THEN 'Y' ELSE NULL END AS CORPORATEINDICATOR
		, D.Buyer1FullName AS BUYERNAMEBORROWERNAME1
		, D.BuyerNameAddendum AS OWNERETALIND
		, D.BuyerMailCareOfName AS OwnerCAREOfNAME
		, D.BuyerVestingCode AS OWNERSHIPRIGHTSCODE1
		, D.Buyer1IDCode AS OWNERRELATIONSHIPTYPE1
		, CASE WHEN D.[Buyer2NoParsInd] = 1 THEN 'Y' ELSE NULL END AS CORPORATEINDICATOR2
		, D.Buyer2FullName AS BUYERNAMEBORROWERNAME2
		, NULL AS OWNERSHIPRIGHTSCODE2
		, D.Buyer2IDCode AS OWNERRELATIONSHIPTYPE2
		, Buyer1LastName AS BUYER1LASTNAME
		, Buyer1FirstName AS BUYER1FIRSTNAME
		, Buyer1MiddleInitial AS BUYER1MIDDLEName
		, Buyer1NameSiffix AS BUYER1SUFFIX
		, Buyer2LastName AS BUYER2LASTNAME
		, Buyer2FirstName AS BUYER2FIRSTNAME
		, Buyer2MiddleInitial AS BUYER2MIDDLEName
		, Buyer2NameSuffix AS BUYER2SUFFIX
		, BuyerMailHouseNbr AS MAILHOUSENUMBER
		, BuyerMailHouseNbr2 AS MAILHOUSENUMBER2
		, BuyerMailHouseNbrSuffix AS MAILHOUSENUMBERSUFFIX
		, BuyerMailLeftDirection AS MAILDIRECTIONLEFT
		, BuyerMailStreetName AS MAILSTREETNAME
		, BuyerMailMode AS MAILMODE
		, BuyerMailRightDirection AS MAILDIRECTIONRIGHT
		, BuyerMailUnitType AS MAILUNITTYPE
		, BuyerMailUnitNumber AS MAILUNITNUMBER
		, BuyerMailCity AS MAILCITY
		, BuyerMailState AS MAILSTATE
		, BuyerMailZip5 AS MAILZIPCODE
		, BuyerMailZip4 AS MAILZIPPlus4
		, BuyerMailCarrierCode AS MAILCARRIERCODE
		, D.TransactionId AS FirstAmericanUniqueTransactionID
		, RecordingDt AS RECORDINGDATE
		, SaleDate AS SALEDATE
		, [YearDocNbrFrmt] AS DOCUMENTNUMBER
		, Global.dbo.Before1stCharacter([BkPgFrmt],'.') AS RECORDINGBOOK
		, Global.dbo.After1stCharacter([BkPgFrmt],'.') AS RECORDINGPAGE
		, HILandCountDocumentNbr AS HAWAIILANDCOURTDOCUMENTNUMBER
		, HICertificateNbr AS HAWAIITCTCERTIFICATENUMBER
		, WaExciseNbr AS WAEXCISENUMBER
		, DocumentTypeCode AS DOCUMENTTYPE
		, DeedTransactionType AS TRANSACTIONTYPE
		, Substring([Seller1FullName], 1, 60) AS SELLERNAME
		, CASE WHEN [Seller1NoParsInd] = 1 THEN 'Y' ELSE NULL END AS SELLERNAMECORPINDICATOR
		, Substring([Seller2FullName], 1, 60) AS SELLERNAME2
		, CASE WHEN [Seller2NoParsInd] = 1 THEN 'Y' ELSE NULL END AS SELLERNAME2CORPINDICATOR
		, SalesPrice AS SALEAMOUNT
		/*----20161208 - Changed to cascade Tax fields per BR - KL*/ 
		,CASE WHEN (isNULL(TaxTotalTransferTax, 0) = 0) AND (isNULL(TaxCountyTransferTax, 0) = 0) THEN TaxCityTransferTax 
			WHEN (isNULL(TaxTotalTransferTax, 0) = 0) AND (TaxCountyTransferTax >= 0) THEN TaxCountyTransferTax 
			ELSE TaxTotalTransferTax END AS TRANSFERTAX
		, PartialInterestTransferred AS PARTIALINTERESTINDICATORFLAG
		, CASE WHEN [ResaleInd] = 1 THEN 'Y' ELSE NULL END AS RESALEFLAG
		, CASE WHEN [NewConstructionInd] = 1 THEN 'Y' ELSE NULL END AS NEWCONSTRUCTIONFLAG
		, CASE WHEN InterFamilyTransfer = 1 THEN 'Y' ELSE NULL END AS INTERFAMILYFLAG
		, CASE WHEN [Reo] = 1 THEN 'Y' ELSE NULL END AS FORCLOSUREFLAG
		, CASE WHEN [REOSale] = 1 THEN 'Y' ELSE NULL END AS REOSALEFLAG
		, CASE WHEN Loan1Amount > 0 THEN RecordingDt ELSE NULL END AS FIRSTMORTGAGERECORDINGDATE
		, CASE WHEN Loan1Amount > 0 THEN Saledate ELSE NULL END AS FIRSTMORTGAGEDOCDATE
		, [Loan1YearDocNbrFmt] AS FIRSTMORTGAGEDOCUMENTNUMBER
		, Global.dbo.Before1stCharacter([Loan1BookPageFmt],'.') AS FIRSTMORTGAGERECORDINGBOOK
		, Global.dbo.After1stCharacter([Loan1BookPageFmt],'.') AS FIRSTMORTGAGERECORDINGPAGE
		, CASE WHEN Loan1Amount > 0 THEN 'MG' ELSE NULL END AS FIRSTMORTGAGEDETAILEDDOCUMENTTYPE
		, Loan1Amount AS FIRSTMORTGAGEMORTGAGEAMOUNT
		--, Replace(Replace([Loan1LenderName], ',', ''), '.', '') AS FIRSTMORTGAGELENDERNAME
		------Changed 20200818 - kl---
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.Loan1LenderName,'') like '' then Replace(Replace(D.Seller1FullName, ',', ''), '.', '') else Replace(Replace(D.[Loan1LenderName], ',', ''), '.', '') end as FIRSTMORTGAGELENDERNAME

		/*	end as FIRSTMORTGAGELOANTYPECODE*/ 
		, CASE WHEN [loan1transtype] = '6' THEN '1' 
			WHEN [loan1transtype] = '7' THEN '2' 
				WHEN [loan1transtype] = '8' THEN '3' 
					WHEN [loan1transtype] = '9' THEN '4' 
						WHEN [loan1transtype] = '10' THEN '5' 
							WHEN [loan1transtype] = '11' THEN '6' 
								WHEN [loan1transtype] = '3' THEN '5' 
									WHEN [loan1transtype] = '0' THEN '6' END AS FIRSTMORTGAGELOANTYPECODE
		, CASE WHEN [Loan1TermMonths] IS NOT NULL THEN 'M' ELSE NULL END AS FIRSTMORTGAGETERMCODE
		, [Loan1TermMonths] AS FIRSTMORTGAGETERM
		, [Loan1DueDate] AS FIRSTMORTGAGEDUEDATE
		, [Loan1TypeFinance] AS FIRSTMORTGAGEINTERESTRATETYPE
		, format([Loan1InterestRate], '00000') AS FIRSTMORTGAGEINTERESTRATE
		, CASE WHEN [Loan1LenderTypeCode] = 'S' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGESELLERCARRYBACKFLAG
		, CASE WHEN [Loan1LenderTypeCode] = 'P' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGEPRIVATEPARTYLENDER
		, CASE WHEN [Loan1Type] = '8' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGECONSTRUCTIONLOAN
		---- Added 20201202 to flag intances where the sale is actually a transfer/refi --MAS
		, CASE WHEN (d.[Loan1Amount] > 5000 and isNULL(d.[SalesPrice],0) = 0 and d.[DocumentTypeCode] in('71','36','27') and d.Buyer1NoParsInd is NULL and d.FAUCIDFlag <> 'D') THEN 'Y' Else NULL END as FIRSTMORTGAGEREFIFLAG
		/*Changed to null 3/10/2016 CB*/ 
		, NULL AS FIRSTMORTGAGEEQUITYFLAG
		, NULL AS FIRSTMORTGAGEHELOCFLAG
		, Loan1SubordinateLoanInd AS FIRSTMORTGAGEOTHERSUBORDINATELOANFlag
		, SecondHomeRider AS FIRSTMORTGAGESecondHomeRider
		, CondominiumRider AS FIRSTMORTGAGECondominiumRider
		, MultiFamily4Rider AS FIRSTMORTGAGEMultiFamily4Rider
		, PlannedUnitDevelopmentRider AS FIRSTMORTGAGEPlannedUnitDevelopmentRider
		, Loan1AssumabilityRider AS FIRSTMORTGAGEAssumabilityRider
		, Loan1BalloonRider AS FIRSTMORTGAGEBalloonRider
		, Loan1BiweeklyPaymentRider AS FIRSTMORTGAGEBiweeklyPaymentRider
		, Loan1FixedStepRateRider AS FIRSTMORTGAGEFixedStepRateRider
		, Loan1GraduatedPaymentRider AS FIRSTMORTGAGEGraduatedPaymentRider
		, Loan1PrePaymentRider AS FIRSTMORTGAGEPrepaymentRider
		, Loan1RateImprovementRider AS FIRSTMORTGAGERateImprovementRider
		, Loan1AdjRateRider AS FIRSTMORTGAGEAdjustableRateRider
		, Loan1AdjRateIndex AS FIRSTMORTGAGEAdjustableRateIndex
		, Loan1ChangeIndex AS FIRSTMORTGAGEChangeIndex
		, Loan1FirstChangeDateMMDD AS FIRSTMORTGAGEFirstChangeDateMonthDay
		, Loan1FirstChangeDateYYYY AS FIRSTMORTGAGEFirstChangeDateYear
		, Loan1IntOnlyPeriod AS FIRSTMORTGAGEInterestOnlyPeriod
		, Loan1MaximumInt AS FIRSTMORTGAGEMaximumInterestRate
		, Loan1IntRateNotLess AS FIRSTMORTGAGEMinimumInterestRate
		, Loan1RateChangeFrequency AS FIRSTMORTGAGERateChangeFrequency
		, Loan2RecordingDt AS SECONDMORTGAGERECORDINGDATE
		, CASE WHEN Loan2RecordingDt IS NOT NULL THEN RecordingDt ELSE Null END AS SECONDMORTGAGEDOCDATE
		, [Loan2YearDocNbrFmt] AS SECONDMORTGAGEDOCUMENTNUMBER
		, Global.dbo.Before1stCharacter([Loan2BookPageFmt],'.') AS SECONDMORTGAGERECORDINGBOOK
		, Global.dbo.After1stCharacter([Loan2BookPageFmt],'.') AS SECONDMORTGAGERECORDINGPAGE
		, CASE WHEN Loan2Amount > 0 THEN 'MG' ELSE NULL END AS SECONDMORTGAGEDETAILEDDOCUMENTTYPE
		/*---Changed to force to MG 20171201 KL---*/ 
		, Loan2Amount AS SECONDMORTGAGEAMOUNT
		--, Loan2LenderName AS SECONDMORTGAGELENDERNAME
		------Changed 20200818 - KL--
		,Case when D.Loan2LenderTypeCode in ('e','p','s')  and ISNULL(D.Loan2LenderName,'') like '' then Replace(Replace(D.Seller1FullName, ',', ''), '.', '') else Replace(Replace(D.[Loan2LenderName], ',', ''), '.', '') end as SECONDMORTGAGELENDERNAME

		, CASE WHEN [Loan2TransType] = '6' THEN '1' 
			WHEN [Loan2TransType] = '7' THEN '2' 
				WHEN [Loan2TransType] = '8' THEN '3' 
					WHEN [Loan2TransType] = '9' THEN '4' 
						WHEN [Loan2TransType] = '10' THEN '5'
							 WHEN [Loan2TransType] = '11' THEN '6' 
								WHEN [Loan2TransType] = '3' THEN '5' 
									WHEN [Loan2TransType] = '0' THEN '6' 
			END AS SECONDMORTGAGELOANTYPECODE
		, CASE WHEN [Loan2TermMonths] IS NOT NULL THEN 'M' ELSE NULL END AS SECONDMORTGAGETERMCODE
		, [Loan2TermMonths] AS SECONDMORTGAGETERM
		, Loan2DueDate AS SECONDMORTGAGEDUEDATE
		, [Loan2TypeFinance] AS SECONDMORTGAGEINTERESTRATETYPE
		, Loan2InterestRate AS SECONDMORTGAGEINTERESTRATE
		, CASE WHEN [Loan2LenderTypeCode] = 'S' THEN 'Y' ELSE NULL END AS SECONDMORTGAGESELLERCARRYBACK
		, CASE WHEN [Loan2LenderTypeCode] = 'P' THEN 'Y' ELSE NULL END AS SECONDMORTGAGEPRIVATEPARTYLENDER
		, Loan2NewConstructionLoanInd AS SECONDMORTGAGECONSTRUCTIONLOAN
		, NULL AS SECONDMORTGAGEREFIFLAG
		, CASE WHEN Loan2Amount > 0 THEN 'Y' ELSE NULL END AS SECONDMORTGAGEEQUITYFLAG
		, NULL AS SECONDMORTGAGEHELOCFLAG
		, Loan2SubordinateLoanInd AS SECONDMORTGAGEOTHERSUBORDINATELOANFlag
		, SecondHomeRider AS SECONDMORTGAGESecondHomeRider
		, CondominiumRider AS SECONDMORTGAGECondominiumRider
		, MultiFamily4Rider AS SECONDMORTGAGEMultiFamily4Rider
		, PlannedUnitDevelopmentRider AS SECONDMORTGAGEPlannedUnitDevelopmentRider
		, Loan2AssumabilityRider AS SECONDMORTGAGEAssumabilityRider
		, Loan2BalloonRider AS SECONDMORTGAGEBalloonRider
		, Loan2BiweeklyPaymentRider AS SECONDMORTGAGEBiweeklyPaymentRider
		, Loan2FixedStepRateRider AS SECONDMORTGAGEFixedStepRateRider
		, Loan2GraduatedPaymentRider AS SECONDMORTGAGEGraduatedPaymentRider
		, Loan2PrePaymentRider AS SECONDMORTGAGEPrepaymentRider
		, Loan2RateImprovementRider AS SECONDMORTGAGERateImprovementRider
		, Loan2AdjRateRider AS SECONDMORTGAGEAdjustableRateRider
		, NULL AS SECONDMORTGAGEAdjustableRateIndex
		, Loan2ChangeIndex AS SECONDMORTGAGEChangeIndex
		, Loan2FirstChangeDateMMDD AS SECONDMORTGAGEFirstChangeDateMonthDay
		, Loan2FirstChangeDateYYYY AS SECONDMORTGAGEFirstChangeDateYear
		, Loan2IntOnlyPeriod AS SECONDMORTGAGEInterestOnlyPeriod
		, Loan2MaximumInt AS SECONDMORTGAGEMaximumInterestRate
		, Loan2IntRateNotLess AS SECONDMORTGAGEMinimumInterestRate
		, Loan2RateChangeFrequency AS SECONDMORTGAGERateChangeFrequency
		, LegalLotCode AS LotCode
		, LegalLandLot AS LotNumber
		, LegalLotNumber AS LandLot
		, LegalBlock AS Block
		, NULL AS Section
		, DistrictCode AS District
		, D.LegalUnit AS Unit
		, LegalCityMuniTownship AS CityMunicipalityTownship
		, LegalSubdivision AS SubdivisionName
		, LegalPhaseNumber AS PhaseNo
		, LegalTractNumber AS TractNo
		, LegalSectionTownshipRangeMeridian AS SecTwnRngMer
		, NULL AS AssessorsMapRef
		, LegalBriefDescription AS LEGALDESCRIPTION
		, TitleCompanyName AS TITLECOMPANYNAME
		, [MultiAPNCode] AS MULTIAPN
		, D.FATimeStamp AS UPDATETIMESTAMP
		, D.FAUCIDFlag AS UCID
		, D.FATimeStamp AS FATimeStamp
		/*---------------Added for Altisource - KL 20160727------------*/ 
		, P.[PropertyCLassID] AS PROPERTYUSECODE
		, P.StdLandUseCode AS STDLANDUSECODE
		, D.BuyerNameAddendum AS BUYERBORROWERNAMEADDENDUM
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D.SitusStdStreet, '') LIKE '') THEN P.[SitusStdFullStreetAddress] ELSE D.[SitusStdFullStreetAddress] END AS SitusStdFullStreetAddress
		, RIGHT(LEFT(D.RecordingDt, 6), 2) AS RecordingDateMonth
		, LEFT(D.RecordingDt, 4) AS RecordingDateYear
		, RIGHT(LEFT(D.SaleDate, 6),2) AS SaleDateMonth
		, LEFT(D.SaleDate, 4) AS SaleDateYear
		, P.[PropertyClassID] AS PropertyClassID
		, P.[SitusCensusTract] AS SitusCensusTract
		, P.[MobileHomeInd] AS MobileHomeInd
		, P.[TimeshareCode] AS TimeshareCode
		, P.[LotSizeAcres] AS LotSizeAcres
		, P.[LotSizeSqFt] AS LotSizeSqFt
		, P.[AssdTotalValue] AS AssdTotalValue
		, P.[AssdLandValue] AS AssdLandValue
		, P.[AssdImprovementValue] AS AssdImprovementValue
		, P.[MarketTotalValue] AS MarketTotalValue
		, P.[MarketValueLand] AS MarketValueLand
		, P.[MarketValueImprovement] AS MarketValueImprovement
		, P.[AssdYear] AS AssdYear
		, P.[BuildingArea] AS BuildingArea
		, P.[BuildingAreaInd] AS BuildingAreaInd
		, P.[SumBuildingSqFt] AS SumBuildingSqFt
		, P.[SumLivingAreaSqFt] AS SumLivingAreaSqFt
		, P.[SumGroundFloorSqFt] AS SumGroundFloorSqFt
		, P.[SumGrossAreaSqFt] AS SumGrossAreaSqFt
		, P.[SumAdjAreaSqFt] AS SumAdjAreaSqFt
		, P.[SumBasementSqFt] AS SumBasementSqFt
		, P.[SumGarageSqFt] AS SumGarageSqFt
		, P.[YearBuilt] AS YearBuilt
		, P.[EffectiveYearBuilt] AS EffectiveYearBuilt
		, P.[Bedrooms] AS Bedrooms
		, P.[TotalRooms] AS TotalRooms
		, P.[BathTotalCalc] AS BathTotalCalc
		, P.[BathFull] AS BathFull
		, P.[BathsParcialNbr] AS BathsParcialNbr
		, P.[BuildingClassCode] AS BuildingClassCode
		, D.[Armslength] AS Armslength
		, Loan1Type AS FIRSTMORTGAGEDETAILEDLOANTYPE
		, Loan2Type AS SECONDMORTGAGEDETAILEDLOANTYPE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusLatitude ELSE D.SitusLatitude END AS SitusLatitude
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusLongitude ELSE D.SitusLongitude END AS SitusLongitude

		/*----Added for Equimine 20161107 - KL----*/ 
		,D.SalesPriceCode AS SalesPriceCode

		/*-- Changed 20181209 to pull BuyerMailFullAddress from Deed instead of MailingStdFullStreetAddress from Property as these don't always match and Tokens are pulled from Deed*/ 
		,D.[BuyerMailFullAddress] AS MailingStdFullStreetAddress

		/*,P.[MailingStdFullStreetAddress] as MailingStdFullStreetAddress*/ 
		, P.[OwnerOccupied] AS OwnerOccupied
		, P.[PoolCode] AS PoolCode

		/*---Added 20170202 for Compstak - KL*/ 
		, P.[SitusGeoStatusCode] AS SitusGeoStatusCode

		/*---Added 20170217 for MyListingsAgent - JE*/ 
		, D.[FASalePosition]

		/*---Added 20171114 KL----*/ 
		, D.[CMTID] AS DEEDCMTID
		, D.[CMTIDInstNbr] AS DEEDCMTIDInstNbr
		, D.[Loan1CMTID]
		, D.[Loan1CMTIDInstNbr]
		, D.[Loan2CMTID]
		, D.[Loan2CMTIDInstNbr]

		/*---Added 20180831 for Census KL---*/ 
		, D.[Loan1InterestRateSrce] AS Loan1InterestRateSrce
		, D.[Loan2InterestRateSrce] AS Loan2InterestRateSrce

		--/*---ADDED 20180918 MAS -----*/ 
		--,D.[LenderFullMailAddress]
		--, D.[LenderMailCity]
		--, D.[LenderMailState]
		--, D.[LenderMailZip5]
		--, D.[LenderMailZip4]
		--, D.[LenderMailCarrierCode]

		-----UPDATED  20200818 KL---
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailFullAddress] else D.[LenderFullMailAddress] end as [LenderFullMailAddress]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailCity] else D.[LenderMailCity] end as [LenderMailCity]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailState] else D.[LenderMailState] end as [LenderMailState]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailZip5] else D.[LenderMailZip5] end as [LenderMailZip5]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailZip4] else D.[LenderMailZip4] end as [LenderMailZip4]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailCarrierCode] else D.[LenderMailCarrierCode] end as [LenderMailCarrierCode]



		, P.[Mtg1TransactionId]
		, P.[Mtg2TransactionId]
		, P.[Mtg3TransactionId]
		, P.[Mtg4TransactionId]
		, D.[Loan1LenderTypeCode] as LenderTypeCode

		/*-----ADDED 20190103 for Spokeo - KL----*/ 
		, D.[BuyerMailForeignAddrInd] AS MailingForeignAddressInd
		, D.[MailingFIPS] AS MailingCountyFipsCode

		/*----ADDED 20190111 MAS*/ 
		, D.VendorPID

		/*---ADDED 20190131 KL*/ 
		, P.[SumResidentialUnits]

		/*---Added 20190808 for REWW KL*/ 
		, P.SitusStdMatchCode

        ,d.[Seller1FirstName]		---  Added 20190819 for MetroStudy CL Mapping  -- BR
		,d.[Seller1LastName]		---  Added 20190819 for MetroStudy CL Mapping  -- BR
		,d.[Seller1MiddleInitial]	---  Added 20190819 for MetroStudy CL Mapping  -- BR
		
		,P.[FARooftopLatitude]		--  ADDED 20190823 MAS
		,P.[FARooftopLongitude]		--  ADDED 20190823 MAS

		------Added 20191108 for Altisource----
	  ,D.[FHAOriginatingMortgagee]
      ,D.[FHAOriginatingMortgageeNumber]
      ,D.[FHASponsorName]
      ,D.[FHASponosrNumber]
      ,D.[FHADownPaymentSource]
      ,D.[FHANonProfitNumber]
      ,D.[FHAProductType]
      ,D.[FHALoanPurpose]
      ,D.[FHAPropertyProductType]
      ,D.[FHAInterestRate]
      ,D.[FHAOriginalMortgageAmount]
      ,D.[FHAYear]
      ,D.[FHAMonth]
	  ----Added 20200109 per JE KL
	  ,D.[Seller1FirstNameMiddlename]
	  ,D.[Seller1LastNameOrCorpName]
	  ,D.[Seller2FirstNameMiddlename]
	  ,D.[Seller2LastNameOrCorpName]

	  ----Added 20200818 per BR KL--
	  ,Case when ISNULL(D.BuyerMailFullAddress,'') not like '' and D.BuyerMailFullAddress like D.SitusStdFullStreetAddress and ISNULL(D.BuyerMailZip5,'') not like '' and D.BuyerMailZip5 like D.SitusStdZIP5 then 'Y' else null end as [BuyerOccupied]

	  ------Added 20210114 for Connected UNIV OF MIAMI
	,G.[County Name] as [County Name]
	,LEFT(N.NMLSAgentID,15) as NMLSAgentID
	,LEFT(N.NMLSAgentName,100) as NMLSAgentName
	,LEFT(N.NMLSLenderID,15) as NMLSLenderID
	,LEFT(N.NMLSLenderName,100) as NMLSLenderName
	,LEFT(N.NMLSBrokerID,15) as NMLSBrokerID
	,LEFT(N.NMLSBrokerName,100) as NMLSBrokerName
FROM            Deed D WITH (NOLOCK) LEFT OUTER JOIN
                         Data.dbo.Property AS P WITH (NOLOCK) ON D.FIPS = P.FIPS AND D.FAPropertyID = P.PropertyID
				join global.dbo.county as G with(NOLOCK) on D.FIPS = G.FIPSCODE
				LEFT OUTER JOIN Data.dbo.NMLS_Data N
					on D.FIPS = N.FIPS
						and D.TransactionID = N.TransactionID


UNION ALL

/*--------------------------------------------------          FROM MORTGAGE          ---------------------------------------------------*/ 

		SELECT M.FIPS AS FIPS
		, M.FAPropertyId AS PROPERTYUNIQUEID
		, M.APN AS APN
		, NULL AS APNSEQUENCENBR
		, NULL AS PREVIOUSPARCELNUMBER
		, M.TaxAccountNbr AS TAXACCOUNTNUMBER
		, M.FAMatchInd AS MatchedFlag
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdHouseNbr ELSE M.SitusHouseNbr END AS HOUSENUMBER
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdHouseNbr2 ELSE M.SitusHouseNbr2 END AS HOUSENUMBER2
		, NULL AS HOUSENUMBERSUFFIX
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdDirectionLeft ELSE M.SitusDirectionLeft END AS DIRECTIONLEFT
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdStreet ELSE M.SitusStreet END AS STREETNAME
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdMode ELSE M.SitusMode END AS Suffix
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdDirectionRight ELSE M.SitusDirectionRight END AS DIRECTIONRIGHT
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdUnitType ELSE M.SitusUnitType END AS UNITTYPE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdUnitNbr ELSE M.SitusUnitNbr END AS UNITNUMBER
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdCity ELSE M.SitusCity END AS CITY
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdState ELSE M.SitusState END AS STATE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdZIP5 ELSE M.SitusZIP5 END AS ZIPCODE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdZip4 ELSE M.SitusZip4 END AS ZIPPLUS4
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdCarrierCode ELSE M.SitusCarrierCode END AS CARRIERCODE
		, CASE WHEN [Borrower1NoParsInd] = 1 THEN 'Y' ELSE NULL END AS CORPORATEINDICATOR
		, M.Borrower1FullName AS BUYERNAMEBORROWERNAME1
		, BorrowerNameAddendum AS OWNERETALIND
		, NULL AS OwnerCAREOfNAME
		, BorrowerVestingCode AS OWNERSHIPRIGHTSCODE1
		, Borrower1IDCode AS OWNERRELATIONSHIPTYPE1
		, CASE WHEN Borrower2NoParsInd = 1 THEN 'Y' ELSE NULL END AS CORPORATEINDICATOR2
		, Borrower2FullName AS BUYERNAMEBORROWERNAME2
		, BorrowerVestingCode AS OWNERSHIPRIGHTSCODE2
		, Borrower21IDCode AS OWNERRELATIONSHIPTYPE2
		, Borrower1LastName AS BUYER1LASTNAME
		, Borrower1FirstName AS BUYER1FIRSTNAME
		, Borrower1MiddleInitial AS BUYER1MIDDLEName
		, Borrower1NameSuffix AS BUYER1SUFFIX
		, Borrower2LastName AS BUYER2LASTNAME
		, Borrower2FirstName AS BUYER2FIRSTNAME
		, Borrower2MiddleInitial AS BUYER2MIDDLEName
		, Borrower2NameSuffix AS BUYER2SUFFIX
		, BorrowerMailHouseNbr AS MAILHOUSENUMBER
		, BorrowerMailHouseNbr2 AS MAILHOUSENUMBER2
		, BorrowerMailHouseNbrSuffix AS MAILHOUSENUMBERSUFFIX
		, BorrowerMailLeftDirection AS MAILDIRECTIONLEFT
		, BorrowerMailStreetName AS MAILSTREETNAME
		, BorrowerMailMode AS MAILMODE
		, BorrowerMailRightDirection AS MAILDIRECTIONRIGHT
		, BorrowerMailUnitType AS MAILUNITTYPE
		, BorrowerMailUnitNumber AS MAILUNITNUMBER
		, BorrowerMailCity AS MAILCITY
		, BorrowerMailState AS MAILSTATE
		, BorrowerMailZip5 AS MAILZIPCODE
		, BorrowerMailZip4 AS MAILZIPPlus4
		, BorrowerMailCarrierCode AS MAILCARRIERCODE
		, M.TransactionId AS FirstAmericanUniqueTransactionID
		, RecordingDt AS RECORDINGDATE
		, ContractDate AS SALEDATE
		, [YearDocNbrFrmt] AS DOCUMENTNUMBER
		, Global.dbo.Before1stCharacter([BkPgFrmt],'.') AS RECORDINGBOOK
		, Global.dbo.After1stCharacter([BkPgFrmt],'.') AS RECORDINGPAGE
		, NULL AS HAWAIILANDCOURTDOCUMENTNUMBER
		, NULL AS HAWAIITCTCERTIFICATENUMBER
		, NULL AS WAEXCISENUMBER
		, DocumentTypeCode AS DOCUMENTTYPE
		, CASE WHEN [LoanTransType] = '6' THEN '1' 
			WHEN [LoanTransType] = '7' THEN '2' 
				WHEN [LoanTransType] = '8' THEN '3' 
					WHEN [LoanTransType] = '9' THEN '4' 
						WHEN [LoanTransType] = '10' THEN '5' 
							WHEN [LoanTransType] = '11' THEN '6' 
								WHEN [LoanTransType] = '3' THEN '5' 
									WHEN [LoanTransType] = '0' THEN '6' 
			END AS TRANSACTIONTYPE
		, NULL AS SELLERNAME
		, NULL AS SELLERNAMECORPINDICATOR
		, NULL AS SELLERNAME2
		, NULL AS SELLERNAME2CORPINDICATOR
		, NULL AS SALEAMOUNT
		, NULL AS TRANSFERTAX
		, NULL AS PARTIALINTERESTINDICATORFLAG
		, NULL AS RESALEFLAG
		, NULL AS NEWCONSTRUCTIONFLAG
		, NULL AS INTERFAMILYFLAG
		, NULL AS FORCLOSUREFLAG
		, NULL AS REOSALEFLAG
		, RecordingDt AS FIRSTMORTGAGERECORDINGDATE
		, ContractDate AS FIRSTMORTGAGEDOCDATE
		, [YearDocNbrFrmt] AS FIRSTMORTGAGEDOCUMENTNUMBER
		, Global.dbo.Before1stCharacter([BkPgFrmt],'.') AS FIRSTMORTGAGERECORDINGBOOK
		, Global.dbo.After1stCharacter([BkPgFrmt],'.') AS FIRSTMORTGAGERECORDINGPAGE
		, CASE WHEN m.LoanAmount > 0 THEN 'MG' ELSE NULL END AS FIRSTMORTGAGEDETAILEDDOCUMENTTYPE
		, m.LoanAmount AS FIRSTMORTGAGEMORTGAGEAMOUNT
		, Replace(Replace(m.[LenderName], ',', ''), '.', '') AS FIRSTMORTGAGELENDERNAME
		, CASE WHEN [LoanTransType] = '6' THEN '1' 
			WHEN [LoanTransType] = '7' THEN '2' 
				WHEN [LoanTransType] = '8' THEN '3' 
					WHEN [LoanTransType] = '9' THEN '4' 
						WHEN [LoanTransType] = '10' THEN '5' 
							WHEN [LoanTransType] = '11' THEN '6' 
								WHEN [LoanTransType] = '3' THEN '5' 
									WHEN [LoanTransType] = '0' THEN '6' 
			END AS FIRSTMORTGAGELOANTYPECODE
		, CASE WHEN [LoanTermMonths] IS NOT NULL THEN 'M' ELSE NULL END AS FIRSTMORTGAGETERMCODE
		, [LoanTermMonths] AS FIRSTMORTGAGETERM
		, LoanDueDate AS FIRSTMORTGAGEDUEDATE
		, [TypeFinance] AS FIRSTMORTGAGEINTERESTRATETYPE
		, format([LoanInterestRate], '00000') AS FIRSTMORTGAGEINTERESTRATE
		, CASE WHEN [LenderTypeCode] = 'S' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGESELLERCARRYBACKFLAG
		, CASE WHEN (LenderTypeCode in('P') OR (LenderTypeCode in('E','S') and LenderID in('000357','000358','000117'))) THEN 'Y' ELSE NULL END AS FIRSTMORTGAGEPRIVATEPARTYLENDER
		, CASE WHEN [LoanType] = '8' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGECONSTRUCTIONLOAN
		, [LoanRefiLoanInd] AS FIRSTMORTGAGEREFIFLAG
		, [LoanEquityLoanInd] AS FIRSTMORTGAGEEQUITYFLAG
		, [LoanHELOCLoanInd] AS FIRSTMORTGAGEHELOCFLAG
		, SubordinateLoanInd AS FIRSTMORTGAGEOTHERSUBORDINATELOANFlag
		, SecondHomeRider AS FIRSTMORTGAGESecondHomeRider
		, CondominiumRider AS FIRSTMORTGAGECondominiumRider
		, MultiFamily4Rider AS FIRSTMORTGAGEMultiFamily4Rider
		, PlannedUnitDevelopmentRider AS FIRSTMORTGAGEPlannedUnitDevelopmentRider
		, LoanAssumabilityRider AS FIRSTMORTGAGEAssumabilityRider
		, LoanBalloonRider AS FIRSTMORTGAGEBalloonRider
		, LoanBiweeklyPaymentRider AS FIRSTMORTGAGEBiweeklyPaymentRider
		, LoanFixedStepRateRider AS FIRSTMORTGAGEFixedStepRateRider
		, LoanGraduatedPaymentRider AS FIRSTMORTGAGEGraduatedPaymentRider
		, LoanPrePaymentRider AS FIRSTMORTGAGEPrepaymentRider
		, LoanRateImprovementRider AS FIRSTMORTGAGERateImprovementRider
		, LoanAdjRateRider AS FIRSTMORTGAGEAdjustableRateRider
		, LoanAdjRateIndex AS FIRSTMORTGAGEAdjustableRateIndex
		, LoanChangeIndex AS FIRSTMORTGAGEChangeIndex
		, LoanFirstChangeDateMMDD AS FIRSTMORTGAGEFirstChangeDateMonthDay
		, LoanFirstChangeDateYYYY AS FIRSTMORTGAGEFirstChangeDateYear
		, LoanIntOnlyPeriod AS FIRSTMORTGAGEInterestOnlyPeriod
		, LoanMaximumInt AS FIRSTMORTGAGEMaximumInterestRate
		, LoanIntRateNotLess AS FIRSTMORTGAGEMinimumInterestRate
		, LoanRateChangeFrequency AS FIRSTMORTGAGERateChangeFrequency
		, NULL AS SECONDMORTGAGERECORDINGDATE
		, NULL AS SECONDMORTGAGEDOCDATE
		, NULL AS SECONDMORTGAGEDOCUMENTNUMBER
		, NULL AS SECONDMORTGAGERECORDINGBOOK
		, NULL AS SECONDMORTGAGERECORDINGPAGE
		, NULL AS SECONDMORTGAGEDETAILEDDOCUMENTTYPE
		, NULL AS SECONDMORTGAGEAMOUNT
		, NULL AS SECONDMORTGAGELENDERNAME
		, NULL AS SECONDMORTGAGELOANTYPECODE
		, NULL AS SECONDMORTGAGETERMCODE
		, NULL AS SECONDMORTGAGETERM
		, NULL AS SECONDMORTGAGEDUEDATE
		, NULL AS SECONDMORTGAGEINTERESTRATETYPE
		, NULL AS SECONDMORTGAGEINTERESTRATE
		, NULL AS SECONDMORTGAGESELLERCARRYBACK
		, NULL AS SECONDMORTGAGEPRIVATEPARTYLENDER
		, NULL AS SECONDMORTGAGECONSTRUCTIONLOAN
		, NULL AS SECONDMORTGAGEREFIFLAG
		, NULL AS SECONDMORTGAGEEQUITYFLAG
		, NULL AS SECONDMORTGAGEHELOCFLAG
		, NULL AS SECONDMORTGAGEOTHERSUBORDINATELOANFlag
		, NULL AS SECONDMORTGAGESecondHomeRider
		, NULL AS SECONDMORTGAGECondominiumRider
		, NULL AS SECONDMORTGAGEMultiFamily4Rider
		, NULL AS SECONDMORTGAGEPlannedUnitDevelopmentRider
		, NULL AS SECONDMORTGAGEAssumabilityRider
		, NULL AS SECONDMORTGAGEBalloonRider
		, NULL AS SECONDMORTGAGEBiweeklyPaymentRider
		, NULL AS SECONDMORTGAGEFixedStepRateRider
		, NULL AS SECONDMORTGAGEGraduatedPaymentRider
		, NULL AS SECONDMORTGAGEPrepaymentRider
		, NULL AS SECONDMORTGAGERateImprovementRider
		, NULL AS SECONDMORTGAGEAdjustableRateRider
		, NULL AS SECONDMORTGAGEAdjustableRateIndex
		, NULL AS SECONDMORTGAGEChangeIndex
		, NULL AS SECONDMORTGAGEFirstChangeDateMonthDay
		, NULL AS SECONDMORTGAGEFirstChangeDateYear
		, NULL AS SECONDMORTGAGEInterestOnlyPeriod
		, NULL AS SECONDMORTGAGEMaximumInterestRate
		, NULL AS SECONDMORTGAGEMinimumInterestRate
		, NULL AS SECONDMORTGAGERateChangeFrequency
		, NULL AS LotCode
		, LegalLandLot AS LotNumber
		, LegalLotNumber AS LandLot
		, LegalBlock AS Block
		, M.LegalSection AS Section
		, LegalDistrict AS District
		, M.LegalUnit AS Unit
		, LegalCityMunicipalityTownship AS CityMunicipalityTownship
		, LegalSubdivision AS SubdivisionName
		, LegalPhaseNumber AS PhaseNo
		, LegalTractNumber AS TractNo
		, LegalMeridian AS SecTwnRngMer
		, NULL AS AssessorsMapRef
		, LegalBriefDescription AS LEGALDESCRIPTION
		, TitleCompanyName AS TITLECOMPANYNAME
		, [MultiAPNCode] AS MULTIAPN
		, M.FATimeStamp AS UPDATETIMESTAMP
		, M.FAUCIDFlag AS UCID
		, M.FATimeStamp AS FATimeStamp
		/*---------------Added for Altisource - KL 20160727------------*/ 
		, P.[PropertyCLassID] AS PROPERTYUSECODE
		, P.StdLandUseCode AS STDLANDUSECODE
		, M.BorrowerNameAddendum AS BUYERBORROWERNAMEADDENDUM
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.[SitusStdFullStreetAddress] ELSE M.[SitusFullStreetAddress] END AS SitusStdFullStreetAddress
		, RIGHT(LEFT(M.RecordingDt, 6), 2) AS RecordingDateMonth
		, LEFT(M.RecordingDt, 4) AS RecordingDateYear
		, RIGHT(LEFT(M.ContractDate, 6), 2) AS SaleDateMonth
		, LEFT(M.ContractDate, 4) AS SaleDateYear
		, P.[PropertyClassID] AS PropertyClassID
		, P.[SitusCensusTract] AS SitusCensusTract
		, P.[MobileHomeInd] AS MobileHomeInd
		, P.[TimeshareCode] AS TimeshareCode
		, P.[LotSizeAcres] AS LotSizeAcres
		, P.[LotSizeSqFt] AS LotSizeSqFt
		, P.[AssdTotalValue] AS AssdTotalValue
		, P.[AssdLandValue] AS AssdLandValue
		, P.[AssdImprovementValue] AS AssdImprovementValue
		, P.[MarketTotalValue] AS MarketTotalValue
		, P.[MarketValueLand] AS MarketValueLand
		, P.[MarketValueImprovement] AS MarketValueImprovement
		, P.[AssdYear] AS AssdYear
		, P.[BuildingArea] AS BuildingArea
		, P.[BuildingAreaInd] AS BuildingAreaInd
		, P.[SumBuildingSqFt] AS SumBuildingSqFt
		, P.[SumLivingAreaSqFt] AS SumLivingAreaSqFt
		, P.[SumGroundFloorSqFt] AS SumGroundFloorSqFt
		, P.[SumGrossAreaSqFt] AS SumGrossAreaSqFt
		, P.[SumAdjAreaSqFt] AS SumAdjAreaSqFt
		, P.[SumBasementSqFt] AS SumBasementSqFt
		, P.[SumGarageSqFt] AS SumGarageSqFt
		, P.[YearBuilt] AS YearBuilt
		, P.[EffectiveYearBuilt] AS EffectiveYearBuilt
		, P.[Bedrooms] AS Bedrooms
		, P.[TotalRooms] AS TotalRooms
		, P.[BathTotalCalc] AS BathTotalCalc
		, P.[BathFull] AS BathFull
		, P.[BathsParcialNbr] AS BathsParcialNbr
		, P.[BuildingClassCode] AS BuildingClassCode
		, NULL AS Armslength
		, LoanType AS FIRSTMORTGAGEDETAILEDLOANTYPE
		, NULL AS SECONDMORTGAGEDETAILEDLOANTYPE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusLatitude ELSE M.SitusLatitude END AS SitusLatitude
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusLongitude ELSE M.SitusLongitude END AS SitusLongitude

		/*----Added for Equimine 20161107 - KL----*/ 
		, NULL AS SalesPriceCode

		/*-- Changed 20181209 to pull BorrowerFullMailAddress from Mortgage instead of MailingStdFullStreetAddress from Property as these don't always match and Tokens are pulled from Mortgage*/ 
		,M.[BorrowerFullMailAddress] AS MailingStdFullStreetAddress

		/*,P.[MailingStdFullStreetAddress] as MailingStdFullStreetAddress*/ 
		, P.[OwnerOccupied] AS OwnerOccupied
		, P.[PoolCode] AS PoolCode

		/*---Added 20170202 for Compstak - KL*/ 
		, P.[SitusGeoStatusCode] AS SitusGeoStatusCode

		/*---Added 20170217 for MyListingsAgent - JE*/ 
		, NULL AS [FASalePosition]

		/*---Added 20171114 KL----*/ 
		, NULL AS DEEDCMTID
		, NULL AS DEEDCMTIDInstNbr
		, M.[CMTID] AS [Loan1CMTID]
		, M.[CMTIDInstNbr] AS [Loan1CMTIDInstNbr]
		, NULL AS [Loan2CMTID]
		, NULL AS [Loan2CMTIDInstNbr]

		/*---Added 20180831 for Census KL---*/ 
		, M.[LoanInterestRateSrce] AS Loan1InterestRateSrce
		, NULL AS Loan2InterestRateSrce

		/*---ADDED 20180918 MAS -----*/ 
		, M.[LenderFullMailAddress]
		, M.[LenderMailCity]
		, M.[LenderMailState]
		, M.[LenderMailZip5]
		, M.[LenderMailZip4]
		, M.[LenderMailCarrierCode]
		, P.[Mtg1TransactionId]
		, P.[Mtg2TransactionId]
		, P.[Mtg3TransactionId]
		, P.[Mtg4TransactionId]
		, M.[LenderTypeCode]

		/*-----ADDED 20190103 for Spokeo - KL----*/ 
		, M.[BorrowerMailForeignAddrInd] AS MailingForeignAddressInd
		, M.[MailingFIPS] AS MailingCountyFipsCode

		/*----ADDED 20190111 MAS*/ 
		, M.VendorPID

		/*---ADDED 20190131 KL*/ 
		, P.[SumResidentialUnits]

		/*---Added 20190808 for REWW KL*/ 
		, P.SitusStdMatchCode

		, null as Seller1FirstName			---  Added 20190819 for MetroStudy CL Mapping  -- BR
		, null as Seller1LastName			---  Added 20190819 for MetroStudy CL Mapping  -- BR
		, null  as Seller1MiddleInitial		---  Added 20190819 for MetroStudy CL Mapping  -- BR

		, P.[FARooftopLatitude] --ADDED 20190823 MAS
		, P.[FARooftopLongitude] --ADDED 20190823 MAS


			------Added 20191108 for Altisource----
	  ,M.[FHAOriginatingMortgagee]
      ,M.[FHAOriginatingMortgageeNumber]
      ,M.[FHASponsorName]
      ,M.[FHASponosrNumber]
      ,M.[FHADownPaymentSource]
      ,M.[FHANonProfitNumber]
      ,M.[FHAProductType]
      ,M.[FHALoanPurpose]
      ,M.[FHAPropertyProductType]
      ,M.[FHAInterestRate]
      ,M.[FHAOriginalMortgageAmount]
      ,M.[FHAYear]
      ,M.[FHAMonth]


	  ----Added 20200109 per JE KL
	  ,NULL AS [Seller1FirstNameMiddlename]
	  ,NULL AS [Seller1LastNameOrCorpName]
	  ,NULL AS [Seller2FirstNameMiddlename]
	  ,NULL AS [Seller2LastNameOrCorpName]

	  ----Added 20200818 per BR - KL
	  ,NULL as [BuyerOccupied] 

	   ------Added 20210114 for Connected UNIV OF MIAMI
	,G.[County Name] as [County Name]
	,LEFT(N.NMLSAgentID,15) as NMLSAgentID
	,LEFT(N.NMLSAgentName,100) as NMLSAgentName
	,LEFT(N.NMLSLenderID,15) as NMLSLenderID
	,LEFT(N.NMLSLenderName,100) as NMLSLenderName
	,LEFT(N.NMLSBrokerID,15) as NMLSBrokerID
	,LEFT(N.NMLSBrokerName,100) as NMLSBrokerName
	 

FROM  Mortgage AS M WITH (NOLOCK) LEFT OUTER JOIN Data.dbo.Property AS P WITH (NOLOCK) 
	ON M.FIPS = P.FIPS AND M.FAPropertyID = P.PropertyID
	join global.dbo.county as G with(NOLOCK) on M.FIPS = G.FIPSCODE
		LEFT OUTER JOIN Data.dbo.NMLS_Data N
			on M.FIPS = N.FIPS
				and M.TransactionId = N.TransactionID

UNION ALL

/*--------------------------------------------------          FROM DEED_SUP          ---------------------------------------------------*/ 

		SELECT D.FIPS AS FIPS
		, D.FAPropertyId AS PROPERTYUNIQUEID
		, CASE WHEN P.FormattedAPN IS NULL THEN D.APN ELSE P.FormattedAPN END AS APN
		, NULL AS APNSEQUENCENBR
		, NULL AS PREVIOUSPARCELNUMBER
		, D.TaxAccountNbr AS TAXACCOUNTNUMBER
		, D.FAMatchInd AS MatchedFlag
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdHouseNbr ELSE D.SitusStdHouseNbr END AS HouseNumber
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdHouseNbr2 ELSE D.SitusStdHouseNbr2 END AS HouseNumber2
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdHouseNbrSuffix ELSE D.SitusStdHouseNbrSuffix END AS HouseNumberSuffix
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdDirectionLeft ELSE D.SitusStdDirectionLeft END AS DirectionLeft
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdStreet ELSE D.SitusStdStreet END AS StreetName
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdMode ELSE D.SitusStdMode END AS Suffix
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdDirectionRight ELSE D.SitusStdDirectionRight END AS DirectionRight
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdUnitType ELSE D.SitusStdUnitType END AS UnitType
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdUnitNbr ELSE D.SitusStdUnitNbr END AS UNITNUMBER
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdCity ELSE D.SitusStdCity END AS CITY
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdState ELSE D.SitusStdState END AS STATE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdZIP5 ELSE D.SitusStdZIP5 END AS ZIPCODE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdZip4 ELSE D.SitusStdZip4 END AS ZIPPLUS4
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusStdCarrierCode ELSE D.SitusStdCarrierCode END AS CARRIERCODE
		, CASE WHEN D.[Buyer1NoParsInd] = 1 THEN 'Y' ELSE NULL END AS CORPORATEINDICATOR
		, D.Buyer1FullName AS BUYERNAMEBORROWERNAME1
		, D.BuyerNameAddendum AS OWNERETALIND
		, D.BuyerMailCareOfName AS OwnerCAREOfNAME
		, D.BuyerVestingCode AS OWNERSHIPRIGHTSCODE1
		, D.Buyer1IDCode AS OWNERRELATIONSHIPTYPE1
		, CASE WHEN D.[Buyer2NoParsInd] = 1 THEN 'Y' ELSE NULL END AS CORPORATEINDICATOR2
		, D.Buyer2FullName AS BUYERNAMEBORROWERNAME2
		, NULL AS OWNERSHIPRIGHTSCODE2
		, D.Buyer2IDCode AS OWNERRELATIONSHIPTYPE2
		, Buyer1LastName AS BUYER1LASTNAME
		, Buyer1FirstName AS BUYER1FIRSTNAME
		, Buyer1MiddleInitial AS BUYER1MIDDLEName
		, Buyer1NameSiffix AS BUYER1SUFFIX
		, Buyer2LastName AS BUYER2LASTNAME
		, Buyer2FirstName AS BUYER2FIRSTNAME
		, Buyer2MiddleInitial AS BUYER2MIDDLEName
		, Buyer2NameSuffix AS BUYER2SUFFIX
		, BuyerMailHouseNbr AS MAILHOUSENUMBER
		, BuyerMailHouseNbr2 AS MAILHOUSENUMBER2
		, BuyerMailHouseNbrSuffix AS MAILHOUSENUMBERSUFFIX
		, BuyerMailLeftDirection AS MAILDIRECTIONLEFT
		, BuyerMailStreetName AS MAILSTREETNAME
		, BuyerMailMode AS MAILMODE
		, BuyerMailRightDirection AS MAILDIRECTIONRIGHT
		, BuyerMailUnitType AS MAILUNITTYPE
		, BuyerMailUnitNumber AS MAILUNITNUMBER
		, BuyerMailCity AS MAILCITY
		, BuyerMailState AS MAILSTATE
		, BuyerMailZip5 AS MAILZIPCODE
		, BuyerMailZip4 AS MAILZIPPlus4
		, BuyerMailCarrierCode AS MAILCARRIERCODE
		, d.TransactionId AS FirstAmericanUniqueTransactionID
		, RecordingDt AS RECORDINGDATE
		, SaleDate AS SALEDATE
		, [DocNbrSrce] AS DOCUMENTNUMBER
		, [BookSrce] AS RECORDINGBOOK
		, [PageSrce] AS RECORDINGPAGE
		, HILandCountDocumentNbr AS HAWAIILANDCOURTDOCUMENTNUMBER
		, HICertificateNbr AS HAWAIITCTCERTIFICATENUMBER
		, WaExciseNbr AS WAEXCISENUMBER
		, DocumentTypeCode AS DOCUMENTTYPE
		, DeedTransactionType AS TRANSACTIONTYPE
		, Substring([Seller1FullName], 1, 60) AS SELLERNAME
		, CASE WHEN [Seller1NoParsInd] = 1 THEN 'Y' ELSE NULL END AS SELLERNAMECORPINDICATOR
		, Substring([Seller2FullName], 1, 60) AS SELLERNAME2
		, CASE WHEN [Seller2NoParsInd] = 1 THEN 'Y' ELSE NULL END AS SELLERNAME2CORPINDICATOR
		, SalesPrice AS SALEAMOUNT
		/*----20161208 - Changed to cascade Tax fields per BR - KL*/ 
		,CASE WHEN (isNULL(TaxTotalTransferTax, 0) = 0) AND (isNULL(TaxCountyTransferTax, 0) = 0) THEN TaxCityTransferTax 
			WHEN (isNULL(TaxTotalTransferTax, 0) = 0) AND (TaxCountyTransferTax >= 0) THEN TaxCountyTransferTax 
			ELSE TaxTotalTransferTax END AS TRANSFERTAX
		, PartialInterestTransferred AS PARTIALINTERESTINDICATORFLAG
		, CASE WHEN [ResaleInd] = 1 THEN 'Y' ELSE NULL END AS RESALEFLAG
		, CASE WHEN [NewConstructionInd] = 1 THEN 'Y' ELSE NULL END AS NEWCONSTRUCTIONFLAG
		, CASE WHEN InterFamilyTransfer = 1 THEN 'Y' ELSE NULL END AS INTERFAMILYFLAG
		, CASE WHEN [Reo] = 1 THEN 'Y' ELSE NULL END AS FORCLOSUREFLAG
		, CASE WHEN [REOSale] = 1 THEN 'Y' ELSE NULL END AS REOSALEFLAG
		, CASE WHEN Loan1Amount > 0 THEN RecordingDt ELSE NULL END AS FIRSTMORTGAGERECORDINGDATE
		, CASE WHEN Loan1Amount > 0 THEN Saledate ELSE NULL END AS FIRSTMORTGAGEDOCDATE
		, [Loan1Document] AS FIRSTMORTGAGEDOCUMENTNUMBER
		, [Loan1Book] AS FIRSTMORTGAGERECORDINGBOOK
		, [Loan1Page] AS FIRSTMORTGAGERECORDINGPAGE
		, CASE WHEN Loan1Amount > 0 THEN 'MG' ELSE NULL END AS FIRSTMORTGAGEDETAILEDDOCUMENTTYPE
		, Loan1Amount AS FIRSTMORTGAGEMORTGAGEAMOUNT
		--, Replace(Replace([Loan1LenderName], ',', ''), '.', '') AS FIRSTMORTGAGELENDERNAME
		-----Changed 20200818 - KL---
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.Loan1LenderName,'') like '' then Replace(Replace(D.Seller1FullName, ',', ''), '.', '') else Replace(Replace(D.[Loan1LenderName], ',', ''), '.', '') end as FIRSTMORTGAGELENDERNAME
		/*	end as FIRSTMORTGAGELOANTYPECODE*/ 
		, CASE WHEN [loan1transtype] = '6' THEN '1' 
			WHEN [loan1transtype] = '7' THEN '2' 
				WHEN [loan1transtype] = '8' THEN '3' 
					WHEN [loan1transtype] = '9' THEN '4' 
						WHEN [loan1transtype] = '10' THEN '5' 
							WHEN [loan1transtype] = '11' THEN '6' 
								WHEN [loan1transtype] = '3' THEN '5' 
									WHEN [loan1transtype] = '0' THEN '6' END AS FIRSTMORTGAGELOANTYPECODE
		, CASE WHEN [Loan1TermMonths] IS NOT NULL THEN 'M' ELSE NULL END AS FIRSTMORTGAGETERMCODE
		, [Loan1TermMonths] AS FIRSTMORTGAGETERM
		, Loan1DueDate AS FIRSTMORTGAGEDUEDATE
		, CASE WHEN [Loan1TypeFinance] = 'MULT' THEN 'MUL' ELSE [Loan1TypeFinance] END AS FIRSTMORTGAGEINTERESTRATETYPE
		, format([Loan1InterestRate], '00000') AS FIRSTMORTGAGEINTERESTRATE
		, CASE WHEN [Loan1LenderTypeCode] = 'S' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGESELLERCARRYBACKFLAG
		, CASE WHEN [Loan1LenderTypeCode] = 'P' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGEPRIVATEPARTYLENDER
		, CASE WHEN [Loan1Type] = '8' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGECONSTRUCTIONLOAN
		, NULL as FIRSTMORTGAGEREFIFLAG
		/*Changed to null 3/10/2016 CB*/ 
		, NULL AS FIRSTMORTGAGEEQUITYFLAG
		, NULL AS FIRSTMORTGAGEHELOCFLAG
		, Loan1SubordinateLoanInd AS FIRSTMORTGAGEOTHERSUBORDINATELOANFlag
		, SecondHomeRider AS FIRSTMORTGAGESecondHomeRider
		, CondominiumRider AS FIRSTMORTGAGECondominiumRider
		, MultiFamily4Rider AS FIRSTMORTGAGEMultiFamily4Rider
		, PlannedUnitDevelopmentRider AS FIRSTMORTGAGEPlannedUnitDevelopmentRider
		, Loan1AssumabilityRider AS FIRSTMORTGAGEAssumabilityRider
		, Loan1BalloonRider AS FIRSTMORTGAGEBalloonRider
		, Loan1BiweeklyPaymentRider AS FIRSTMORTGAGEBiweeklyPaymentRider
		, Loan1FixedStepRateRider AS FIRSTMORTGAGEFixedStepRateRider
		, Loan1GraduatedPaymentRider AS FIRSTMORTGAGEGraduatedPaymentRider
		, Loan1PrePaymentRider AS FIRSTMORTGAGEPrepaymentRider
		, Loan1RateImprovementRider AS FIRSTMORTGAGERateImprovementRider
		, Loan1AdjRateRider AS FIRSTMORTGAGEAdjustableRateRider
		, Loan1AdjRateIndex AS FIRSTMORTGAGEAdjustableRateIndex
		, Loan1ChangeIndex AS FIRSTMORTGAGEChangeIndex
		, Loan1FirstChangeDateMMDD AS FIRSTMORTGAGEFirstChangeDateMonthDay
		, Loan1FirstChangeDateYYYY AS FIRSTMORTGAGEFirstChangeDateYear
		, Loan1IntOnlyPeriod AS FIRSTMORTGAGEInterestOnlyPeriod
		, Loan1MaximumInt AS FIRSTMORTGAGEMaximumInterestRate
		, Loan1IntRateNotLess AS FIRSTMORTGAGEMinimumInterestRate
		, Loan1RateChangeFrequency AS FIRSTMORTGAGERateChangeFrequency
		, Loan2RecordingDt AS SECONDMORTGAGERECORDINGDATE
		, CASE WHEN [Loan2RecordingDt] IS NULL THEN RecordingDt ELSE [Loan2RecordingDt] END AS SECONDMORTGAGEDOCDATE
		, [Loan1Document] AS SECONDMORTGAGEDOCUMENTNUMBER
		, [Loan2Book] AS SECONDMORTGAGERECORDINGBOOK
		, [Loan2Page] AS SECONDMORTGAGERECORDINGPAGE
		, CASE WHEN Loan2Amount > 0 THEN 'MG' ELSE NULL END AS SECONDMORTGAGEDETAILEDDOCUMENTTYPE
		/*---Changed to force to MG 20171201 KL---*/ 
		, Loan2Amount AS SECONDMORTGAGEAMOUNT
		--, Loan2LenderName AS SECONDMORTGAGELENDERNAME
			------Changed 20200818 - KL--
		,Case when D.Loan2LenderTypeCode in ('e','p','s')  and ISNULL(D.Loan2LenderName,'') like '' then Replace(Replace(D.Seller1FullName, ',', ''), '.', '') else Replace(Replace(D.[Loan2LenderName], ',', ''), '.', '') end as SECONDMORTGAGELENDERNAME

		, CASE WHEN [Loan2TransType] = '6' THEN '1' 
			WHEN [Loan2TransType] = '7' THEN '2' 
				WHEN [Loan2TransType] = '8' THEN '3' 
					WHEN [Loan2TransType] = '9' THEN '4' 
						WHEN [Loan2TransType] = '10' THEN '5'
							 WHEN [Loan2TransType] = '11' THEN '6' 
								WHEN [Loan2TransType] = '3' THEN '5' 
									WHEN [Loan2TransType] = '0' THEN '6' 
			END AS SECONDMORTGAGELOANTYPECODE
		, CASE WHEN [Loan2TermMonths] IS NOT NULL THEN 'M' ELSE NULL END AS SECONDMORTGAGETERMCODE
		, [Loan2TermMonths] AS SECONDMORTGAGETERM
		, Loan2DueDate AS SECONDMORTGAGEDUEDATE
		, [Loan2TypeFinance] AS SECONDMORTGAGEINTERESTRATETYPE
		, Loan2InterestRate AS SECONDMORTGAGEINTERESTRATE
		, CASE WHEN [Loan2LenderCode] = 'S' THEN 'Y' ELSE NULL END AS SECONDMORTGAGESELLERCARRYBACK
		, CASE WHEN [Loan2LenderCode] = 'P' THEN 'Y' ELSE NULL END AS SECONDMORTGAGEPRIVATEPARTYLENDER
		, Loan2NewConstructionLoanInd AS SECONDMORTGAGECONSTRUCTIONLOAN
		, NULL AS SECONDMORTGAGEREFIFLAG
		, CASE WHEN Loan2Amount > 0 THEN 'Y' ELSE NULL END AS SECONDMORTGAGEEQUITYFLAG
		, NULL AS SECONDMORTGAGEHELOCFLAG
		, Loan2SubordinateLoanInd AS SECONDMORTGAGEOTHERSUBORDINATELOANFlag
		, SecondHomeRider AS SECONDMORTGAGESecondHomeRider
		, CondominiumRider AS SECONDMORTGAGECondominiumRider
		, MultiFamily4Rider AS SECONDMORTGAGEMultiFamily4Rider
		, PlannedUnitDevelopmentRider AS SECONDMORTGAGEPlannedUnitDevelopmentRider
		, Loan2AssumabilityRider AS SECONDMORTGAGEAssumabilityRider
		, Loan2BalloonRider AS SECONDMORTGAGEBalloonRider
		, Loan2BiweeklyPaymentRider AS SECONDMORTGAGEBiweeklyPaymentRider
		, Loan2FixedStepRateRider AS SECONDMORTGAGEFixedStepRateRider
		, Loan2GraduatedPaymentRider AS SECONDMORTGAGEGraduatedPaymentRider
		, Loan2PrePaymentRider AS SECONDMORTGAGEPrepaymentRider
		, Loan2RateImprovementRider AS SECONDMORTGAGERateImprovementRider
		, Loan2AdjRateRider AS SECONDMORTGAGEAdjustableRateRider
		, NULL AS SECONDMORTGAGEAdjustableRateIndex
		, Loan2ChangeIndex AS SECONDMORTGAGEChangeIndex
		, Loan2FirstChangeDateMMDD AS SECONDMORTGAGEFirstChangeDateMonthDay
		, Loan2FirstChangeDateYYYY AS SECONDMORTGAGEFirstChangeDateYear
		, Loan2IntOnlyPeriod AS SECONDMORTGAGEInterestOnlyPeriod
		, Loan2MaximumInt AS SECONDMORTGAGEMaximumInterestRate
		, Loan2IntRateNotLess AS SECONDMORTGAGEMinimumInterestRate
		, Loan2RateChangeFrequency AS SECONDMORTGAGERateChangeFrequency
		, LegalLotCode AS LotCode
		, LegalLandLot AS LotNumber
		, LegalLotNumber AS LandLot
		, LegalBlock AS Block
		, NULL AS Section
		, DistrictCode AS District
		, D.LegalUnit AS Unit
		, LegalCityMuniTownship AS CityMunicipalityTownship
		, LegalSubdivision AS SubdivisionName
		, LegalPhaseNumber AS PhaseNo
		, LegalTractNumber AS TractNo
		, LegalSectionTownshipRangeMeridian AS SecTwnRngMer
		, NULL AS AssessorsMapRef
		, LegalBriefDescription AS LEGALDESCRIPTION
		, TitleCompanyName AS TITLECOMPANYNAME
		, [MultiAPNCode] AS MULTIAPN
		, D.FATimeStamp AS UPDATETIMESTAMP
		, D.FAUCIDFlag AS UCID
		, D.FATimeStamp AS FATimeStamp
		/*---------------Added for Altisource - KL 20160727------------*/ 
		, P.[PropertyCLassID] AS PROPERTYUSECODE
		, P.StdLandUseCode AS STDLANDUSECODE
		, D.BuyerNameAddendum AS BUYERBORROWERNAMEADDENDUM
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D.SitusStdStreet, '') LIKE '') THEN P.[SitusStdFullStreetAddress] ELSE D.[SitusStdFullStreetAddress] END AS SitusStdFullStreetAddress
		, RIGHT(LEFT(D.RecordingDt, 6), 2) AS RecordingDateMonth
		, LEFT(D.RecordingDt, 4) AS RecordingDateYear
		, RIGHT(LEFT(D.SaleDate, 6),2) AS SaleDateMonth
		, LEFT(D.SaleDate, 4) AS SaleDateYear
		, P.[PropertyClassID] AS PropertyClassID
		, P.[SitusCensusTract] AS SitusCensusTract
		, P.[MobileHomeInd] AS MobileHomeInd
		, P.[TimeshareCode] AS TimeshareCode
		, P.[LotSizeAcres] AS LotSizeAcres
		, P.[LotSizeSqFt] AS LotSizeSqFt
		, P.[AssdTotalValue] AS AssdTotalValue
		, P.[AssdLandValue] AS AssdLandValue
		, P.[AssdImprovementValue] AS AssdImprovementValue
		, P.[MarketTotalValue] AS MarketTotalValue
		, P.[MarketValueLand] AS MarketValueLand
		, P.[MarketValueImprovement] AS MarketValueImprovement
		, P.[AssdYear] AS AssdYear
		, P.[BuildingArea] AS BuildingArea
		, P.[BuildingAreaInd] AS BuildingAreaInd
		, P.[SumBuildingSqFt] AS SumBuildingSqFt
		, P.[SumLivingAreaSqFt] AS SumLivingAreaSqFt
		, P.[SumGroundFloorSqFt] AS SumGroundFloorSqFt
		, P.[SumGrossAreaSqFt] AS SumGrossAreaSqFt
		, P.[SumAdjAreaSqFt] AS SumAdjAreaSqFt
		, P.[SumBasementSqFt] AS SumBasementSqFt
		, P.[SumGarageSqFt] AS SumGarageSqFt
		, P.[YearBuilt] AS YearBuilt
		, P.[EffectiveYearBuilt] AS EffectiveYearBuilt
		, P.[Bedrooms] AS Bedrooms
		, P.[TotalRooms] AS TotalRooms
		, P.[BathTotalCalc] AS BathTotalCalc
		, P.[BathFull] AS BathFull
		, P.[BathsParcialNbr] AS BathsParcialNbr
		, P.[BuildingClassCode] AS BuildingClassCode
		, D.[Armslength] AS Armslength
		, Loan1Type AS FIRSTMORTGAGEDETAILEDLOANTYPE
		, Loan2Type AS SECONDMORTGAGEDETAILEDLOANTYPE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusLatitude ELSE D.SitusLatitude END AS SitusLatitude
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(D .SitusStdStreet, '') LIKE '') THEN P.SitusLongitude ELSE D.SitusLongitude END AS SitusLongitude

		/*----Added for Equimine 20161107 - KL----*/ 
		,D.SalesPriceCode AS SalesPriceCode

		/*-- Changed 20181209 to pull BuyerMailFullAddress from Deed instead of MailingStdFullStreetAddress from Property as these don't always match and Tokens are pulled from Deed*/ 
		,D.[BuyerMailFullAddress] AS MailingStdFullStreetAddress

		/*,P.[MailingStdFullStreetAddress] as MailingStdFullStreetAddress*/ 
		, P.[OwnerOccupied] AS OwnerOccupied
		, P.[PoolCode] AS PoolCode

		/*---Added 20170202 for Compstak - KL*/ 
		, P.[SitusGeoStatusCode] AS SitusGeoStatusCode

		/*---Added 20170217 for MyListingsAgent - JE*/ 
		, D.[FASalePosition]

		/*---Added 20171114 KL----*/ 
		, D.[CMTID] AS DEEDCMTID
		, D.[CMTIDInstNbr] AS DEEDCMTIDInstNbr
		, D.[Loan1CMTID]
		, D.[Loan1CMTIDInstNbr]
		, D.[Loan2CMTID]
		, D.[Loan2CMTIDInstNbr]

		/*---Added 20180831 for Census KL---*/ 
		, D.[Loan1InterestRateSrce] AS Loan1InterestRateSrce
		, D.[Loan2InterestRateSrce] AS Loan2InterestRateSrce

		--/*---ADDED 20180918 MAS -----*/ 
		--,D.[LenderFullMailAddress]
		--, D.[LenderMailCity]
		--, D.[LenderMailState]
		--, D.[LenderMailZip5]
		--, D.[LenderMailZip4]
		--, D.[LenderMailCarrierCode]


			-----UPDATED  20200818 KL---
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailFullAddress] else D.[LenderFullMailAddress] end as [LenderFullMailAddress]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailCity] else D.[LenderMailCity] end as [LenderMailCity]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailState] else D.[LenderMailState] end as [LenderMailState]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailZip5] else D.[LenderMailZip5] end as [LenderMailZip5]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailZip4] else D.[LenderMailZip4] end as [LenderMailZip4]
		,Case when D.Loan1LenderTypeCode in ('e','p','s')  and ISNULL(D.[LenderFullMailAddress],'') like '' then D.[SellerMailCarrierCode] else D.[LenderMailCarrierCode] end as [LenderMailCarrierCode]



		, P.[Mtg1TransactionId]
		, P.[Mtg2TransactionId]
		, P.[Mtg3TransactionId]
		, P.[Mtg4TransactionId]
		, D.[Loan1LenderTypeCode] as LenderTypeCode

		/*-----ADDED 20190103 for Spokeo - KL----*/ 
		, D.[BuyerMailForeignAddrInd] AS MailingForeignAddressInd
		, D.[MailingFIPS] AS MailingCountyFipsCode

		/*----ADDED 20190111 MAS*/ 
		, D.VendorPID

		/*---ADDED 20190131 KL*/ 
		, P.[SumResidentialUnits]

		/*---Added 20190808 for REWW KL*/ 
		, P.SitusStdMatchCode

        ,d.[Seller1FirstName]		---  Added 20190819 for MetroStudy CL Mapping  -- BR
		,d.[Seller1LastName]		---  Added 20190819 for MetroStudy CL Mapping  -- BR
		,d.[Seller1MiddleInitial]	---  Added 20190819 for MetroStudy CL Mapping  -- BR
		
		,P.[FARooftopLatitude]		--  ADDED 20190823 MAS
		,P.[FARooftopLongitude]		--  ADDED 20190823 MAS

		------Added 20191108 for Altisource----
	  ,D.[FHAOriginatingMortgagee]
      ,D.[FHAOriginatingMortgageeNumber]
      ,D.[FHASponsorName]
      ,D.[FHASponosrNumber]
      ,D.[FHADownPaymentSource]
      ,D.[FHANonProfitNumber]
      ,D.[FHAProductType]
      ,D.[FHALoanPurpose]
      ,D.[FHAPropertyProductType]
      ,D.[FHAInterestRate]
      ,D.[FHAOriginalMortgageAmount]
      ,D.[FHAYear]
      ,D.[FHAMonth]
	  ----Added 20200109 per JE KL
	  ,D.[Seller1FirstNameMiddlename]
	  ,D.[Seller1LastNameOrCorpName]
	  ,D.[Seller2FirstNameMiddlename]
	  ,D.[Seller2LastNameOrCorpName]

	   ----Added 20200818 per BR KL--
	  ,Case when ISNULL(D.BuyerMailFullAddress,'') not like '' and D.BuyerMailFullAddress like D.SitusStdFullStreetAddress and ISNULL(D.BuyerMailZip5,'') not like '' and D.BuyerMailZip5 like D.SitusStdZIP5 then 'Y' else null end as [BuyerOccupied]

	   ------Added 20210114 for Connected UNIV OF MIAMI
	,G.[County Name] as [County Name]
	,LEFT(N.NMLSAgentID,15) as NMLSAgentID
	,LEFT(N.NMLSAgentName,100) as NMLSAgentName
	,LEFT(N.NMLSLenderID,15) as NMLSLenderID
	,LEFT(N.NMLSLenderName,100) as NMLSLenderName
	,LEFT(N.NMLSBrokerID,15) as NMLSBrokerID
	,LEFT(N.NMLSBrokerName,100) as NMLSBrokerName

	FROM  deed_sup D WITH (NOLOCK) JOIN [Global].dbo.[County] b WITH (NOLOCK) ON D.FIPS = b.FIPSCode 
		LEFT OUTER JOIN Data.dbo.Property AS P WITH (NOLOCK) ON D.FIPS = P.FIPS AND D.FAPropertyID = P.PropertyID
		join global.dbo.county as G with(NOLOCK) on D.FIPS = G.FIPSCODE
				LEFT OUTER JOIN Data.dbo.NMLS_Data N
					on D.FIPS = N.FIPS
						and D.TransactionID = N.TransactionID

UNION ALL


/*--------------------------------------------------          FROM MORTGAGE_SUP          ---------------------------------------------------*/ 

		SELECT M.FIPS AS FIPS
		, M.FAPropertyId AS PROPERTYUNIQUEID
		, M.APN AS APN
		, NULL AS APNSEQUENCENBR
		, NULL AS PREVIOUSPARCELNUMBER
		, M.TaxAccountNbr AS TAXACCOUNTNUMBER
		, M.FAMatchInd AS MatchedFlag
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdHouseNbr ELSE M.SitusHouseNbr END AS HOUSENUMBER
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdHouseNbr2 ELSE M.SitusHouseNbr2 END AS HOUSENUMBER2
		, NULL AS HOUSENUMBERSUFFIX
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdDirectionLeft ELSE M.SitusDirectionLeft END AS DIRECTIONLEFT
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdStreet ELSE M.SitusStreet END AS STREETNAME
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdMode ELSE M.SitusMode END AS Suffix
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdDirectionRight ELSE M.SitusDirectionRight END AS DIRECTIONRIGHT
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdUnitType ELSE M.SitusUnitType END AS UNITTYPE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdUnitNbr ELSE M.SitusUnitNbr END AS UNITNUMBER
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdCity ELSE M.SitusCity END AS CITY
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdState ELSE M.SitusState END AS STATE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdZIP5 ELSE M.SitusZIP5 END AS ZIPCODE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdZip4 ELSE M.SitusZip4 END AS ZIPPLUS4
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusStdCarrierCode ELSE M.SitusCarrierCode END AS CARRIERCODE
		, CASE WHEN [Borrower1NoParsInd] = 1 THEN 'Y' ELSE NULL END AS CORPORATEINDICATOR
		, M.Borrower1FullName AS BUYERNAMEBORROWERNAME1
		, BorrowerNameAddendum AS OWNERETALIND
		, NULL AS OwnerCAREOfNAME
		, BorrowerVestingCode AS OWNERSHIPRIGHTSCODE1
		, Borrower1IDCode AS OWNERRELATIONSHIPTYPE1
		, CASE WHEN Borrower2NoParsInd = 1 THEN 'Y' ELSE NULL END AS CORPORATEINDICATOR2
		, Borrower2FullName AS BUYERNAMEBORROWERNAME2
		, BorrowerVestingCode AS OWNERSHIPRIGHTSCODE2
		, Borrower21IDCode AS OWNERRELATIONSHIPTYPE2
		, Borrower1LastName AS BUYER1LASTNAME
		, Borrower1FirstName AS BUYER1FIRSTNAME
		, Borrower1MiddleInitial AS BUYER1MIDDLEName
		, Borrower1NameSuffix AS BUYER1SUFFIX
		, Borrower2LastName AS BUYER2LASTNAME
		, Borrower2FirstName AS BUYER2FIRSTNAME
		, Borrower2MiddleInitial AS BUYER2MIDDLEName
		, Borrower2NameSuffix AS BUYER2SUFFIX
		, BorrowerMailHouseNbr AS MAILHOUSENUMBER
		, BorrowerMailHouseNbr2 AS MAILHOUSENUMBER2
		, BorrowerMailHouseNbrSuffix AS MAILHOUSENUMBERSUFFIX
		, BorrowerMailLeftDirection AS MAILDIRECTIONLEFT
		, BorrowerMailStreetName AS MAILSTREETNAME
		, BorrowerMailMode AS MAILMODE
		, BorrowerMailRightDirection AS MAILDIRECTIONRIGHT
		, BorrowerMailUnitType AS MAILUNITTYPE
		, BorrowerMailUnitNumber AS MAILUNITNUMBER
		, BorrowerMailCity AS MAILCITY
		, BorrowerMailState AS MAILSTATE
		, BorrowerMailZip5 AS MAILZIPCODE
		, BorrowerMailZip4 AS MAILZIPPlus4
		, BorrowerMailCarrierCode AS MAILCARRIERCODE
		, m.TransactionId AS FirstAmericanUniqueTransactionID
		, RecordingDt AS RECORDINGDATE
		, ContractDate AS SALEDATE
		, [DocNbrSrce] AS DOCUMENTNUMBER
		, [BookSrce] AS RECORDINGBOOK
		, [PageSrce] AS RECORDINGPAGE
		, NULL AS HAWAIILANDCOURTDOCUMENTNUMBER
		, NULL AS HAWAIITCTCERTIFICATENUMBER
		, NULL AS WAEXCISENUMBER
		, DocumentTypeCode AS DOCUMENTTYPE
		, CASE WHEN [LoanTransType] = '6' THEN '1' 
			WHEN [LoanTransType] = '7' THEN '2' 
				WHEN [LoanTransType] = '8' THEN '3' 
					WHEN [LoanTransType] = '9' THEN '4' 
						WHEN [LoanTransType] = '10' THEN '5' 
							WHEN [LoanTransType] = '11' THEN '6' 
								WHEN [LoanTransType] = '3' THEN '5' 
									WHEN [LoanTransType] = '0' THEN '6' 
			END AS TRANSACTIONTYPE
		, NULL AS SELLERNAME
		, NULL AS SELLERNAMECORPINDICATOR
		, NULL AS SELLERNAME2
		, NULL AS SELLERNAME2CORPINDICATOR
		, NULL AS SALEAMOUNT
		, NULL AS TRANSFERTAX
		, NULL AS PARTIALINTERESTINDICATORFLAG
		, NULL AS RESALEFLAG
		, NULL AS NEWCONSTRUCTIONFLAG
		, NULL AS INTERFAMILYFLAG
		, NULL AS FORCLOSUREFLAG
		, NULL AS REOSALEFLAG
		, RecordingDt AS FIRSTMORTGAGERECORDINGDATE
		, ContractDate AS FIRSTMORTGAGEDOCDATE
		, [DocNbrSrce] AS FIRSTMORTGAGEDOCUMENTNUMBER
		, [BookSrce] AS FIRSTMORTGAGERECORDINGBOOK
		, [PageSrce] AS FIRSTMORTGAGERECORDINGPAGE
		, CASE WHEN m.LoanAmount > 0 THEN 'MG' ELSE NULL END AS FIRSTMORTGAGEDETAILEDDOCUMENTTYPE
		, m.LoanAmount AS FIRSTMORTGAGEMORTGAGEAMOUNT
		, Replace(Replace(m.[LenderName], ',', ''), '.', '') AS FIRSTMORTGAGELENDERNAME
		, CASE WHEN [LoanTransType] = '6' THEN '1' 
			WHEN [LoanTransType] = '7' THEN '2' 
				WHEN [LoanTransType] = '8' THEN '3' 
					WHEN [LoanTransType] = '9' THEN '4' 
						WHEN [LoanTransType] = '10' THEN '5' 
							WHEN [LoanTransType] = '11' THEN '6' 
								WHEN [LoanTransType] = '3' THEN '5' 
									WHEN [LoanTransType] = '0' THEN '6' 
			END AS FIRSTMORTGAGELOANTYPECODE
		, CASE WHEN [LoanTermMonths] IS NOT NULL THEN 'M' ELSE NULL END AS FIRSTMORTGAGETERMCODE
		, [LoanTermMonths] AS FIRSTMORTGAGETERM
		, LoanDueDate AS FIRSTMORTGAGEDUEDATE
		, [TypeFinance] AS FIRSTMORTGAGEINTERESTRATETYPE
		, format([LoanInterestRate], '00000') AS FIRSTMORTGAGEINTERESTRATE
		, CASE WHEN [LenderTypeCode] = 'S' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGESELLERCARRYBACKFLAG
		, CASE WHEN (LenderTypeCode in('P') OR (LenderTypeCode in('E','S') and LenderID in('000357','000358','000117'))) THEN 'Y' ELSE NULL END AS FIRSTMORTGAGEPRIVATEPARTYLENDER
		, CASE WHEN [LoanType] = '8' THEN 'Y' ELSE NULL END AS FIRSTMORTGAGECONSTRUCTIONLOAN
		, [LoanRefiLoanInd] AS FIRSTMORTGAGEREFIFLAG
		, [LoanEquityLoanInd] AS FIRSTMORTGAGEEQUITYFLAG
		, [LoanHELOCLoanInd] AS FIRSTMORTGAGEHELOCFLAG
		, SubordinateLoanInd AS FIRSTMORTGAGEOTHERSUBORDINATELOANFlag
		, SecondHomeRider AS FIRSTMORTGAGESecondHomeRider
		, CondominiumRider AS FIRSTMORTGAGECondominiumRider
		, MultiFamily4Rider AS FIRSTMORTGAGEMultiFamily4Rider
		, PlannedUnitDevelopmentRider AS FIRSTMORTGAGEPlannedUnitDevelopmentRider
		, LoanAssumabilityRider AS FIRSTMORTGAGEAssumabilityRider
		, LoanBalloonRider AS FIRSTMORTGAGEBalloonRider
		, LoanBiweeklyPaymentRider AS FIRSTMORTGAGEBiweeklyPaymentRider
		, LoanFixedStepRateRider AS FIRSTMORTGAGEFixedStepRateRider
		, LoanGraduatedPaymentRider AS FIRSTMORTGAGEGraduatedPaymentRider
		, LoanPrePaymentRider AS FIRSTMORTGAGEPrepaymentRider
		, LoanRateImprovementRider AS FIRSTMORTGAGERateImprovementRider
		, LoanAdjRateRider AS FIRSTMORTGAGEAdjustableRateRider
		, LoanAdjRateIndex AS FIRSTMORTGAGEAdjustableRateIndex
		, LoanChangeIndex AS FIRSTMORTGAGEChangeIndex
		, LoanFirstChangeDateMMDD AS FIRSTMORTGAGEFirstChangeDateMonthDay
		, LoanFirstChangeDateYYYY AS FIRSTMORTGAGEFirstChangeDateYear
		, LoanIntOnlyPeriod AS FIRSTMORTGAGEInterestOnlyPeriod
		, LoanMaximumInt AS FIRSTMORTGAGEMaximumInterestRate
		, LoanIntRateNotLess AS FIRSTMORTGAGEMinimumInterestRate
		, LoanRateChangeFrequency AS FIRSTMORTGAGERateChangeFrequency
		, NULL AS SECONDMORTGAGERECORDINGDATE
		, NULL AS SECONDMORTGAGEDOCDATE
		, NULL AS SECONDMORTGAGEDOCUMENTNUMBER
		, NULL AS SECONDMORTGAGERECORDINGBOOK
		, NULL AS SECONDMORTGAGERECORDINGPAGE
		, NULL AS SECONDMORTGAGEDETAILEDDOCUMENTTYPE
		, NULL AS SECONDMORTGAGEAMOUNT
		, NULL AS SECONDMORTGAGELENDERNAME
		, NULL AS SECONDMORTGAGELOANTYPECODE
		, NULL AS SECONDMORTGAGETERMCODE
		, NULL AS SECONDMORTGAGETERM
		, NULL AS SECONDMORTGAGEDUEDATE
		, NULL AS SECONDMORTGAGEINTERESTRATETYPE
		, NULL AS SECONDMORTGAGEINTERESTRATE
		, NULL AS SECONDMORTGAGESELLERCARRYBACK
		, NULL AS SECONDMORTGAGEPRIVATEPARTYLENDER
		, NULL AS SECONDMORTGAGECONSTRUCTIONLOAN
		, NULL AS SECONDMORTGAGEREFIFLAG
		, NULL AS SECONDMORTGAGEEQUITYFLAG
		, NULL AS SECONDMORTGAGEHELOCFLAG
		, NULL AS SECONDMORTGAGEOTHERSUBORDINATELOANFlag
		, NULL AS SECONDMORTGAGESecondHomeRider
		, NULL AS SECONDMORTGAGECondominiumRider
		, NULL AS SECONDMORTGAGEMultiFamily4Rider
		, NULL AS SECONDMORTGAGEPlannedUnitDevelopmentRider
		, NULL AS SECONDMORTGAGEAssumabilityRider
		, NULL AS SECONDMORTGAGEBalloonRider
		, NULL AS SECONDMORTGAGEBiweeklyPaymentRider
		, NULL AS SECONDMORTGAGEFixedStepRateRider
		, NULL AS SECONDMORTGAGEGraduatedPaymentRider
		, NULL AS SECONDMORTGAGEPrepaymentRider
		, NULL AS SECONDMORTGAGERateImprovementRider
		, NULL AS SECONDMORTGAGEAdjustableRateRider
		, NULL AS SECONDMORTGAGEAdjustableRateIndex
		, NULL AS SECONDMORTGAGEChangeIndex
		, NULL AS SECONDMORTGAGEFirstChangeDateMonthDay
		, NULL AS SECONDMORTGAGEFirstChangeDateYear
		, NULL AS SECONDMORTGAGEInterestOnlyPeriod
		, NULL AS SECONDMORTGAGEMaximumInterestRate
		, NULL AS SECONDMORTGAGEMinimumInterestRate
		, NULL AS SECONDMORTGAGERateChangeFrequency
		, NULL AS LotCode
		, LegalLandLot AS LotNumber
		, LegalLotNumber AS LandLot
		, LegalBlock AS Block
		, M.LegalSection AS Section
		, LegalDistrict AS District
		, M.LegalUnit AS Unit
		, LegalCityMunicipalityTownship AS CityMunicipalityTownship
		, LegalSubdivision AS SubdivisionName
		, LegalPhaseNumber AS PhaseNo
		, LegalTractNumber AS TractNo
		, LegalMeridian AS SecTwnRngMer
		, NULL AS AssessorsMapRef
		, LegalBriefDescription AS LEGALDESCRIPTION
		, TitleCompanyName AS TITLECOMPANYNAME
		, [MultiAPNCode] AS MULTIAPN
		, M.FATimeStamp AS UPDATETIMESTAMP
		, M.FAUCIDFlag AS UCID
		, M.FATimeStamp AS FATimeStamp
		/*---------------Added for Altisource - KL 20160727------------*/ 
		, P.[PropertyCLassID] AS PROPERTYUSECODE
		, P.StdLandUseCode AS STDLANDUSECODE
		, M.BorrowerNameAddendum AS BUYERBORROWERNAMEADDENDUM
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.[SitusStdFullStreetAddress] ELSE M.[SitusFullStreetAddress] END AS SitusStdFullStreetAddress
		, RIGHT(LEFT(M.RecordingDt, 6), 2) AS RecordingDateMonth
		, LEFT(M.RecordingDt, 4) AS RecordingDateYear
		, RIGHT(LEFT(M.ContractDate, 6), 2) AS SaleDateMonth
		, LEFT(M.ContractDate, 4) AS SaleDateYear
		, P.[PropertyClassID] AS PropertyClassID
		, P.[SitusCensusTract] AS SitusCensusTract
		, P.[MobileHomeInd] AS MobileHomeInd
		, P.[TimeshareCode] AS TimeshareCode
		, P.[LotSizeAcres] AS LotSizeAcres
		, P.[LotSizeSqFt] AS LotSizeSqFt
		, P.[AssdTotalValue] AS AssdTotalValue
		, P.[AssdLandValue] AS AssdLandValue
		, P.[AssdImprovementValue] AS AssdImprovementValue
		, P.[MarketTotalValue] AS MarketTotalValue
		, P.[MarketValueLand] AS MarketValueLand
		, P.[MarketValueImprovement] AS MarketValueImprovement
		, P.[AssdYear] AS AssdYear
		, P.[BuildingArea] AS BuildingArea
		, P.[BuildingAreaInd] AS BuildingAreaInd
		, P.[SumBuildingSqFt] AS SumBuildingSqFt
		, P.[SumLivingAreaSqFt] AS SumLivingAreaSqFt
		, P.[SumGroundFloorSqFt] AS SumGroundFloorSqFt
		, P.[SumGrossAreaSqFt] AS SumGrossAreaSqFt
		, P.[SumAdjAreaSqFt] AS SumAdjAreaSqFt
		, P.[SumBasementSqFt] AS SumBasementSqFt
		, P.[SumGarageSqFt] AS SumGarageSqFt
		, P.[YearBuilt] AS YearBuilt
		, P.[EffectiveYearBuilt] AS EffectiveYearBuilt
		, P.[Bedrooms] AS Bedrooms
		, P.[TotalRooms] AS TotalRooms
		, P.[BathTotalCalc] AS BathTotalCalc
		, P.[BathFull] AS BathFull
		, P.[BathsParcialNbr] AS BathsParcialNbr
		, P.[BuildingClassCode] AS BuildingClassCode
		, NULL AS Armslength
		, LoanType AS FIRSTMORTGAGEDETAILEDLOANTYPE
		, NULL AS SECONDMORTGAGEDETAILEDLOANTYPE
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusLatitude ELSE M.SitusLatitude END AS SitusLatitude
		, CASE WHEN (P.SitusStdZip4 NOT LIKE '' OR isNULL(M.SitusStreet, '') LIKE '') THEN P.SitusLongitude ELSE M.SitusLongitude END AS SitusLongitude

		/*----Added for Equimine 20161107 - KL----*/ 
		, NULL AS SalesPriceCode

		/*-- Changed 20181209 to pull BorrowerFullMailAddress from Mortgage instead of MailingStdFullStreetAddress from Property as these don't always match and Tokens are pulled from Mortgage*/ 
		,M.[BorrowerFullMailAddress] AS MailingStdFullStreetAddress

		/*,P.[MailingStdFullStreetAddress] as MailingStdFullStreetAddress*/ 
		, P.[OwnerOccupied] AS OwnerOccupied
		, P.[PoolCode] AS PoolCode

		/*---Added 20170202 for Compstak - KL*/ 
		, P.[SitusGeoStatusCode] AS SitusGeoStatusCode

		/*---Added 20170217 for MyListingsAgent - JE*/ 
		, NULL AS [FASalePosition]

		/*---Added 20171114 KL----*/ 
		, NULL AS DEEDCMTID
		, NULL AS DEEDCMTIDInstNbr
		, M.[CMTID] AS [Loan1CMTID]
		, M.[CMTIDInstNbr] AS [Loan1CMTIDInstNbr]
		, NULL AS [Loan2CMTID]
		, NULL AS [Loan2CMTIDInstNbr]

		/*---Added 20180831 for Census KL---*/ 
		, M.[LoanInterestRateSrce] AS Loan1InterestRateSrce
		, NULL AS Loan2InterestRateSrce

		/*---ADDED 20180918 MAS -----*/ 
		, M.[LenderFullMailAddress]
		, M.[LenderMailCity]
		, M.[LenderMailState]
		, M.[LenderMailZip5]
		, M.[LenderMailZip4]
		, M.[LenderMailCarrierCode]
		, P.[Mtg1TransactionId]
		, P.[Mtg2TransactionId]
		, P.[Mtg3TransactionId]
		, P.[Mtg4TransactionId]
		, M.[LenderTypeCode]

		/*-----ADDED 20190103 for Spokeo - KL----*/ 
		, M.[BorrowerMailForeignAddrInd] AS MailingForeignAddressInd
		, M.[MailingFIPS] AS MailingCountyFipsCode

		/*----ADDED 20190111 MAS*/ 
		, M.VendorPID

		/*---ADDED 20190131 KL*/ 
		, P.[SumResidentialUnits]

		/*---Added 20190808 for REWW KL*/ 
		, P.SitusStdMatchCode

		, null as Seller1FirstName			---  Added 20190819 for MetroStudy CL Mapping  -- BR
		, null as Seller1LastName			---  Added 20190819 for MetroStudy CL Mapping  -- BR
		, null  as Seller1MiddleInitial		---  Added 20190819 for MetroStudy CL Mapping  -- BR

		, P.[FARooftopLatitude] --ADDED 20190823 MAS
		, P.[FARooftopLongitude] --ADDED 20190823 MAS


			------Added 20191108 for Altisource----
	  ,M.[FHAOriginatingMortgagee]
      ,M.[FHAOriginatingMortgageeNumber]
      ,M.[FHASponsorName]
      ,M.[FHASponosrNumber]
      ,M.[FHADownPaymentSource]
      ,M.[FHANonProfitNumber]
      ,M.[FHAProductType]
      ,M.[FHALoanPurpose]
      ,M.[FHAPropertyProductType]
      ,M.[FHAInterestRate]
      ,M.[FHAOriginalMortgageAmount]
      ,M.[FHAYear]
      ,M.[FHAMonth]


	  ----Added 20200109 per JE KL
	  ,NULL AS [Seller1FirstNameMiddlename]
	  ,NULL AS [Seller1LastNameOrCorpName]
	  ,NULL AS [Seller2FirstNameMiddlename]
	  ,NULL AS [Seller2LastNameOrCorpName]

	   ----Added 20200818 per BR - KL
	  ,NULL as [BuyerOccupied] 

	   ------Added 20210114 for Connected UNIV OF MIAMI
	,G.[County Name] as [County Name]
	,LEFT(N.NMLSAgentID,15) as NMLSAgentID
	,LEFT(N.NMLSAgentName,100) as NMLSAgentName
	,LEFT(N.NMLSLenderID,15) as NMLSLenderID
	,LEFT(N.NMLSLenderName,100) as NMLSLenderName
	,LEFT(N.NMLSBrokerID,15) as NMLSBrokerID
	,LEFT(N.NMLSBrokerName,100) as NMLSBrokerName

	 
	FROM  Mortgage_sup M WITH (NOLOCK) JOIN [Global].dbo.[County] b WITH (NOLOCK) ON M.FIPS = b.FIPSCode 
		LEFT OUTER JOIN Data.dbo.Property AS P WITH (NOLOCK) ON M.FIPS = P.FIPS AND M.FAPropertyID = P.PropertyID
		join global.dbo.county as G with(NOLOCK) on M.FIPS = G.FIPSCODE
				LEFT OUTER JOIN Data.dbo.NMLS_Data N
					on M.FIPS = N.FIPS
						and M.TransactionID = N.TransactionID




GRANT SELECT ON [dbo].[vDeedMortgageSTD2_NMLS] TO [CORP\cbrady] AS [dbo]
