SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[v_ListingData_Cit_TEST_NEW]
AS
SELECT  [PropertyAddress]		 AS 	[Property Address]
,	[PropertyCity]		 AS 	[Property City]
,	[PropertyState]		 AS 	[Property State]
,	[PropertyZip]		 AS 	[Property Zip]
,	[PropertyZip4]		 AS 	[Property Zip + 4]
,	[AssessorsParcelIdentificationNumber] 		 AS 	[Assessor's Parcel Identification Number]
,	[CountyFIPS]		 AS 	[County FIPS]
,	[InternalFAPropertyRefID] 		 AS 	[Internal FA Property Ref ID]
,	[PropertyType]		 AS 	[Property Type]
,	[PropertySubType]		 AS 	[Property Sub-Type]
,	[LotSizeSqFt]		 AS 	[Lot Size (Sq Ft)]
,	[HomeSizeSqFt]		 AS 	[Home Size (Sq Ft)]
,	[HomeBuildingStyle]		 AS 	[Home or Building Style]
,	[HeatingType]		 AS 	[Heating Type]
,	[HeatingFuelType]		 AS 	[Heating Fuel Type]
,	[CoolingType]		 AS 	[Cooling Type]
,	[CoolingFuelType]		 AS 	[Cooling Fuel Type]
,	[NumberStories]		 AS 	[Number of Stories]
,	[YearBuilt]		 AS 	[Year Built]
,	[RoofType]		 AS 	[Roof Type]
,	[ExteriorConstruction]		 AS 	[Exterior Construction]
,	[NumberBedrooms]		 AS 	[Number of Bedrooms]
,	[NumberBathrooms]		 AS 	[Number of Bathrooms]
,	[NumberGarages]		 AS 	 [Number of Garages]
,	[GarageType]		 AS 	[Garage Type]
,	[PoolFeatures]		 AS 	[Pool Features]
,	[ViewFeatures]		 AS 	[View Features]


,	[FAInitialListDate]		 AS 	[FA Initial List Date]
,	[FACalculatedDaysOnMarket]		 AS 	[FA Calculated Days on Market]
,	[CurrentOriginalListingDate]		 AS 	[Current Original Listing Date]
,	[InitialListStatus]		 AS 	[Initial List Status]
,	[ListingNumber]		 AS 	[Listing Number]
,	[Status]		 AS 	[Status]

,	[CurrentListingPrice]		 AS 	[Current Listing Price]
,	[MaxListPrice]		 AS 	[Max List Price]
,	[MaxListPriceDate]		 AS 	[Max List Price Date]
,	[MinListPrice]		 AS 	[Min List Price]
,	[MinListPriceDate]		 AS 	[Min List Price Date]
,	[SoldPrice]		 AS 	[Sold Price]

,	[FAAdjustedSoldPrice]		 AS 	[FA Adjusted Sold Price]
,	[FASoldPriceRange]		 AS 	[FA Sold Price Range]
,	[LastListingPriceChangeAmount]		 AS 	[Last Listing Price Change Amount]
,	[LastListingPriceChangeDate]		 AS 	[Last Listing Price Change Date]
,	[PriorListingPriceChangeAmount]		 AS 	[Prior Listing Price Change Amount]
,	[PriorListingPriceChangeDate]		 AS 	[Prior Listing Price Change Date]
,	[LastListingStatusChange]		 AS 	[Last Listing Status Change]
,	[LastListingStatusChangeDate]		 AS 	[Last Listing Status Change Date]

,	[PriorListingStatusChange]		 AS 	[Prior Listing Status Change]
,	[PriorListingStatusChangeDate]		 AS 	[Prior Listing Status Change Date]

,	[FAUniqueListingIdentifierRefID]		 AS 	[FA Unique Listing Identifier - Ref ID]
,	[UpdateTimestamp]		 AS 	[Update Timestamp]
,	[AddChangeDeleteIndicator]	AS 	[Add, Change, Delete Indicator]


,   [StatusSubType]  AS  [Status Sub Type]
,   [RentalIndicator] AS [Rental Indicator]
,	[SoldDate] AS [Sold Date]
,	[LastListingStatusSubTypeChange] AS [Last Listing Status Sub Type Change]
,	[LastListingStatusSubTypeChangeDate] AS [Last Listing Status Sub Type Change Date]
,	[PriorListingStatusSubTypeChange] as [Prior Listing Status Sub Type Change]
,	[PriorListingStatusSubTypeChangeDate] As [Prior Listing Status Sub Type Change Date]
,	[ListingTrackingID] as [Listing Tracking ID]
,[ListingAgentLicenseNumber] AS [ListingAgentLicenseNumber]
,[ListingAgentName] AS [ListingAgentName]
,[ListingAgentAddress] AS [ListingAgentAddress]
,[ListingAgentPhone] AS [ListingAgentPhone]
,[ListingAgentEmail] AS [ListingAgentEmail]
,[OfficeName] AS [OfficeName]
,[OfficeAddress] AS [OfficeAddress]
,[OfficePhone] AS [OfficePhone]
,[OfficeEmail] AS [OfficeEmail]
,[Price per Square Feet] AS [Price per Square Feet]
,[Porch] AS [Porch]
,[Patio] AS [Patio]
,[Deck] AS [Deck]
,[Basement] AS [Basement]
,[Air Conditioner] AS [Air Conditioner]
,[Number of Fireplaces] AS [Number of Fireplaces]
,[Presence of Fireplace] AS [Presence of Fireplace]
,[Fireplace Description] AS [Fireplace Description]
,[Interior Features] AS [Interior Features]
,[Exterior Features] AS [Exterior Features]
,[Existing Structures] AS [Existing Structures]
,[Property Details] AS [Property Details]
,[Lot Features] AS [Lot Features]
,[Zoning] AS [Zoning]
,[Neighborhood] AS [Neighborhood]
,[School District] AS [School District]
,[Elementary School] AS [Elementary School]
,[Middle School] AS [Middle School]
,[High School] AS [High School]
,[Appliances] AS [Appliances]
,[Approximate Lot Dimensions] AS [Approximate Lot Dimensions]
,[Topogrophy] AS [Topogrophy]
,[Waterfront Features] AS [Waterfront Features]
,[Water] AS [Water]
,[Water Source] AS [Water Source]
,[Water Amenities] AS [Water Amenities]
,[Water Access] AS [Water Access]
,[Water Heater] AS [Water Heater]



  FROM [dbo].[zCust_Citizens_Listing_Header_NEW_3]

UNION ALL

SELECT [PropertyAddress]		 AS 	[Property Address]
,	[PropertyCity]		 AS 	[Property City]
,	[PropertyState]		 AS 	[Property State]
,	[PropertyZip]		 AS 	[Property Zip]
,	[PropertyZip4]		 AS 	[Property Zip + 4]
,	[PM_APN] 		 AS 	[Assessor's Parcel Identification Number]
,	convert(Varchar(5),[CountyFIPS])		 AS 	[County FIPS]
,	convert(varchar(25),[PM_PropertyID]) 		 AS 	[Internal FA Property Ref ID]
,	convert(varchar(30),[PropertyType])		 AS 	[Property Type]
,	convert(varchar(30),[PropertySubType])		 AS 	[Property Sub-Type]
,	[LotSizeSqFt]		 AS 	[Lot Size (Sq Ft)]
,	[HomeSizeSqFt]		 AS 	[Home Size (Sq Ft)]
,	convert(varchar(1024),[HomeBuildingStyle])		 AS 	[Home or Building Style]
,	convert(varchar(1024),[HeatingType])		 AS 	[Heating Type]
,	convert(varchar(1024),[HeatingFuelType])		 AS 	[Heating Fuel Type]
,	convert(varchar(1024),[CoolingType])		 AS 	[Cooling Type]
,	convert(varchar(1024),[CoolingFuelType])		 AS 	[Cooling Fuel Type]
,	convert(varchar(1024),[NumberStories])		 AS 	[Number of Stories]
,	[YearBuilt]		 AS 	[Year Built]
,	convert(varchar(1024),[RoofType])		 AS 	[Roof Type]
,	convert(varchar(1024),[ExteriorConstruction])		 AS 	[Exterior Construction]
,	[NumberBedrooms]		 AS 	[Number of Bedrooms]
,	[NumberBathrooms]		 AS 	[Number of Bathrooms]
,	convert(varchar(1024),[NumberGarages])		 AS 	 [Number of Garages]
,	convert(varchar(1024),[GarageType])		 AS 	[Garage Type]
,	convert(varchar(1024),[PoolFeatures])		 AS 	[Pool Features]
,	convert(varchar(1024),[ViewFeatures])		 AS 	[View Features]


,	[FAInitialListDate]		 AS 	[FA Initial List Date]
,	[FACalculatedDaysOnMarket]		 AS 	[FA Calculated Days on Market]
,	[CurrentOriginalListingDate]		 AS 	[Current Original Listing Date]
,	[InitialListStatus]		 AS 	[Initial List Status]
,	[ListingNumber]		 AS 	[Listing Number]
,	[Status]		 AS 	[Status]

,	[CurrentListingPrice]		 AS 	[Current Listing Price]
,	[MaxListPrice]		 AS 	[Max List Price]
,	[MaxListPriceDate]		 AS 	[Max List Price Date]
,	[MinListPrice]		 AS 	[Min List Price]
,	[MinListPriceDate]		 AS 	[Min List Price Date]
,	[SoldPrice]		 AS 	[Sold Price]

,	[FAAdjustedSoldPrice]		 AS 	[FA Adjusted Sold Price]
,	[FASoldPriceRange]		 AS 	[FA Sold Price Range]
,	[LastListingPriceChangeAmount]		 AS 	[Last Listing Price Change Amount]
,	[LastListingPriceChangeDate]		 AS 	[Last Listing Price Change Date]
,	[PriorListingPriceChangeAmount]		 AS 	[Prior Listing Price Change Amount]
,	[PriorListingPriceChangeDate]		 AS 	[Prior Listing Price Change Date]
,	[LastListingStatusChange]		 AS 	[Last Listing Status Change]
,	[LastListingStatusChangeDate]		 AS 	[Last Listing Status Change Date]



,	[PriorListingStatusChange]		 AS 	[Prior Listing Status Change]
,	[PriorListingStatusChangeDate]		 AS 	[Prior Listing Status Change Date]


,	[FAUniqueListingIdentifierRefID]		 AS 	[FA Unique Listing Identifier - Ref ID]
,	convert(varchar(25),[UpdateTimestamp],121)		 AS 	[Update Timestamp]
,	[AddChangeDeleteIndicator]	AS 	[Add, Change, Delete Indicator]

,   [StatusSubType]  AS  [Status Sub Type]
,   [RentalIndicator] AS [Rental Indicator]
,	[SoldDate] AS [Sold Date]
,	[LastListingStatusSubTypeChange] AS [Last Listing Status Sub Type Change]
,	[LastListingStatusSubTypeChangeDate] AS [Last Listing Status Sub Type Change Date]
,	[PriorListingStatusSubTypeChange] as [Prior Listing Status Sub Type Change]
,	[PriorListingStatusSubTypeChangeDate] As [Prior Listing Status Sub Type Change Date]
,	[ListingTrackingID] as [Listing Tracking ID]
,	[Listing Agent License Number] AS 	[ListingAgentLicenseNumber]
,	[Listing Agent Name] AS 	[ListingAgentName]
,	[Listing Agent Address] AS 	[ListingAgentAddress]
,	[Listing Agent Phone] AS 	[ListingAgentPhone]
,	[Listing Agent Email] AS 	[ListingAgentEmail]
,	[Office Name] AS 	[OfficeName]
,	[Office Address] AS 	[OfficeAddress]
,	[Office Phone] AS 	[OfficePhone]
,	[Office Email] AS 	[OfficeEmail]
,[Price per Square Feet] AS [Price per Square Feet]
,[Porch] AS [Porch]
,[Patio] AS [Patio]
,[Deck] AS [Deck]
,[Basement] AS [Basement]
,[Air Conditioner] AS [Air Conditioner]
,[Number of Fireplaces] AS [Number of Fireplaces]
,[Presence of Fireplace] AS [Presence of Fireplace]
,[Fireplace Description] AS [Fireplace Description]
,[Interior Features] AS [Interior Features]
,[Exterior Features] AS [Exterior Features]
,[Existing Structures] AS [Existing Structures]
,[Property Details] AS [Property Details]
,[Lot Features] AS [Lot Features]
,[Zoning] AS [Zoning]
,[Neighborhood] AS [Neighborhood]
,[School District] AS [School District]
,[Elementary School] AS [Elementary School]
,[Middle School] AS [Middle School]
,[High School] AS [High School]
,[Appliances] AS [Appliances]
,[Approximate Lot Dimensions] AS [Approximate Lot Dimensions]
,[Topogrophy] AS [Topogrophy]
,[Waterfront Features] AS [Waterfront Features]
,[Water] AS [Water]
,[Water Source] AS [Water Source]
,[Water Amenities] AS [Water Amenities]
,[Water Access] AS [Water Access]
,[Water Heater] AS [Water Heater]





FROM     [zCust_Citizens_Listing_wkly_WORK_NEW] with(NOLOCK)
--dbo.zCust_Citizens_Listing_wkly_OUT_NEW_2 with(NOLOCK)
--WHERE  (PM_PropertyID IS NOT NULL) and [CountyFIPS] is not null















