SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON



CREATE VIEW [dbo].[vBulk_Current_Listing_DATETIME]
AS
SELECT RTRIM(ISNULL(LTRIM(Substring(addr.HouseNumber, 1, LEN(addr.HouseNumber)) + ' '), '') + ISNULL(LTRIM(Substring(addr.Direction, 1, LEN(addr.Direction)) + ' '), '') + ISNULL(LTRIM(Substring(addr.Street_Name, 1, LEN(addr.Street_Name)) + ' '), '') + ISNULL(LTRIM(Substring(addr.Street_Type, 1, LEN(addr.Street_Type)) + ' '), '') + ISNULL(LTRIM(Substring(addr.Post_Direction, 1, LEN(addr.Post_Direction)) + ' '), '') + ISNULL(LTRIM(Substring(addr.Unit, 1, LEN(addr.Unit)) + ' '), '')) AS [Property Address]
	,RTRIM(ISNULL(addr.City, '')) AS [Property City]
	,RTRIM(ISNULL(addr.STD_State, '')) AS [Property State]
	,RTRIM(ISNULL(addr.Zip, '')) AS [Property Zip]
	,RTRIM(ISNULL(addr.Plus4, '')) AS [Property Zip + 4]
	,ISNULL(lh.APN, '') /*ISNULL(bkfs.APN, '')*/ AS [Assessor's Parcel Identification Number]
	,RIGHT('00000' + CAST(ISNULL(lh.Fips,0) AS VARCHAR(5)), 5) AS [County FIPS]
	,ISNULL(CAST(lh.REF_ID AS VARCHAR), '') /*ISNULL(CAST(bkfs.BK_PROP_ID AS VARCHAR), '')*/ AS [Internal FA Property Ref ID]
	,ISNULL(lf.PROPERTY_TYPE,'') AS [Property Type]
	,CASE 
		WHEN ISNULL(lf.PROPERTY_TYPE,'') <> ISNULL(lf.PROPERTY_SUB_TYPE,'')
			THEN ISNULL(lf.PROPERTY_SUB_TYPE,'')
		ELSE ''
		END AS [Property Sub-Type]
	,CASE 
		WHEN CAST(ROUND(lh.LOT_SIZE_STD, 0) AS NUMERIC(15, 0)) > 0
			THEN CAST(CAST(ROUND(lh.LOT_SIZE_STD, 0) AS NUMERIC(15, 0)) AS VARCHAR)
		ELSE ''
		END AS [Lot Size (Sq Ft)]
	,CASE 
		WHEN CAST(ROUND(lh.HOME_SIZE_STD, 0) AS NUMERIC(15, 0)) > 0
			THEN CAST(CAST(ROUND(lh.HOME_SIZE_STD, 0) AS NUMERIC(15, 0)) AS VARCHAR)
		ELSE ''
		END AS [Home Size]
	,ISNULL(lf.STYLE,'') AS [Home or Building Style]
	,ISNULL(lf.HEATING_FTRS,'') AS [Heating Type]
	,ISNULL(lf.HEAT_FUEL_TYPE,'') AS [Heating Fuel Type]
	,ISNULL(lf.COOLING_FTRS,'') AS [Cooling Type]
	,ISNULL(lf.COOL_FUEL_TYPE,'') AS [Cooling Fuel Type]
	,ISNULL(lf.NBR_STORIES,'') AS [Number of Stories]
	,CASE 
		WHEN CAST(lh.YEAR_BUILT_STD AS VARCHAR) IS NOT NULL
			THEN CAST(lh.YEAR_BUILT_STD AS VARCHAR)
		ELSE ''
		END AS [Year Built]
	,ISNULL(lf.ROOFING,'') AS [Roof Type]
	,ISNULL(lf.EXTERIOR_CONSTRUCTION,'') AS [Exterior Construction]
	,CASE 
		WHEN CAST(lh.NBR_BEDRMS_STD AS VARCHAR) <> '0'
			THEN CAST(lh.NBR_BEDRMS_STD AS VARCHAR)
		ELSE ''
		END AS [Number of Bedrooms]
	,CASE 
		WHEN CAST(lh.NBR_BATH_STD AS VARCHAR) <> '0.00'
			THEN CAST(lh.NBR_BATH_STD AS VARCHAR)
		ELSE ''
		END AS [Number of Bathrooms]
	,CASE 
		WHEN CAST(lh.NBR_GRG_STD AS VARCHAR) <> '0'
			THEN CAST(lh.NBR_GRG_STD AS VARCHAR)
		ELSE ''
		END AS [Number of Garages]
	,REPLACE(ISNULL(lf.PARKING_FTRS,''),'|',' ') AS [Garage Type]
	,ISNULL(lf.POOL_FTRS,'') AS [Pool Features]
	,ISNULL(lf.VIEW_1,'') AS [View Features]
	,CASE 
		WHEN CAST(ROUND(lh.PRICE_PER_SQFT_STD, 0) AS NUMERIC(15, 0)) > 0
			THEN CAST(CAST(ROUND(lh.PRICE_PER_SQFT_STD, 0) AS NUMERIC(15, 0)) AS VARCHAR)
		ELSE ''
		END AS [Price per Square Feet]
	,' ' AS [Porch]
	,' ' AS [Patio]
	,' ' AS [Deck]
	,CASE 
		WHEN CAST(lh.BSMT_FIN_SQFT_STD AS VARCHAR) IS NOT NULL
			THEN 'Yes'
		ELSE ' '
		END AS [Basement]
	,ISNULL(lf.RANGE_AIRCONDITIONERS,'') AS [Air Conditioner]
	,CASE 
		WHEN CAST(lh.NBR_FIREPLACE_STD AS VARCHAR) IS NOT NULL
			THEN CAST(lh.NBR_FIREPLACE_STD AS VARCHAR)
		ELSE ''
		END AS [Number of Fireplaces]
	,ISNULL(lf.FIREPLACE_PRESENT,'') AS [Presence of Fireplace]
	,ISNULL(lh.FIREPLACE_DESC_STD, '') AS [Fireplace Description]
	,ISNULL(lf.INTERIOR_FTRS,'') AS [Interior Features]
	,ISNULL(lf.EXTERIOR_FTRS,'') AS [Exterior Features]
	,ISNULL(lf.EXISTING_STRUCTURES,'') AS [Existing Structures]
	,REPLACE(ISNULL(lh.PROPERTY_DETAILS, ''),'|',' ') AS [Property Details]
	,ISNULL(lf.LOT_FTRS,'') AS [Lot Features]
	,ISNULL(lf.ZONING,'') AS [Zoning]
	,ISNULL(lf.NEIGHBORHOOD,'') AS [Neighborhood]
	,ISNULL(lf.SCHOOL_DISTRICT,'') AS [School District]
	,ISNULL(lf.ELEMENTARY_SCHOOL,'') AS [Elementary School]
	,ISNULL(lf.MIDDLE_SCHOOL,'') AS [Middle School]
	,ISNULL(lf.HIGH_SCHOOL,'') AS [High School]
	,ISNULL(lf.APPLIANCES,'') AS [Appliances]
	,ISNULL(lh.APX_LOT_DIMENSIONS, '') AS [Approximate Lot Dimensions]
	,ISNULL(lf.TOPOGRAPHY,'') AS [Topogrophy]
	,ISNULL(lf.WATER_FRONT_FTRS,'') AS [Waterfront Features]
	,ISNULL(lf.WATER,'') AS [Water]
	,ISNULL(lf.WATER_SOURCE,'') AS [Water Source]
	,ISNULL(lf.WATER_AMMENITIES,'') AS [Water Amenities]
	,ISNULL(lf.WATER_ACCESS,'') AS [Water Access]
	,ISNULL(lf.WATER_HEATER,'') AS [Water Heater]
	,COALESCE((SELECT MIN(t.MLS_LIST_DATE_STD) FROM
				(SELECT MLS_LIST_DATE_STD
				FROM FA_Listing.dbo.Listing l
				WHERE l.REF_ID = lh.REF_ID
				AND l.MLS_LIST_DATE_STD < lh.MLS_LIST_DATE_STD
				AND l.MLS_LIST_DATE_STD >
				ISNULL((SELECT MAX(ll.SOLD_DATE_STD) FROM FA_Listing.dbo.Listing ll WITH (FORCESEEK)
						WHERE ll.REF_ID = l.REF_ID
						AND ll.MLS_LIST_DATE_STD IS NOT NULL
						AND ISNULL(ll.SOLD_DATE_STD, '') < l.MLS_LIST_DATE_STD), '')
				AND l.MLS_LIST_DATE_STD >= DATEADD(month, - 6, ISNULL(lh.MLS_LIST_DATE_STD, Getdate()))
				UNION ALL
				SELECT MIN(Value)
				FROM FA_Listing.dbo.Listing l
				LEFT JOIN FA_Listing.dbo.ListingChange lc ON l.Listing_ID = lc.Listing_ID
				WHERE l.REF_ID = lh.REF_ID
				AND lc.FieldId = 4
				AND l.MLS_LIST_DATE_STD < lh.MLS_LIST_DATE_STD
				AND l.MLS_LIST_DATE_STD >
				ISNULL((SELECT MAX(ll.SOLD_DATE_STD) FROM FA_Listing.dbo.Listing ll WITH (FORCESEEK)
						WHERE ll.REF_ID = l.REF_ID
						AND ll.MLS_LIST_DATE_STD IS NOT NULL
						AND ISNULL(ll.SOLD_DATE_STD, '') < l.MLS_LIST_DATE_STD), '')
				AND l.MLS_LIST_DATE_STD >= DATEADD(month, - 6, ISNULL(lh.MLS_LIST_DATE_STD, Getdate()))
				) t
			), Cast(lh.MLS_LIST_DATE_STD AS VARCHAR), '') AS [FA Initial List Date]
	,CASE
		WHEN CAST(lh.MLS_DAYS_ON_MARKET_STD as varchar) <> 0
			THEN CAST(lh.MLS_DAYS_ON_MARKET_STD as varchar)
		ELSE ''
		END AS [FA Calculated Days on Market]
	,COALESCE((SELECT ISNULL(CAST(MIN(t.MLS_LIST_DATE_STD) AS VARCHAR), '') FROM
				(SELECT MLS_LIST_DATE_STD
				FROM FA_Listing.dbo.Listing l
				WHERE l.Listing_ID = lh.Listing_ID
				UNION ALL
				SELECT MIN(Value)
				FROM FA_Listing.dbo.Listing l
				LEFT JOIN FA_Listing.dbo.ListingChange lc ON l.Listing_ID = lc.Listing_ID
				WHERE l.Listing_ID = lh.Listing_ID
				AND lc.FieldId = 4
				) t
			), Cast(lh.MLS_LIST_DATE_STD AS VARCHAR), '') AS [Current Original Listing Date]
	,COALESCE((SELECT TOP 1 (t.MLS_STATUS_STD) FROM
				(SELECT TOP 1 MLS_STATUS_STD
				FROM FA_Listing.dbo.Listing l
				WHERE l.Listing_ID = lh.Listing_ID
				ORDER BY l.UpdateSeq
				UNION ALL
				SELECT TOP 1 Value
				FROM FA_Listing.dbo.Listing l
				LEFT JOIN FA_Listing.dbo.ListingChange lc ON l.Listing_ID = lc.Listing_ID
				WHERE l.Listing_ID = lh.Listing_ID
				ORDER BY lc.UpdateSeq
				) t
			), Cast(lh.MLS_LIST_DATE_STD AS VARCHAR), '') AS [Initial List Status]
	,ISNULL(lh.MLS_Listing_number, '') AS [Listing Number]
	,lh.MLS_STATUS_STD AS [Status]
	,ISNULL(lh.MLS_STATUS_SUB_TYPE_STD, '') AS [Status Sub Type]
	,CASE 
		WHEN lh.Rental_Ind = 1
			THEN 'Y'
		ELSE ''
		END AS [Rental Indicator]
	,CASE 
		WHEN CAST(lh.MLS_LIST_PRICE_STD AS NUMERIC(15)) > 0
			THEN CAST(CAST(lh.MLS_LIST_PRICE_STD AS NUMERIC(15)) AS VARCHAR)
		ELSE ''
		END AS [Current Listing Price]
	,ISNULL(CAST(CAST(lav.Max_MLS_LIST_PRICE_STD AS NUMERIC(15)) AS VARCHAR), '') AS [Max List Price]
 	,ISNULL(CAST(lav.Max_MLS_LIST_PRICE_STD_Date AS VARCHAR), '') AS [Max List Price Date]
	,ISNULL(CAST(CAST(lav.Min_MLS_LIST_PRICE_STD AS NUMERIC(15)) AS VARCHAR), '') AS [Min List Price]
 	,ISNULL(CAST(lav.Min_MLS_LIST_PRICE_STD_Date AS VARCHAR), '') AS [Min List Price Date]
	,CASE 
		WHEN CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) > 0
			THEN CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) AS VARCHAR)
		ELSE ''
		END AS [Sold Price]
	,CASE 
		WHEN CAST(lh.SOLD_DATE_STD AS VARCHAR) IS NOT NULL
			THEN CAST(lh.SOLD_DATE_STD AS VARCHAR)
		ELSE ''
		END AS [Sold Date]
	,CASE 
		WHEN CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) > 1000
			THEN CASE 
					WHEN CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) % 1000 = 0
						THEN CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) + 1000 AS VARCHAR)
					ELSE CAST(CAST(ROUND(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)), - 3) AS NUMERIC(15)) AS VARCHAR)
					END
		WHEN CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) > 0
			THEN CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) AS VARCHAR)
		ELSE ''
		END AS [FA Adjusted Sold Price]
	,CASE 
		WHEN CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) > 199
			THEN CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) - 200 AS VARCHAR) + '-' + CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) + 200 AS VARCHAR)
		WHEN CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) > 99
			THEN CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) - 100 AS VARCHAR) + '-' + CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) + 100 AS VARCHAR)
		WHEN CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) > 9
			THEN CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) - 010 AS VARCHAR) + '-' + CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) + 010 AS VARCHAR)
		WHEN CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) > 0
			THEN CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) - 001 AS VARCHAR) + '-' + CAST(CAST(lh.SOLD_PRICE_STD AS NUMERIC(15)) + 001 AS VARCHAR)
		ELSE ''
		END AS [FA Sold Price Range]
	,CASE 
		WHEN Last_MLS_LIST_PRICE_STD IS NOT NULL
			THEN CAST(ISNULL(Cast(lh.MLS_LIST_PRICE_STD AS NUMERIC), 0) - ISNULL(Cast(Last_MLS_LIST_PRICE_STD AS NUMERIC), 0) AS VARCHAR)
		ELSE ''
		END AS [Last Listing Price Change Amount]
	,CASE 
		WHEN ISNULL(Cast(Last_MLS_LIST_PRICE_STD_Date AS VARCHAR), '') IS NOT NULL
			THEN ISNULL(Cast(Last_MLS_LIST_PRICE_STD_Date AS VARCHAR), '')
		ELSE ''
		END AS [Last Listing Price Change Date]
	,CASE 
		WHEN Last_MLS_LIST_PRICE_STD IS NOT NULL
			AND Prior_MLS_LIST_PRICE_STD IS NOT NULL
			THEN CAST(ISNULL(Cast(Last_MLS_LIST_PRICE_STD AS NUMERIC), 0) - ISNULL(Cast(Prior_MLS_LIST_PRICE_STD AS NUMERIC), 0) AS VARCHAR)
		ELSE ''
		END AS [Prior Listing Price Change Amount]
	,CASE 
		WHEN ISNULL(Cast(Prior_MLS_LIST_PRICE_STD_Date AS VARCHAR), '') IS NOT NULL
			THEN ISNULL(Cast(Prior_MLS_LIST_PRICE_STD_Date AS VARCHAR), '')
		ELSE ''
		END AS [Prior Listing Price Change Date]
	,ISNULL(Last_MLS_STATUS_STD, '') AS [Last Listing Status Change]
	,CASE 
		WHEN ISNULL(Cast(Last_MLS_STATUS_STD_Date AS VARCHAR), '') IS NOT NULL
			AND Last_MLS_STATUS_STD IS NOT NULL
			THEN ISNULL(Cast(Last_MLS_STATUS_STD_Date AS VARCHAR), '')
		ELSE ''
		END AS [Last Listing Status Change Date]
	,ISNULL(Last_MLS_STATUS_SUB_TYPE_STD, '') AS [Last Listing Status Sub Type Change]
	,CASE 
		WHEN ISNULL(Cast(Last_MLS_STATUS_SUB_TYPE_STD_Date AS VARCHAR), '') IS NOT NULL
			AND Last_MLS_STATUS_SUB_TYPE_STD IS NOT NULL
			THEN ISNULL(Cast(Last_MLS_STATUS_SUB_TYPE_STD_Date AS VARCHAR), '')
		ELSE ''
		END AS [Last Listing Status Sub Type Change Date]
	,ISNULL(Prior_MLS_STATUS_STD, '') AS [Prior Listing Status Change]
	,CASE 
		WHEN ISNULL(Cast(Prior_MLS_STATUS_STD_Date AS VARCHAR), '') IS NOT NULL
			AND Prior_MLS_STATUS_STD IS NOT NULL
			THEN ISNULL(Cast(Prior_MLS_STATUS_STD_Date AS VARCHAR), '')
		ELSE ''
		END AS [Prior Listing Status Change Date]
	,ISNULL(Prior_MLS_STATUS_SUB_TYPE_STD, '') AS [Prior Listing Status Sub Type Change]
	,CASE 
		WHEN ISNULL(Cast(Prior_MLS_STATUS_SUB_TYPE_STD_Date AS VARCHAR), '') IS NOT NULL
			AND Prior_MLS_STATUS_SUB_TYPE_STD IS NOT NULL
			THEN ISNULL(Cast(Prior_MLS_STATUS_SUB_TYPE_STD_Date AS VARCHAR), '')
		ELSE ''
		END AS [Prior Listing Status Sub Type Change Date]
	,lh.Listing_ID AS [Listing Tracking ID]
	,CASE
		WHEN lh.MLS_STATUS_STD = 'Sold'
			THEN ISNULL(convert(nvarchar(8),lh.SOLD_DATE_STD,112),convert(nvarchar(8),lh.UPDATE_FLAG_DATE_STD,112)) + convert(nvarchar(8),lh.UPDATE_FLAG_DATE_STD,112) + right('0000000000' + cast(lh.Listing_ID AS nvarchar(10)), 10) + right('0000000000' + cast(lh.UpdateSeq AS nvarchar(10)), 10)
		ELSE ISNULL(convert(nvarchar(8),lh.MLS_LIST_DATE_STD,112),convert(nvarchar(8),lh.UPDATE_FLAG_DATE_STD,112)) + convert(nvarchar(8),lh.UPDATE_FLAG_DATE_STD,112) + right('0000000000' + cast(lh.Listing_ID AS nvarchar(10)), 10) + right('0000000000' + cast(lh.UpdateSeq AS nvarchar(10)), 10)
		END AS [FA Unique Listing Identifier - Ref ID]
	--,cast(lh.UpdateTimestamp as date) AS [Update Timestamp]
	----------------Changed from DATE to DATETIME per Paul 20161020 - KL-
	,lh.UpdateTimestamp  AS [Update Timestamp]
	,CASE 
		WHEN (lh.UPDATE_FLAG_DATE_STD = (SELECT min(UPDATE_FLAG_DATE_STD) FROM FA_Listing.dbo.ListingHistory(NOLOCK) lh_min WHERE lh_min.Listing_Id = lh.Listing_ID))
			THEN 'A'
		ELSE 'C'
		END AS [Add, Change, Delete Indicator]
	,ISNULL(agentstd.MLS_LISTING_AGENT_LICENSE_NBR, '') AS [Listing Agent License Number]
	,ISNULL(agentstd.MLS_LISTING_AGENT_NAME_nochar, '') AS [Listing Agent Name]
	,ISNULL(agentstd.MLS_LISTING_AGENT_ADDRESS, '') AS [Listing Agent Address]
	,ISNULL(agentstd.AGENT_PHONE, '') AS [Listing Agent Phone]
	,ISNULL(agentstd.MLS_LISTING_AGENT_EMAIL, '') AS [Listing Agent Email]
	,ISNULL(officestd.Mls_Office_name_STD, '') AS [Office Name]
	,ISNULL(officestd.MLS_OFFICE_ADDRESS, '') AS [Office Address]
	,ISNULL(officestd.MLS_OFFICE_PHONE, '') AS [Office Phone]
	,ISNULL(officestd.MLS_OFFICE_EMAIL, '') AS [Office Email]
	,lh.UPDATE_FLAG_DATE_STD
	,lh.UpdateTimestamp
	,lh.UpdateSeq
	,lh.CurrentUpdateSeq
