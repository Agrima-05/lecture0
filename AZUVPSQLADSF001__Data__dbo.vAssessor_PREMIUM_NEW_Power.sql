SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[vAssessor_PREMIUM_NEW_Power]
AS
SELECT 
	A.[FIPS] as FIPS,
	A.[PropertyID] as PropertyID,
	A.[FormattedAPN] as FormattedAPN,
	A.[APNSeqNbr] as APNSeqNbr,
	A.[OldAPN] as OldAPN,
	A.[TaxAccountNumber] as TaxAccountNumber,
	A.[SitusStdHouseNbr] as SitusStdHouseNbr,
	A.[SitusStdHouseNbr2] as SitusStdHouseNbr2,
	A.[SitusStdHouseNbrSuffix] as SitusStdHouseNbrSuffix,
	A.[SitusStdDirectionLeft] as SitusStdDirectionLeft,
	A.[SitusStdStreet] as SitusStdStreet,
	A.[SitusStdMode] as SitusStdMode,
	A.[SitusStdDirectionRight] as SitusStdDirectionRight,
	A.[SitusStdUnitType] as SitusStdUnitType,
	A.[SitusStdUnitNbr] as SitusStdUnitNbr,
	A.[SitusStdCity] as SitusStdCity,
	A.[SitusStdState] as SitusStdState,
	A.[SitusStdZIP5] as SitusStdZIP5,
	A.[SitusStdZIP4] as SitusStdZIP4,
	A.[SitusStdCarrierCode] as SitusStdCarrierCode,
	A.[SitusLatitude] as SitusLatitude,
	A.[SitusLongitude] as SitusLongitude,
	A.[PropertyClassID] as PropertyClassID,
	A.[StdLandUseCode] as StdLandUseCode,
	A.[StateLandUseCode] as StateLandUseCode,
	A.[CountyLandUseCode] as CountyLandUseCode,
	A.[Zoning] as Zoning,
	A.[SitusCensusTract] as SitusCensusTract,
	A.[MobileHomeInd] as MobileHomeInd,
	A.[TimeshareCode] as TimeshareCode,
	A.[SchoolDistrictName] as SchoolDistrictName,
	A.[LotSizeFrontageFeet] as LotSizeFrontageFeet,
	A.[LotSizeDepthFeet] as LotSizeDepthFeet,
	A.[LotSizeAcres] as LotSizeAcres,
	A.[LotSizeSqFt] as LotSizeSqFt,
	A.[OwnerStd1CorpInd] as OwnerStd1CorpInd,
	A.[OwnerStd1LastName] as OwnerStd1LastName,
	A.[OwnerStd1FirstName] as OwnerStd1FirstName,
	A.[OwnerStd1MiddleName] as OwnerStd1MiddleName,
	A.[OwnerStd1Suffix] as OwnerStd1Suffix,
	A.[OwnerStd2CorpInd] as OwnerStd2CorpInd,
	A.[OwnerStd2LastName] as OwnerStd2LastName,
	A.[OwnerStd2FirstName] as OwnerStd2FirstName,
	A.[OwnerStd2MiddleName] as OwnerStd2MiddleName,
	A.[OwnerStd2Suffix] as OwnerStd2Suffix,
	A.[OwnerStdNAME1FULL] as OwnerStdNAME1FULL,
	A.[OwnerStdNAME2FULL] as OwnerStdNAME2FULL,
	A.[OwnerOccupied] as OwnerOccupied,
	A.[OwnerStd1OwnershipRights] as OwnerStd1OwnershipRights,
	A.[MailingStdHouseNbr] as MailingStdHouseNbr,
	A.[MailingStdHouseNbr2] as MailingStdHouseNbr2,
	A.[MailingStdHouseNbrSuffix] as MailingStdHouseNbrSuffix,
	A.[MailingStdDirectionLeft] as MailingStdDirectionLeft,
	A.[MailingStdStreet] as MailingStdStreet,
	A.[MailingStdMode] as MailingStdMode,
	A.[MailingStdDirectionRight] as MailingStdDirectionRight,
	A.[MailingStdUnitType] as MailingStdUnitType,
	A.[MailingStdUnitNbr] as MailingStdUnitNbr,
	A.[MailingStdCity] as MailingStdCity,
	A.[MailingStdState] as MailingStdState,
	A.[MailingStdZIP5] as MailingStdZIP5,
	A.[MailingStdZIP4] as MailingStdZIP4,
	A.[MailingStdCarrierCode] as MailingStdCarrierCode,
	A.[MailingOptOut] as MailingOptOut,
	A.[AssdTotalValue] as AssdTotalValue,
	A.[AssdLandValue] as AssdLandValue,
	A.[AssdImprovementValue] as AssdImprovementValue,
	A.[MarketTotalValue] as MarketTotalValue,
	A.[MarketValueLand] as MarketValueLand,
	A.[MarketValueImprovement] as MarketValueImprovement,
	A.[TaxAmount] as TaxAmount,
	A.[TaxYear] as TaxYear,	
	A.[TaxDeliquentYear1] as TaxDeliquentYear1,
	A.[AssdYear] as AssdYear,
	A.[TaxRateCodeArea] as TaxRateCodeArea,
	A.[SchoolTaxDistrict1Code] as SchoolTaxDistrict1Code,
	A.[SchoolTaxDistrict2Code] as SchoolTaxDistrict2Code,
	A.[SchoolTaxDistrict3Code] as SchoolTaxDistrict3Code,
	CASE WHEN A.[HomesteadInd] is NULL THEN A.[CalifHomeownerInd] ELSE A.[HomesteadInd] END as HomesteadInd,
	A.[VeteranInd] as VeteranInd,
	A.[DisabledInd] as DisabledInd,
	A.[WidowInd] as WidowInd,
	A.[SeniorInd] as SeniorInd,
	A.[SchoolCollegeInd] as SchoolCollegeInd,
	A.[ReligiousInd] as ReligiousInd,
	A.[WelfareInd] as WelfareInd,
	A.[PublicUtilityInd] as PublicUtilityInd,
	A.[CemeteryInd] as CemeteryInd,
	A.[HospitalInd] as HospitalInd,
	A.[LibraryInd] as LibraryInd,
	A.[BuildingArea] as BuildingArea,
	A.[BuildingAreaInd] as BuildingAreaInd,
	A.[SumBuildingSqFt] as SumBuildingSqFt,
	A.[SumLivingAreaSqFt] as SumLivingAreaSqFt,
	A.[SumGrossAreaSqFt] as SumGrossAreaSqFt,
	A.[SumAdjAreaSqFt] as SumAdjAreaSqFt,
	A.[SumBasementSqFt] as SumBasementSqFt,
	A.[SumGarageSqFt] as SumGarageSqFt,
	A.[YearBuilt] as YearBuilt,
	A.[EffectiveYearBuilt] as EffectiveYearBuilt,
	A.[Bedrooms] as Bedrooms,
	A.[TotalRooms] as TotalRooms,
	A.[BathTotalCalc] as BathTotalCalc,
	A.[BathFull] as BathFull,
	A.[BathsParcialNbr] as BathsParcialNbr,
	A.[BathFixturesNbr] as BathFixturesNbr,
	A.[AirConditioningCode] as AirConditioningCode,
	A.[BasementCode] as BasementCode,
	A.[BuildingClassCode] as BuildingClassCode,
	A.[BuildingConditionCode] as BuildingConditionCode,
	A.[ConstructionTypeCode] as ConstructionTypeCode,
	A.[ExteriorWallsCode] as ExteriorWallsCode,
	A.[InteriorWallsCode] as InteriorWallsCode,
	A.[FireplaceCode] as FireplaceCode,
	------Changed 20171027 to populate FloorTypeCode from FloorCoverCode as FloorTypeCode not populated in Property--- KL
	A.[FloorCoverCode] as FloorTypeCode,
	A.[Garage] as Garage,
	A.[HeatCode] as HeatCode,
	A.[HeatingFuelTypeCode] as HeatingFuelTypeCode,
	A.[SiteInfluenceCode] as SiteInfluenceCode,
	A.[GarageParkingNbr] as GarageParkingNbr,
	A.[DrivewayCode] as DrivewayCode,
	A.[PatioCode] as PatioCode,
	A.[PoolCode] as PoolCode,
	A.[PorchCode] as PorchCode,
	A.[BuildingQualityCode] as BuildingQualityCode,
	A.[RoofCoverCode] as RoofCoverCode,
	A.[RoofTypeCode] as RoofTypeCode,
	A.[SewerCode] as SewerCode,
	A.[StoriesNbrCode] as StoriesNbrCode,
	A.[StyleCode] as StyleCode,
	A.[SumResidentialUnits] as SumResidentialUnits,
	A.[SumBuildingsNbr] as SumBuildingsNbr,
	A.[SumCommercialUnits] as SumCommercialUnits,
	A.[WaterCode] as WaterCode,
	A.[LotCode] as LotCode,
	A.[LotNumber] as LotNumber,
	A.[LandLot] as LandLot,
	A.[Block] as Block,
	A.[Section] as Section,
	A.[District] as District,
	A.[LegalUnit] as LegalUnit,
	A.[Municipality] as Municipality,
	A.[SubdivisionName] as SubdivisionName,
	A.[SubdivisionPhaseNbr] as SubdivisionPhaseNbr,
	A.[SubdivisionTractNbr] as SubdivisionTractNbr,
	A.[Meridian] as Meridian,
	A.[AssessorsMapRef1] as AssessorsMapRef1,
	A.[LegalDescription] as LegalDescription,
	A.[CurrentSaleTransactionId] as CurrentSaleTransactionId,
	A.[CurrSaleFormatDocNbr] as CurrSaleInputDocNbr,
	A.[CurrSaleFormatBook] as CurrSaleInputBook,
	A.[CurrSaleFormatPage] as CurrSaleInputPage,
	A.[CurrSaleRecordingDate] as CurrSaleRecordingDate,
	A.[CurrSaleContractDate] as CurrSaleContractDate,
	A.[CurrSaleDocumentType] as CurrSaleDocumentType,
	A.[CurrSalesPrice] as CurrSalesPrice,
	A.[CurrSaleBuyer1FullName] as CurrSaleBuyer1FullName,
	A.[CurrSaleBuyer2FullName] as CurrSaleBuyer2FullName,
	A.[CurrSaleSeller1FullName] as CurrSaleSeller1FullName,
	A.[CurrSaleSeller2FullName] as CurrSaleSeller2FullName,
	A.[ConCurrMtg1FormatDocNbr] as ConCurrMtg1InputDocNbr,
	A.[ConCurrMtg1FormatBook] as ConCurrMtg1InputBook,
	A.[ConCurrMtg1FormatPage] as ConCurrMtg1InputPage,
	A.[ConCurrMtg1RecordingDt] as ConCurrMtg1RecordingDt,
	A.[ConCurrMtg1LoanAmt] as ConCurrMtg1LoanAmt,
	A.[ConCurrMtg1Lender] as ConCurrMtg1Lender,
	A.[ConCurrMtg1Term] as ConCurrMtg1Term,
	A.[ConCurrMtg1LoanDueDt] as ConCurrMtg1LoanDueDt,
	A.[ConCurrMtg1AdjOrFix] as ConCurrMtg1AdjOrFix,
	A.[ConCurrMtg1LoanType] as ConCurrMtg1LoanType,
	A.[ConCurrMtg1Typefinancing] as ConCurrMtg1Typefinancing,
	A.[ConCurrMtg2FormatDocNbr] as ConCurrMtg2InputDocNbr,
	A.[ConCurrMtg2FormatBook] as ConCurrMtg2InputBook,
	A.[ConCurrMtg2FormatPage] as ConCurrMtg2InputPage,
	A.[ConCurrMtg2RecordingDt] as ConCurrMtg2RecordingDt,
	A.[ConCurrMtg2LoanAmt] as ConCurrMtg2LoanAmt,
	A.[ConCurrMtg2Lender] as ConCurrMtg2Lender,
	A.[ConCurrMtg2Term] as ConCurrMtg2Term,
	A.[ConCurrMtg2LoanDueDt] as ConCurrMtg2LoanDueDt,
	A.[ConCurrMtg2AdjOrFix] as ConCurrMtg2AdjOrFix,
	A.[ConCurrMtg2LoanType] as ConCurrMtg2LoanType,
	A.[ConCurrMtg2Typefinancing] as ConCurrMtg2Typefinancing,
	A.[PrevSaleTransactionId] as PrevSaleTransactionId,
	A.[PrevSaleFormatDocNbr] as PrevSaleInputDocNbr,
	A.[PrevSaleFormatBook] as PrevSaleInputBook,
	A.[PrevSaleFormatPage] as PrevSaleInputPage,
	A.[PrevSaleRecordingDate] as PrevSaleRecordingDate,
	A.[PrevSaleContractDate] as PrevSaleContractDate,
	A.[PrevSaleDocumentType] as PrevSaleDocumentType,
	A.[PrevSalesPrice] as PrevSalesPrice,
	A.[PrevSaleBuyer1FullName] as PrevSaleBuyer1FullName,
	A.[PrevSaleBuyer2FullName] as PrevSaleBuyer2FullName,
	A.[PrevSaleSeller1FullName] as PrevSaleSeller1FullName,
	A.[PrevSaleSeller2FullName] as PrevSaleSeller2FullName,
	A.[PrevMtg1FormatDocNbr] as PrevMtg1InputDocNbr,
	A.[PrevMtg1FormatBook] as PrevMtg1InputBook,
	A.[PrevMtg1FormatPage] as PrevMtg1InputPage,
	A.[PrevMtg1RecordingDt] as PrevMtg1RecordingDt,
	A.[PrevMtg1LoanAmt] as PrevMtg1LoanAmt,
	A.[PrevMtg1Lender] as PrevMtg1Lender,
	A.[PrevMtg1Term] as PrevMtg1Term,
	A.[PrevMtg1LoanDueDt] as PrevMtg1LoanDueDt,
	A.[PrevMtg1AdjRider] as PrevMtg1AdjRider,
	A.[PrevMtg1LoanType] as PrevMtg1LoanType,
	A.[PrevMtg1Typefinancing] as PrevMtg1Typefinancing,
	A.[TotalOpenLienNbr] as TotalOpenLienNbr,
	A.[TotalOpenLienAmt] as TotalOpenLienAmt,
	A.[Mtg1TransactionId] as Mtg1TransactionId,
	A.[Mtg1LoanAmt] as Mtg1LoanAmt,
	A.[Mtg1Lender] as Mtg1Lender,
	A.[Mtg1Term] as Mtg1Term,
	A.[Mtg1LoanDueDt] as Mtg1LoanDueDt,
	A.[Mtg1AdjRider] as Mtg1AdjRider,
	A.[Mtg1LoanType] as Mtg1LoanType,
	A.[Mtg1Typefinancing] as Mtg1Typefinancing,
	A.[Mtg1LienPosition] as Mtg1LienPosition,
	A.[Mtg2TransactionId] as Mtg2TransactionId,
	A.[Mtg2LoanAmt] as Mtg2LoanAmt,
	A.[Mtg2Lender] as Mtg2Lender,
	A.[Mtg2Term] as Mtg2Term,
	A.[Mtg2LoanDueDt] as Mtg2LoanDueDt,
	A.[Mtg2AdjRider] as Mtg2AdjRider,
	A.[Mtg2LoanType] as Mtg2LoanType,
	A.[Mtg2Typefinancing] as Mtg2Typefinancing,
	A.[Mtg2LienPosition] as Mtg2LienPosition,
	A.[Mtg3TransactionId] as Mtg3TransactionId,
	A.[Mtg3LoanAmt] as Mtg3LoanAmt,
	A.[Mtg3Lender] as Mtg3Lender,
	A.[Mtg3Term] as Mtg3Term,
	A.[Mtg3LoanDueDt] as Mtg3LoanDueDt,
	A.[Mtg3AdjRider] as Mtg3AdjRider,
	A.[Mtg3LoanType] as Mtg3LoanType,
	A.[Mtg3Typefinancing] as Mtg3Typefinancing,
	A.[Mtg3LienPosition] as Mtg3LienPosition,
	A.[Mtg4TransactionId] as Mtg4TransactionId,
	A.[Mtg4LoanAmt] as Mtg4LoanAmt,
	A.[Mtg4Lender] as Mtg4Lender,
	A.[Mtg4Term] as Mtg4Term,
	A.[Mtg4LoanDueDt] as Mtg4LoanDueDt,
	A.[Mtg4AdjRider] as Mtg4AdjRider,
	A.[Mtg4LoanType] as Mtg4LoanType,
	A.[Mtg4Typefinancing] as Mtg4Typefinancing,
	A.[Mtg4LienPosition] as Mtg4LienPosition,

	B.Power_FINAL_VALUE AS FirstAmericanCurrentAVM, 

    CASE WHEN isNULL(A.TotalOpenLienAmt,0) = 0 THEN NULL 
		WHEN B.Power_FINAL_VALUE IS NULL THEN NULL 
		WHEN Convert(Money,A.[TotalOpenLienAmt]) / Convert(Money,b.[Power_FINAL_VALUE]) > 1.5 THEN NULL 
		WHEN Convert(Money,A.[TotalOpenLienAmt]) / Convert(Money,b.[Power_FINAL_VALUE]) < 0.004 THEN NULL 
	ELSE CONVERT(numeric(5, 2), Convert(Money,a.TotalOpenLienAmt) / Convert(Money,b.[Power_FINAL_VALUE]) * 100) 
	END AS CLTV,

	A.[VacantFlag] as VacantFlag,
	A.[FATimestamp] as FATimestamp,
	A.[FAUCIDFlag] as FAUCIDFlag,
	A.[FAIsListedFlag] as FAIsListedFlag,
	A.[FAIsListedPriceRange] as FAIsListedPriceRange,
	A.SitusSTDFullStreetAddress as SitusSTDFullStreetAddress,
	A.MailingSTDFullStreetAddress as MailingSTDFullStreetAddress,
	A.Mtg1RecordingDt as Mtg1RecordingDt,
	A.Mtg2RecordingDt as Mtg2RecordingDt,
	A.Mtg3RecordingDt as Mtg3RecordingDt,
	A.Mtg4RecordingDt as Mtg4RecordingDt,
	A.Mtg1InputDocNbr as Mtg1InputDocNbr,
	A.Mtg2InputDocNbr as Mtg2InputDocNbr,
	A.Mtg3InputDocNbr as Mtg3InputDocNbr,
	A.Mtg4InputDocNbr as Mtg4InputDocNbr,
	B.Power_LOW_VALUE as Low_Value,
	B.Power_HIGH_VALUE as High_Value,
	B.Power_CONFIDENCE_SCORE as ConfidenceScore,
	B.Power_FORECAST_STANDARD_DEVIATION as StandardDeviation,
	B.RUN_DATE as VALUATIONDATE,
	A.[VacantFlagDate] as VacantFlagDate,
	A.[FloorCoverCode] as FloorCoverCode,

	-------Added Flood Data for Cartofront KL - 20161103
	C.[CommunityName] as CommunityName,
	C.[CommunityNumber] as CommunityNumber,
	C.[FemaMapNumber] as FemaMapNumber,
	C.[FIRMID] as FIRMID,
	C.[PanelNumber] as PanelNumber,
	C.[InsideSFHA] as InsideSFHA,
	C.[FemaFloodZone] as FemaFloodZone,
	C.[FemaMapDate] as FemaMapDate,

	-----Added for Cartofront per CB 20161107 - KL
	A.BankOwned as BankOwnedFlag, --Case when NonArmTransferTransactionId = '1' then 'Y' else NULL end as BankOwnedFlag,
	A.[ElectricityCode] as ElectricityCode,
	A.SumGroundFloorSqFt as SumGroundFloorSqFt,
	A.OwnerStd1RelationshipType as OwnerStd1RelationshipType,
	A.LotIrregularInd as LotIrregularInd

	-----Added for RedBell  20161121 - KL---
	,A.[SitusGeoStatusCode] as SitusGeoStatusCode

	------Added for REWW 20161123 - KL----
	,A.[CurrSalesPriceCode] as CurrSalesPriceCode
	,A.[PrevSalesPriceCode] as PrevSalesPriceCode

	-----Added for Calise 20170201  - KL ----
	,A.[OwnerStd1CorpName] as OwnerStd1CorpName
	,A.[OwnerStd2CorpName] as OwnerStd2CorpName

	----Added for Compstak 20170202 - JE----
	,A.[Mtg1PrivateLender] as Mtg1PrivateLender
	,A.[Mtg2PrivateLender] as Mtg2PrivateLender
	,A.[Mtg3PrivateLender] as Mtg3PrivateLender
	,A.[Mtg4PrivateLender] as Mtg4PrivateLender

	-----Added for Credify 20170216 - KL---
	,A.[MailingCareOfName] as MailingCareOfName

	---Added for Credify 20170221 - KL----
	,D.[HOA 1- Name] as HOA_1_Name
	,D.[HOA 1 - Type] as HOA_1_Type
	,D.[HOA 1- Fee Value] as HOA_1_Fee_Value
	,D.[HOA 1 - Fee Frequency] as HOA_1_Fee_Frequency
	,D.[HOA 2- Name] as HOA_2_Name
	,D.[HOA 2 - Type] as HOA_2_Type
	,D.[HOA 2- Fee Value] as HOA_2_Fee_Value
	,D.[HOA 2 - Fee Frequency] as HOA_2_Fee_Frequency

	,A.FAIsListedFlagDt as FAIsListedFlagDt

	-----Added for LIVEWELL 20170605 - KL--
	 ,A.[OwnerStd2OwnershipRights] as OwnerStd2OwnershipRights
	 ,A.[OwnerStd2RelationshipType] as OwnerStd2RelationshipType


	 ---Added for RatePlug 20170706 - KL----
	,D.[HOA 3- Fee Value] as HOA_3_Fee_Value
	,D.[HOA 3 - Fee Frequency] as HOA_3_Fee_Frequency
	,D.[HOA 4- Fee Value] as HOA_4_Fee_Value
	,D.[HOA 4 - Fee Frequency] as HOA_4_Fee_Frequency

	---Added for Jovio 20170714 - JE ---
	,A.[FoundationInd] as FoundationType

	---Added for Argenteneo 20170726 KL---
	,A.[Mtg1InterestRate] as Mtg1InterestRate
	,A.[Mtg2InterestRate] as Mtg2InterestRate
	,A.[Mtg3InterestRate] as Mtg3InterestRate
	,A.[Mtg4InterestRate] as Mtg4InterestRate
	,A.[ConCurrMtg1InterestRate] as ConCurrMtg1InterestRate
	,A.[ConCurrMtg2InterestRate] as ConCurrMtg2InterestRate
	,A.[PrevMtg1InterestRate] as PrevMtg1InterestRate

	----Added 20170728 KL---
	,A.[LienPosUpdateDate] as LienPosUpdateDate

	----Added 20171011 KL - for Circle
	,A.[Owner1DoNotParse] as [Owner1DoNotParse]

	----Added 20171012 KL for Bank of America
	,A.[MailForeignAddrInd] as [MailForeignAddrInd]

	----Added 20171229 JE for HDL
	,A.[OldApnIndicator] as [OldApnIndicator]

	----Added 20180510 KL for Realty Share---
	,A.AssesseeStd1Name as [AssesseeStd1Name]
	,A.AssesseeStd2Name as [AssesseeStd2Name]

	----Added 20180522 for Software Incubator----
	,A.FALatitude as FALatitude
	,A.FALongitude as FALongitude
	,A.FAGeoStatusCode as FAGeoStatusCode

	---Added for ATT&T
	,A.StoriesCode as StoriesCode

	-----Added for ADS----
	,A.Mtg1EstLoanBalance as Mtg1EstLoanBalance
	,A.Mtg2EstLoanBalance as Mtg2EstLoanBalance
	,A.Mtg3EstLoanBalance as Mtg3EstLoanBalance
	,A.Mtg4EstLoanBalance as Mtg4EstLoanBalance

	-----Added 20180620 for Consumer Orbit---
	,A.[Mtg1EstPaymentAmt] as Mtg1EstPaymentAmt
	,A.[Mtg2EstPaymentAmt] as Mtg2EstPaymentAmt
	,A.[Mtg3EstPaymentAmt] as Mtg3EstPaymentAmt
	,A.[Mtg4EstPaymentAmt] as Mtg4EstPaymentAmt

	-------Added 20180703 for Elements----
	,A.[FAOwnershipUpdateDt] as FAOwnershipUpdateDt

	------Added 20180709 for SMR--------
	,A.[CountyLandUseDescription] as CountyLandUseDescription

	------Added 20180730 for Connected Investors
	,G.[County Name] as CountyName

	------Added 20180829 for Census---
	,A.[FAEstLotSqFt] as FAEstLotSqFt

	------Added 20180830 for Census---
	,A.SitusCensusBlock as SitusCensusBlock
	
	,A.MarketValueYear as MarketValueYear
	
	,A.AtticSqFt as AtticSqFt
	,A.AtticUnfinSqFt as AtticUnfinSqFt
	,A.AtticFinishSqFt as AtticFinishSqFt
	,A.BasementUnfinSqFt as BasementUnfinSqFt
	,A.BasementFinishSqFt as BasementFinishSqFt
	,A.GarageUnFinSqFt as GarageUnFinSqFt
	,A.GarageFinishSqFt as GarageFinishSqFt
	,A.Amenities as Amenities
	,A.DeckCode as DeckCode
	,A.OtherRooms as OtherRooms
	,A.TopographyCode as TopographyCode
	
	,A.MailingFips as MailingFips
	
	,A.[SitusStdMatchCode] as SitusMatchCode

	----- ADDED PFC info
		,P.[FAActiveInd] as PFCIndicator
		,P.[ReleaseReason] as PFCReleaseReason
		,P.[TransactionID] as PFCTransactionID
		,P.[RecordingDt] as PFCRecordingDate
		,P.[DocumentType] as PFCDocumentType
		,Case WHEN P.[FAActiveInd] in(1,2,3) THEN 'Y' ELSE NULL END as PFCFlag

	---- ADDED Basement Finish
	,A.[BasementFinishedCode] as BasementFinishCode

	--------Added weighted AVM 20190618-------
	,b.Power_FORECAST_STANDARD_DEVIATION as weighted_avm_fsd

	--------- ADDED 20190619
	,a.[BathHalf]
	,a.[ApprLandValue]
	,a.[ApprImprovementValue]
	,a.[ApprTotalValue]
	,a.[TaxValueLand]
	,a.[TaxValueImprovement]
	,a.[TaxTotalValue]

	-------------Added 20190619-----
	,A.[FARooftopLatitude]
    ,A.[FARooftopLongitude]

	------20250107 - Changed [FAGeoStatusCode] from Parcels to P per BR
	,coalesce(A.[FARooftopLatitude],case when A.[FAGeoStatusCode] like 'P' then A.[FALatitude] else NULL End ,A.TPLatitude,A.[SitusLatitude])  as Cascaded_Latitude
    ,coalesce(A.[FARooftopLongitude],case when A.[FAGeoStatusCode] like 'P' then A.[FALongitude] else NULL END,A.TPLongitude,A.[SitusLongitude]) as Cascaded_Longitude
    
	,case 
		when coalesce(A.[FARooftopLatitude],case when A.[FAGeoStatusCode] like 'P' then A.[FALatitude] else NULL End ,A.TPLatitude,A.[SitusLatitude]) 
		= A.[FARooftopLatitude] then 'R'
		when coalesce(A.[FARooftopLatitude],case when A.[FAGeoStatusCode] like 'P' then A.[FALatitude] else NULL End ,A.TPLatitude,A.[SitusLatitude]) 
		= A.[FALatitude] then 'P'
		when coalesce(A.[FARooftopLatitude],case when A.[FAGeoStatusCode] like 'P' then A.[FALatitude] else NULL End ,A.TPLatitude,A.[SitusLatitude])
		= A.[TPLatitude] then 'P'
		when coalesce(A.[FARooftopLatitude],case when A.[FAGeoStatusCode] like 'P' then A.[FALatitude] else NULL End ,A.TPLatitude,A.[SitusLatitude])
		= A.[SitusLatitude] then A.[SitusGeoStatusCode]
		else NULL end
		as Cascaded_SitusGeoStatusCode


	,A.OwnerStdNAME3FULL 
	,A.OwnerStdNAME4FULL

	,A.OwnerStd3OwnershipRights
	,A.OwnerStd3RelationshipType
	,A.OwnerStd4OwnershipRights
	,A.OwnerStd4RelationshipType

	----Added 20190715------
	,A.[VacantScore] as VacantScore

	-----Added 20190913---
	,D.[HOA1 Contact Confidence Score]  as [HOA1 Contact Confidence Score]
	,D.[HOA1 Fee Confidence Score]  as [HOA1 Fee Confidence Score]
	,D.[HOA2 Contact Confidence Score]  as [HOA2 Contact Confidence Score]
	,D.[HOA2 Fee Confidence Score]  as [HOA2 Fee Confidence Score]
	
	-----Added 20191012 ---
	,A.[BuildingEstFootprintSqFt]
	,A.[LotUsableSize]

	----- Added 20191107 -----
	,A.DTDB_REF_ID as DTDB_REFID
	,A.DTDB_FORMATTED_APN as DTDB_FormattedAPN

	----Added 20191111---
	,A.[DQOZ_TractType]

	-----Added 20200117---	
	,A.[HouseFacingDirection] as [EstimatedHouseFacing]
	,A.[LotUsableSize] as [EstimatedUsableLotSize]
	,A.[BuildingEstFootprintSqFt] as [EstimatedBuildingFootprintSQFT]
	,A.[BathTotalCalcEst] as [EstimatedBathRooms]
	,A.[BedroomsEst] as [EstimatedBedRooms]
	,A.[DQOZ_TractType] as [OpportunityZone]
	,A.[DQOZ_ACSDataSource] as [OpportunityZoneSource]

	----Added 20200203 per BR--
	,A.[NeighborhoodCode] as [NeighborhoodCode]

	-----Added 20200221---
	,D.[HOA 3- Name] as HOA_3_Name
	,D.[HOA 4- Name] as HOA_4_Name


	----Added 20200511----
	,M.[County Name] as MailingCountyName
	,G.CBSACode as CBSACode
	,G.CBSAName as CBSAName

	-----Added 20200818----
	,G.[MaxDeedSaleRecordingDate] as [MaxDeedSaleRecordingDate]

	-----Added 20200827---
	,G.CertificationDate as CertificationDate
	,G.EditionNumber as EditionNumber

	-----Added 20200908----
	,A.[Mtg1InputBook]
    ,A.[Mtg1InputPage]
	,A.[Mtg2InputBook]
    ,A.[Mtg2InputPage]
	,A.[Mtg3InputBook]
    ,A.[Mtg3InputPage]
	,A.[Mtg4InputBook]
    ,A.[Mtg4InputPage]

	,A.[Mtg1FormatBook]
    ,A.[Mtg1FormatPage]
	,A.[Mtg2FormatBook]
    ,A.[Mtg2FormatPage]
	,A.[Mtg3FormatBook]
    ,A.[Mtg3FormatPage]
	,A.[Mtg4FormatBook]
    ,A.[Mtg4FormatPage]

	,A.Mtg1FormatDocNbr
	,A.Mtg2FormatDocNbr
	,A.Mtg3FormatDocNbr
	,A.Mtg4FormatDocNbr
	,A.FAOwnerTransactionID
	,A.FADateReceived

	------Added 20201028 per BR--
	
	,A.[FASubdivisionNameID]
	,A.[FASubdivisionName]
	,A.[FAComplexNbrUnits]

	-----Added 20201113 per BR
	,A.[FASubdivisionPhase]

	-----Added 20210316 per BR for Experian One Off
	,A.FAUserID as FAUserID
 
	----Added 20210421 for Experian
	,A.FAEstimatedMultiPolygonFlag as [FAEstimatedBuildingPolygonFlag]
	,A.FAEstimatedNumberofBuildings as [FAEstimatedNumberofBuildings]
	,A.Poverty as [Poverty]
	,A.UnEmployment as [UnEmployment]
	,A.PopulationLoss as [PopulationLoss]
	,A.RemoteRural as [RemoteRural]
	,A.Distressed as [Distressed]
	,A.UnderServed as [UnderServed]

	,A.BuildingEstFootprintSqFt as [FAEstimatedBuildingSQFT]

	---Added 20210427---
	,A.MailingStdMatchCode
	,A.DTDB_UNFORMATTED_APN 

	-----Added 20211222 - 
	,D.FARecordType as HOA_FARecordType

	-----Added 20211222
	,A.ConformingLoanLimitYear as [Conforming Limit Year]
	,A.ConformingLoanLimit as [Conforming Loan Limit]
	,A.PriorConformingLoanLimitYear as [Prior Conforming Limit Year]
	,A.PriorConformingLoanLimit as [Prior Conforming Loan Limit]

	-----Added 20220721
	,A.CS_FORMATTED_APN
	,A.CS_UNFORMATTED_APN

	----Added 20220822
	,A.[CalifHomeownerInd]

	-----20221108 - Added KL
	,A.TaxExemptionCode
	,A.TaxYear as AssrTaxYear
	,A.TaxAmount as AssrTaxAmount

	----Added 20230502--
	,A.TaxDeliquentValue1 as TaxDelinquentValue1

	----Added 20230515--
	,A.[OwnerSTD3CorpInd] as [Owner3CorpInd]
	,A.[OwnerSTD3LastName] as [Owner3LastName]
	,A.[OwnerSTD3FirstName] as [Owner3FirstName]
	,A.[OwnerSTD3MiddleName] as [Owner3MiddleName]
	,A.[OwnerSTD3Suffix] as [Owner3Suffix]
	,A.[OwnerSTD4CorpInd] as [Owner4CorpInd]
	,A.[OwnerSTD4LastName] as [Owner4LastName]
	,A.[OwnerSTD4FirstName] as [Owner4FirstName]
	,A.[OwnerSTD4MiddleName] as [Owner4MiddleName]
	,A.[OwnerSTD4Suffix] as [Owner4Suffix]
	,A.[OwnerSTDNAME3FULL] as [OwnerNAME3FULL]
	,A.[OwnerSTDNAME4FULL] as [OwnerNAME4FULL]

	----Added 20230626--
	,A.LegalRange
	,A.LegalTownship
	,A.LegalQuarter
	,A.LegalQuarterQuarter
	,A.FoundationInd
	,A.ElevatorCode

	-----Added 20230713
	,CASE WHEN (CAST((isNULL(convert(bigint,[Mtg1EstLoanBalance]),0) + isNULL(convert(bigint,[Mtg2EstLoanBalance]),0) 
		+ isNULL(convert(bigint,[Mtg3EstLoanBalance]),0) + isNULL(convert(bigint,[Mtg4EstLoanBalance]),0)) AS bigint)) = 0 THEN NULL 
	WHEN B.[Power_FINAL_VALUE] IS NULL THEN NULL 
	WHEN (CAST((isNULL(convert(bigint,[Mtg1EstLoanBalance]),0) + isNULL(convert(bigint,[Mtg2EstLoanBalance]),0) + isNULL(convert(bigint,[Mtg3EstLoanBalance]),0) + isNULL(convert(bigint,[Mtg4EstLoanBalance]),0)) AS bigint) / B.[Power_FINAL_VALUE]) > 1.5 THEN NULL 
	WHEN (CAST((isNULL(convert(bigint,[Mtg1EstLoanBalance]),0) + isNULL(convert(bigint,[Mtg2EstLoanBalance]),0) + isNULL(convert(bigint,[Mtg3EstLoanBalance]),0) + isNULL(convert(bigint,[Mtg4EstLoanBalance]),0)) AS bigint) / B.[Power_FINAL_VALUE]) < 0.004 THEN NULL 
	ELSE CONVERT(numeric(5, 2), (CAST((isNULL([Mtg1EstLoanBalance],0) + isNULL([Mtg2EstLoanBalance],0) + isNULL([Mtg3EstLoanBalance],0) 
	+ isNULL([Mtg4EstLoanBalance],0)) AS bigint) / B.[Power_FINAL_VALUE]) * 100) 
	END as CBLTV

