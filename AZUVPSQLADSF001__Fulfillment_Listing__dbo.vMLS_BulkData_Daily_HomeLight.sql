SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vMLS_BulkData_Daily_HomeLight]
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
	,[FA Calculated Days on Market]
	,[Current Original Listing Date]
	,[Listing Number]
	,[Status]
	,[Status Sub Type]
	,CASE 
		WHEN a.Rental_Ind = 1
			THEN 'Y'
		ELSE ''
		END AS [Rental Ind]
	,[Current Listing Price]
	,[Sold Price]
	,[Sold Date]
	,[FA Adjusted Sold Price]
	,[FA Sold Price Range]
	,[Listing Tracking ID]
	,[FA Unique Listing Identifier - Ref ID]
	,[Update Timestamp]
	,[Add, Change, Delete Indicator]
	,ISNULL(agentstd.MLS_LISTING_AGENT_LICENSE_NBR, '') AS [Listing Agent License Number]
	,ISNULL(agentstd.MLS_LISTING_AGENT_NAME_nochar, '') AS [Listing Agent Name]
	,ISNULL(agentstd.MLS_LISTING_AGENT_ADDRESS, '') AS [Listing Agent Address]
	,ISNULL(agentstd.AGENT_PHONE, '') AS [Listing Agent Phone]
	,ISNULL(agentstd.MLS_LISTING_AGENT_EMAIL_STD, '') AS [Listing Agent Email]
	,ISNULL(officestd.Mls_Office_name_STD, '') AS [Office Name]
	,ISNULL(officestd.MLS_OFFICE_ADDRESS, '') AS [Office Address]
	,ISNULL(officestd.MLS_OFFICE_PHONE, '') AS [Office Phone]
	,ISNULL(officestd.MLS_OFFICE_EMAIL, '') AS [Office Email]
FROM Fulfillment_Listing.dbo.MLS_Bulk_History_w_Prop_Char(NOLOCK) a
INNER JOIN Fulfillment_Listing.dbo.MLS_Bulk_History_w_Prop_Char_Checksum1(NOLOCK) b ON b.Row_Id = a.[FA Unique Listing Identifier - Ref ID]
LEFT JOIN Fulfillment_Listing.dbo.MLS_Bulk_History_w_Prop_Char_Checksum1(NOLOCK) b2 ON b2.Listing_ID = b.Listing_ID
	AND b.ROW4 = (b2.ROW4 + 1)
LEFT JOIN [Fulfillment_Listing].[dbo].MLS_Listing_Agent agent ON agent.MLS_Listing_Agent_CODE = a.MLS_Listing_Agent_CODE
LEFT JOIN [Fulfillment_Listing].[dbo].MLS_Listing_Agent_Std agentstd ON agentstd.MLS_Listing_Agent_CODE_STD = agent.MLS_Listing_Agent_CODE_STD
LEFT JOIN [Fulfillment_Listing].[dbo].MLS_Office office ON office.MLS_OFFICE_CODE = a.MLS_OFFICE_CODE
LEFT JOIN [Fulfillment_Listing].[dbo].MLS_Office_Std officestd ON officestd.MLS_OFFICE_CODE_STD = office.MLS_OFFICE_CODE_STD
WHERE isnull(b.Checksum_3Col, 0) <> isnull(b2.Checksum_3Col, 0)