FROM FA_Listing.dbo.vListingHistory lh
LEFT JOIN FA_Listing.dbo.FA_MLS_Raw_Std_Address(NOLOCK) addr ON addr.Row_Id = lh.AddrId AND addr.Addr_type = 'S'
LEFT JOIN FA_Listing.dbo.MLS_Listing_Agent(NOLOCK) agent ON agent.MLS_Listing_Agent_CODE = lh.MLS_Listing_Agent_CODE
LEFT JOIN FA_Listing.dbo.MLS_Listing_Agent_Std(NOLOCK) agentstd ON agentstd.MLS_Listing_Agent_CODE_STD = agent.MLS_Listing_Agent_CODE_STD
LEFT JOIN FA_Listing.dbo.MLS_Office(NOLOCK) office ON office.MLS_OFFICE_CODE = lh.MLS_OFFICE_CODE
LEFT JOIN FA_Listing.dbo.MLS_Office_Std(NOLOCK) officestd ON officestd.MLS_OFFICE_CODE_STD = office.MLS_OFFICE_CODE_STD
LEFT JOIN FA_Listing.dbo.vListingPriorValues lpv on lpv.Listing_ID = lh.Listing_ID
LEFT JOIN FA_Listing.dbo.vListingAggregateValues lav on lav.Listing_ID = lh.Listing_ID
OUTER APPLY (
	SELECT TOP 1 lf.*
	FROM FA_Listing.dbo.ListingHistory lh2
	CROSS APPLY FA_Listing.dbo.fnGetListingFeatureSnapshotSingle(lh2.UPDATE_FLAG_DATE_STD, lh2.UpdateSeq, lh2.Listing_ID) lf
	WHERE lh2.Listing_ID = lh.Listing_ID AND lh2.UPDATE_FLAG_DATE_STD = lh.UPDATE_FLAG_DATE_STD
	ORDER BY
		CASE WHEN APPLIANCES IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN COMMUNITY_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN COMPLEX_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN COOLING_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN ELEMENTARY_SCHOOL IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN ENERGY_INFO IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN EXISTING_STRUCTURES IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN EXTERIOR_CONSTRUCTION IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN EXTERIOR_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN FARM_IMPROVEMENT IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN FIREPLACE_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN HEATING_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN HIGH_SCHOOL IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN INTERIOR_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN LOT_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN MASTER_BEDROOM IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN MIDDLE_SCHOOL IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN MLS_AREA IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN MLS_INCLUSIONS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN NBR_GRG IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN NBR_STORIES IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN NEIGHBORHOOD IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN PARCEL_ACCESS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN PARKING_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN POOL_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN PRESENT_USE IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN PROPERTY_SUB_TYPE IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN PROPERTY_TYPE IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN RANGE_AIRCONDITIONERS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN ROOFING IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN SCHOOL_DISTRICT IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN SEWER IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN STYLE IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN SUBDIVISION IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN UTILITY_PRESENT IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN VIEW_1 IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN WATER IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN WATER_FRONT_FTRS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN WATER_HEATER IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN WATER_ACCESS IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN WATER_SOURCE IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN WATER_METER IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN WATER_AMMENITIES IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN WATER_PRESENCE IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Heating Availability] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Water Heater Availability] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Water Heater Fuel Source] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Water Heater Type] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Pool Accessories] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Pool Amenities] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Pool Fuel Source] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Pool Heating Features] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Pool Location] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Pool Presence] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Pool Size] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Pool Type] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN TOPOGRAPHY IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN ZONING IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN FIREPLACE_FUEL_SOURCE IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN FIREPLACE_LOCATION IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN FIREPLACE_NBR IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN FIREPLACE_PRESENT IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN [Garage Sq Ft] IS NOT NULL THEN 1 ELSE 0 END
		+ CASE WHEN HOME_SIZE IS NOT NULL THEN 1 ELSE 0 END
		desc
	) lf
WHERE ISNULL(lh.PROVIDER_TYPE,'') <> 'Altos'
AND lh.UpdateSeq=(Select max(UpdateSeq) from FA_Listing.dbo.ListingHistory where Listing_ID=lh.Listing_ID and UPDATE_FLAG_DATE_STD=lh.UPDATE_FLAG_DATE_STD)





