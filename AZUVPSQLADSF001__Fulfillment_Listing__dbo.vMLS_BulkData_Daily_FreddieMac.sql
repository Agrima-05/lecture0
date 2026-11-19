SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vMLS_BulkData_Daily_FreddieMac]
AS
SELECT [Property Address]
	,[Property City]
	,[Property State]
	,[Property Zip]
	,[Property Zip + 4]
	,[Assessor's Parcel Identification Number]
	,RIGHT('00000' + CAST([County FIPS] AS VARCHAR(5)), 5) AS [County FIPS]
	,[Internal FA Property Ref ID]
	,[Property Type]
	,[Property Sub-Type]
	,[Lot Size (Sq Ft)]
	,[Home Size (Sq Ft)]
	,[Home or Building Style]
	,[Heating Type]
	,[Heating Fuel Type]
	,[Cooling Type]
	,[Cooling Fuel Type]
	,[Number of Stories]
	,[Year Built]
	,[Roof Type]
	,[Exterior Construction]
	,[Number of Bedrooms]
	,[Number of Bathrooms]
	,[Number of Garages]
	,[Garage Type]
	,[Pool Features]
	,[View Features]
	,[FA Initial List Date]
	,[FA Calculated Days on Market]
	,[Current Original Listing Date]
	,[Initial List Status]
	,[Listing Number]
	,[Status]
	,[Status Sub Type]
	,[Current Listing Price]
	,[Max List Price]
	,[Max List Price Date]
	,[Min List Price]
	,[Min List Price Date]
	,[Sold Price]
	,[Sold Date]
	,[FA Adjusted Sold Price]
	,[FA Sold Price Range]
	,[Last Listing Price Change Amount]
	,[Last Listing Price Change Date]
	,[Prior Listing Price Change Amount]
	,[Prior Listing Price Change Date]
	,[Last Listing Status Change]
	,[Last Listing Status Change Date]
	,[Last Listing Status Sub Type Change]
	,[Last Listing Status Sub Type Change Date]
	,[Prior Listing Status Change]
	,[Prior Listing Status Change Date]
	,[Prior Listing Status Sub Type Change]
	,[Prior Listing Status Sub Type Change Date]
	,[Listing Tracking ID]
	,[FA Unique Listing Identifier - Ref ID]
	,[Update Timestamp]
	,[Add, Change, Delete Indicator]
FROM Fulfillment_Listing.dbo.MLS_Bulk_Current_Listing(NOLOCK)
WHERE Current_Listing_Ind = 1
	AND [County FIPS] IN (
		11001
		,18003
		,18039
		,18057
		,18063
		,18089
		,18097
		,18141
		,18157
		,24003
		,24005
		,24021
		,24025
		,24027
		,24031
		,24033
		,24510
		,25005
		,25009
		,25013
		,25017
		,25021
		,25023
		,25025
		,25027
		,45013
		,45019
		,45045
		,45051
		,45063
		,45079
		,45083
		,47037
		,47065
		,47093
		,47149
		,47157
		,51013
		,51059
		,51107
		,51153
		,51179
		,51510
		,51810
		,53011
		,53033
		,53035
		,53053
		,53061
		,53067
		)

