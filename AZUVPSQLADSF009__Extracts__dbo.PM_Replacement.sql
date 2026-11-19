SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

 create view [dbo].[PM_Replacement] 
 as
	Select above_grade_finished_area as AboveGradeFinishedArea
		,[address] as Address
		,appliances as Appliances
		,style as ArchitecturalStyle
		,garage_description as AttachedGarageYN
		,basement_description as Basement
		,bathrooms_full as BathroomsFull
		,bathrooms_half as BathroomsHalf
		,bathrooms_quarter as BathroomsOneQuarter
		,bathrooms_partial as BathroomsPartial
		,bathrooms_three_quarter as BathroomsThreeQuarter
		,bathrooms as BathroomsTotalInteger
		,bedrooms as BedroomsTotal
		,below_grade_finished_area as BelowGradeFinishedArea
		,NULL  as BuildingAreaTotal
		,interior_features,security_features,door_features as BuildingFeatures
		,parking_description as CarportYN
		,City as City
		,coalesce(sold_date,close_date) as CloseDate
		,sold_price as ClosePrice
		,NULL as CommonWalls
		,construction_materials as ConstructionMaterials
		,air_conditioning as Cooling
		,Case when air_conditioning is not null then 'Y' Else NULL END  as CoolingYN
		,county as CountyOrParish
		,parking_spaces as CoveredSpaces
		,cumulative_days_on_market as CumulativeDaysOnMarket
		,days_on_market as DaysOnMarket
		,fence_description as Fencing
		,fireplaces as FireplacesTotal
		,flooring_information as Flooring
		,NULL as FoundationDetails
		,garage_spaces as GarageSpaces
		,has_garage as GarageYN
		,heat_type as Heating
		,CASE WHEN heat_type is not null then 'Y' ELSE NULL END as HeatingYN
		,photo_count as ImageCount
		,NULL as ImageUrl
		,NULL as Levels
		,mls_list_date as ListingContractDate
		,mls_listing_id as ListingId
		,price as ListPrice
		,finished_area as LivingArea
		,lot_description as LotFeatures
		,CASE WHEN lot_size_units like 'AC' THEN lot_size_area END as LotSizeAcres
		,lot_size_area as LotSizeArea
		,lot_dimension as LotSizeDimensions
		,lot_size_square_feet as LotSizeSquareFeet
		,NULL as MainLevelBathrooms
		,master_bedroom_level as MainLevelBedrooms
		,is_model as Model
		,is_new_construction as NewConstructionYN
		,off_market_date as OffMarketDate
		,on_market_date as OnMarketDate
		,parking_spaces as OpenParkingSpaces
		,CASE WHEN parking_description like '%OPEN%' THEN 'Y' END as OpenParkingYN
		,original_listing_price as OriginalListPrice
		,parcel_number as ParcelNumber
		,parking_description as ParkingFeatures
		,parking_spaces as ParkingTotal
		,patio_and_porch_features as PatioAndPorchFeatures
		,pending_date as PendingTimestamp
		,photo_count as PhotosCount
		,pool_description as PoolFeatures
		,CASE WHEN pool_description like '%private%' THEN 'Y' END as PoolPrivateYN
		,original_listing_price as PreviousListPrice
		,price_change_date as PriceChangeTimestamp
		,price_per_square_foot as PriceperSquareFeet
		,NULL as PropertyAttachedYN
		,condition as PropertyCondition
		,mls_property_sub_type as PropertySubType
		,mls_property_type as PropertyType
		,contract_date as PurchaseContractDate
		,roofing as Roof
		,rooms as RoomsTotal
		,CASE WHEN pool_description like '%spa%' THEN 'Y' END as SpaYN
		,[Status] as StandardStatus
		,[state] as StateOrProvince
		,stories_description as Stories
		,stories_total as StoriesTotal
		,subdivision as SubdivisionName
		,[address] as UnparsedAddress
		,[property_view_description] as [View]
		,has_view as ViewYN
		,waterfront_description as WaterfrontFeatures
		,has_waterfront as WaterfrontYN
		,withdrawn_date as WithdrawnDate
		,year_built as YearBuilt
		,year_built_source as YearBuiltDetails
		,NULL as YearBuiltEffective
		,zoning_description as Zoning
	FROM src_platlabs.listing.listingsRaw

