SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON




CREATE VIEW [dbo].[v_AuctionCOM_Listing]
AS
SELECT [Property Address], [Property City], [Property State], [Property Zip], [Property Zip + 4], CASE WHEN [PM_APN] is NULL THEN [Assessor's Parcel Identification Number] 
ELSE [PM_APN] END AS [Assessor's Parcel Identification Number], 
				  RIGHT('0' + convert(varchar(5),[County FIPS]),5) as [County FIPS], PM_PropertyID AS [Internal FA Property Ref ID], [Property Type], [Property Sub-Type], [Lot Size (Sq Ft)], [Home Size (Sq Ft)], [Home or Building Style], [Heating Type], 
                  [Heating Fuel Type], [Cooling Type], [Cooling Fuel Type], [Number of Stories], [Year Built], [Roof Type], [Exterior Construction], [Number of Bedrooms], [Number of Bathrooms], 
                  [Number of Garages], [Garage Type], [Pool Features], [View Features], [FA Calculated Days on Market], [Current Original Listing Date], [Listing Number], Status, 
                  [Status Sub Type], [Current Listing Price], [Sold Price], [Sold Date], [FA Adjusted Sold Price], [FA Sold Price Range], [Listing Tracking ID], [FA Unique Listing Identifier - Ref ID], 
                  [Update Timestamp], [Add, Change, Delete Indicator]
FROM     HouseCanary_20151230_Out


where 
RIGHT('0' + convert(varchar(5),[County FIPS]),5) in  ('48085','48113','48121','48139','48221','48231','48251','48257','48367','48397','48425','48439','48497','08001','08005',
'08014','08019','08031','08035','08039','08047','08059','08093','12011','12086','12099','04013','04021')