FROM [Data].dbo.[Property] as A with(NOLOCK) 
	
	JOIN [Global].dbo.[County] as G with(NOLOCK) 
		on A.FIPS = G.FIPSCODE
	
	LEFT OUTER JOIN [Holocron].dbo.[Holocron] as B with(NOLOCK)
		on --A.FIPS = B.FIPS and 
			A.PropertyID = B.PropertyID

	LEFT OUTER JOIN [FEMA].dbo.[LicFlood] as C with(NOLOCK)   --Changed From FAFlood on 20250826
		on A.PropertyID = C.PropertyID

	LEFT OUTER JOIN [Data].[dbo].[Foreclosure_AssrLink] as P  with(NOLOCK)
		on --a.FIPS = p.FIPS and 
			a.PropertyID = p.FAPropertyID

	LEFT OUTER JOIN [Data].dbo.[HOA_Fulfillment] as D with(NOLOCK)
		on --a.FIPS = d.FIPS and 
			  A.PropertyID = D.PropertyID
	
	LEFT OUTER JOIN [Global].dbo.[County] as M with(NOLOCK) 
		on A.MailingFIPS = M.FIPSCODE

	--LEFT OUTER JOIN [Data].[dbo].[PrevValue] as E with(NOLOCK)
	--on A.FIPS = E.FIPS
	--and A.PropertyID = E.PropertyID
	
	--LEFT OUTER JOIN [Data].[dbo].[PrevTax] as F with(NOLOCK)
	--on A.FIPS = F.FIPS
	--and A.PropertyID = F.PropertyID




GRANT SELECT ON [dbo].[vAssessor_PREMIUM_NEW_Power] TO [CORP\cbrady] AS [dbo]
