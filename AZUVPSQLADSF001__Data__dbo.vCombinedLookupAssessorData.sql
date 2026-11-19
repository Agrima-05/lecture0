SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE VIEW [dbo].[vCombinedLookupAssessorData]
AS
Select DISTINCT cast([FIPSCode] as varchar) as TypeID,[County Name] + ', '+ [State] as CodeDesc, 'Fipscode' as FieldName from [Global].dbo.County
UNION ALL
Select DISTINCT cast([BKFSCode] as varchar) as TypeID,CodeDesc, 'LandUseCode' as FieldName from [Global].dbo.lkup_STD_LUSE
UNION ALL
Select DISTINCT cast([GeoStatusCodeID] as varchar) as TypeID,CodeDesc, 'SitusGeoStatusCode' as FieldName from [Global].[dbo].[lkup_Geo_Status_Code]
UNION ALL
Select DISTINCT cast([PropClass] as varchar) as TypeID,CodeDesc, 'PropertyClassID' as FieldName from [Global].[dbo].[lkup_Property_Class]
UNION ALL
Select DISTINCT cast([BKFSCode] as varchar) as TypeID,CodeDesc, 'OwnerOccupied' as FieldName from [Global].[dbo].[lkup_Owner_Occupied]
UNION ALL
Select DISTINCT cast([BKFSCode] as varchar) as TypeID,CodeDesc, 'Owner1OwnershipRights' as FieldName from [Global].[dbo].[lkup_Assessee_Vesting]
UNION ALL
Select DISTINCT cast([AcCodeId] as varchar) as TypeID,CodeDesc, 'AirConditioningCode' as FieldName from [Global].[dbo].[lkup_Air_Condition]
UNION ALL
Select DISTINCT cast([BKFSCode] as varchar) as TypeID,CodeDesc, 'Amenities' as FieldName from [Global].[dbo].[lkup_Amenities]
UNION ALL
Select DISTINCT cast([BasementId] as varchar) as TypeID,CodeDesc, 'BasementCode' as FieldName from [Global].[dbo].[lkup_Basement]
UNION ALL
Select DISTINCT cast([BldgClsId] as varchar) as TypeID,CodeDesc, 'BuildingClassCode' as FieldName from [Global].[dbo].[lkup_Building_Class]
UNION ALL
Select DISTINCT cast([BldgCondId] as varchar) as TypeID,CodeDesc, 'BuildingConditionCode' as FieldName from [Global].[dbo].[lkup_Building_Condition]
UNION ALL
Select DISTINCT cast([ConstructionTypeId] as varchar) as TypeID,CodeDesc, 'ConstructionTypeCode' as FieldName from [Global].[dbo].[lkup_Construction_Type]
UNION ALL
Select DISTINCT cast([ExteriorWallId] as varchar) as TypeID,CodeDesc, 'ExteriorWallsCode' as FieldName from [Global].[dbo].[lkup_Exterior_Wall]
UNION ALL
Select DISTINCT cast([InteriorWallId] as varchar) as TypeID,CodeDesc, 'InteriorWallsCode' as FieldName from [Global].[dbo].[lkup_Interior_Wall]
UNION ALL
Select DISTINCT cast([FloorCoverId] as varchar) as TypeID,CodeDesc, 'FloorCoverCode' as FieldName from [Global].[dbo].[lkup_Floor_Cover]
UNION ALL
Select DISTINCT cast([GarageParkingId] as varchar) as TypeID,CodeDesc, 'Garage' as FieldName from [Global].[dbo].[lkup_Garage_Parking_Type]
UNION ALL
Select DISTINCT cast([HeatingId] as varchar) as TypeID,CodeDesc, 'HeatCode' as FieldName from [Global].[dbo].[lkup_Heating]
UNION ALL
Select DISTINCT cast([HeatingFuelId] as varchar) as TypeID,CodeDesc, 'HeatingFuelTypeCode' as FieldName from [Global].[dbo].[lkup_Heating_Fuel_Type]
UNION ALL
Select DISTINCT cast([SiteInfluenceId] as varchar) as TypeID,CodeDesc, 'SiteInfluenceCode' as FieldName from [Global].[dbo].[lkup_Site_Influence]
UNION ALL
Select DISTINCT cast([DrivewayCode] as varchar) as TypeID,CodeDesc, 'DrivewayCode' as FieldName from [Global].[dbo].[lkup_Driveway]
UNION ALL
Select DISTINCT cast([OtherRoomsId] as varchar) as TypeID,CodeDesc, 'OtherRooms' as FieldName from [Global].[dbo].[lkup_other_rooms]
UNION ALL
Select DISTINCT cast([Patio_Id] as varchar) as TypeID,CodeDesc, 'PatioCode' as FieldName from [Global].[dbo].[lkup_Patio]
UNION ALL
Select DISTINCT cast([PoolId] as varchar) as TypeID,CodeDesc, 'PoolCode' as FieldName from [Global].[dbo].[lkup_Pool]
UNION ALL
Select DISTINCT cast([PorchId] as varchar) as TypeID,CodeDesc, 'PorchCode' as FieldName from [Global].[dbo].[lkup_Porch]
UNION ALL
Select DISTINCT cast([BldgQtyId] as varchar) as TypeID,CodeDesc, 'BuildingQualityCode' as FieldName from [Global].[dbo].[lkup_Building_Quality]
UNION ALL
Select DISTINCT cast([RoofCoverId] as varchar) as TypeID,CodeDesc, 'RoofCoverCode' as FieldName from [Global].[dbo].[lkup_Roof_Cover]
UNION ALL
Select DISTINCT cast([RoofId] as varchar) as TypeID,CodeDesc, 'RoofTypeCode' as FieldName from [Global].[dbo].[lkup_Roof_Type]
UNION ALL
Select DISTINCT cast([SewerId] as varchar) as TypeID,CodeDesc, 'SewerCode' as FieldName from [Global].[dbo].[lkup_Sewer]
UNION ALL
Select DISTINCT cast([StoriesId] as varchar) as TypeID,CodeDesc, 'StoriesNbrCode' as FieldName from [Global].dbo.[lkup_StoriesNbrCode_FA]
UNION ALL
Select DISTINCT cast([StyleId] as varchar) as TypeID,CodeDesc, 'StyleCode' as FieldName from [Global].[dbo].[lkup_Style]
UNION ALL
Select DISTINCT cast([TopographyId] as varchar) as TypeID,CodeDesc, 'TopographyCode' as FieldName from [Global].[dbo].[lkup_Topography]
UNION ALL
Select DISTINCT cast([WaterId] as varchar) as TypeID,CodeDesc, 'WaterCode' as FieldName from [Global].[dbo].[lkup_Water]
UNION ALL
Select DISTINCT cast([LegalLotID] as varchar) as TypeID,CodeDesc, 'LotCode' as FieldName from [Global].[dbo].[lkup_Legal_Lot]
UNION ALL
Select DISTINCT cast([DocTypeID] as varchar) as TypeID,CodeDesc, 'CurrentSaleDocumentType' as FieldName from [Global].[dbo].[lkup_Doc_Type_AD]
UNION ALL
Select DISTINCT cast([SalePriceCodeID] as varchar) as TypeID,CodeDesc, 'CurrentSalesPriceCode' as FieldName from [Global].[dbo].[lkup_Sale_Price_Code]
UNION ALL
Select DISTINCT cast([SalePriceCodeID] as varchar) as TypeID,CodeDesc, 'PrevSalesPriceCode' as FieldName from [Global].[dbo].[lkup_Sale_Price_Code]
UNION ALL
Select DISTINCT cast([LoanTypeID] as varchar) as TypeID,CodeDesc, 'ConcurrentMtg1LoanType' as FieldName from [Global].[dbo].[lkup_Loan_Type]
UNION ALL
Select DISTINCT cast([TypeFinId] as varchar) as TypeID,CodeDesc, 'ConcurrentMtg1TypeFinancing' as FieldName from [Global].[dbo].[lkup_Type_Fin]
UNION ALL
Select DISTINCT cast([LoanTypeID] as varchar) as TypeID,CodeDesc, 'ConcurrentMtg2LoanType' as FieldName from [Global].[dbo].[lkup_Loan_Type]
UNION ALL
Select DISTINCT cast([TypeFinId] as varchar) as TypeID,CodeDesc, 'ConcurrentMtg2TypeFinancing' as FieldName from [Global].[dbo].[lkup_Type_Fin]
UNION ALL
Select DISTINCT cast([LoanTypeID] as varchar) as TypeID,CodeDesc, 'PrevMtg1LoanType' as FieldName from [Global].[dbo].[lkup_Loan_Type]
UNION ALL
Select DISTINCT cast([TypeFinId] as varchar) as TypeID,CodeDesc, 'PrevMtg1TypeFinancing' as FieldName from [Global].[dbo].[lkup_Type_Fin]
UNION ALL
Select DISTINCT cast([LoanTypeID] as varchar) as TypeID,CodeDesc, 'Mtg1LoanType' as FieldName from [Global].[dbo].[lkup_Loan_Type]
UNION ALL
Select DISTINCT cast([TypeFinId] as varchar) as TypeID,CodeDesc, 'Mtg1TypeFinancing' as FieldName from [Global].[dbo].[lkup_Type_Fin]
UNION ALL
Select DISTINCT cast([LoanTypeID] as varchar) as TypeID,CodeDesc, 'Mtg2LoanType' as FieldName from [Global].[dbo].[lkup_Loan_Type]
UNION ALL
Select DISTINCT cast([TypeFinId] as varchar) as TypeID,CodeDesc, 'Mtg2TypeFinancing' as FieldName from [Global].[dbo].[lkup_Type_Fin]
UNION ALL
Select DISTINCT cast([LoanTypeID] as varchar) as TypeID,CodeDesc, 'Mtg3LoanType' as FieldName from [Global].[dbo].[lkup_Loan_Type]
UNION ALL
Select DISTINCT cast([TypeFinId] as varchar) as TypeID,CodeDesc, 'Mtg3TypeFinancing' as FieldName from [Global].[dbo].[lkup_Type_Fin]
UNION ALL
Select DISTINCT cast([LoanTypeID] as varchar) as TypeID,CodeDesc, 'Mtg4LoanType' as FieldName from [Global].[dbo].[lkup_Loan_Type]
UNION ALL
Select DISTINCT cast([TypeFinId] as varchar) as TypeID,CodeDesc, 'Mtg4TypeFinancing' as FieldName from [Global].[dbo].[lkup_Type_Fin]
UNION ALL
Select DISTINCT cast([SourceInd] as varchar) as TypeID,CodeDesc, 'VacantFlag' as FieldName from [Global].[dbo].[lkup_Vacancy]



GRANT SELECT ON [dbo].[vCombinedLookupAssessorData] TO [CORP\cbrady] AS [dbo]
