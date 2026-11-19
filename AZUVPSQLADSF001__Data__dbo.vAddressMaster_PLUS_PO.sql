SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vAddressMaster_PLUS_PO]
AS
	SELECT CountyFips AS FIPS
		, State
		, CountyName AS County
		, Zip AS ZIP5
		, Plus4 AS ZIP4
		, AddressLine AS FullStreetAddress
		, PreDir AS PreDirectional
		, StreetNumber
		, StreetName AS Street
		, PostDir AS PostDirectional
		, StreetType
		, SuiteType AS UnitType
		, Suite AS UnitNbr
		, DsfVacant AS VacantIndicator
		, NonUSPSAddressIndicator
		, NotCurrentlyDeliverable
		, CommunityName
		, A.Municipality
		, City AS PostalCommunity
		, PlaceName
		, A.SubdivisionName
		, [ConsdtLatitude] as Latitude
		, [ConsdtLongitude] as Longitude
		, COALESCE (A.PropertyClassID, RBDI) AS PropertyClassID
		, RBDI AS AddressType
		, A.PropertyID
		, AddressMasterID
		, Ref_ID AS Filler
		, A.FATimestamp AS LastUpdate
		, A.FATimestamp AS FATimeStamp
		, FAEffectiveDate AS EffectiveDate
		, FAExpirationDate AS ExpirationDate
		, A.FAUCIDFlag
		, AddressMatchResults
		, DeliveryPointCheckDigit
		, DeliveryPointCode
		, RBDI
		, Address2
		, CityStateZip
		, AddressMatchResultString
		, B.StdLandUseCode
		, [ConsdtSource] as GeoStatusCode
	FROM AddressMaster.dbo.Address_Master as A WITH (nolock)
		left outer join data.dbo.Property as B with(NOLOCK) 
			on A.CountyFips = B.FIPS 
				and A.PropertyID = B.PropertyID
	WHERE (AddressMatchResults LIKE '%AS01%' 
			OR AddressMatchResults LIKE '%AS03%' 
				OR AddressMatchResults LIKE '%AS11%' 
					OR AddressMatchResults LIKE '%AS10%' 
						OR AddressMatchResults LIKE '%AS20%')
			  
			


GRANT SELECT ON [dbo].[vAddressMaster_PLUS_PO] TO [CORP\cbrady] AS [dbo]
