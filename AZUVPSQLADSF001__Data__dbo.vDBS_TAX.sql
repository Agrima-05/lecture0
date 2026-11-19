SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON

CREATE VIEW [dbo].[vDBS_TAX]
AS
SELECT 
B.[FIPS] AS [FIPS],
B.[PropertyID] AS [FAPropertyID],
B.[FormattedAPN] AS [APN],
A.[Payee_Owner_of_Record] AS [Payee Owner Name],
A.[Payee_Owner_Property_Address] AS [Payee Owner Address],
B.[SitusStdFullStreetAddress] AS [SitusStdFullStreetAddress],
B.[SitusStdHouseNbr] AS [SitusStdHouseNbr],
B.[SitusStdHouseNbrSuffix] AS [SitusStdHouseNbrSuffix],
B.[SitusStdDirectionLeft] AS [SitusStdDirectionLeft],
B.[SitusStdStreet] AS [SitusStdStreet],
B.[SitusStdMode] AS [SitusStdMode],
B.[SitusStdDirectionRight] AS [SitusStdDirectionRight],
B.[SitusStdUnitType] AS [SitusStdUnitType],
B.[SitusStdUnitNbr] AS [SitusStdUnitNbr],
B.[SitusStdCity] AS [SitusStdCity],
B.[SitusStdState] AS [SitusStdState],
B.[SitusStdZIP5] AS [SitusStdZIP5],
B.[SitusStdZIP4] AS [SitusStdZIP4],
B.[SitusStdCarrierCode] AS [SitusStdCarrierCode],
B.[StdLandUseCode] AS [StdLandUseCode],
A.[PAYEE_CODE] AS [PAYEECODE],
A.[PAYEE_PARCEL_NUMBER] AS [PAYEEPARCELNUMBER],
A.[ASSESSOR_PARCEL_NUMBER] AS [ASSESSORPARCELNUMBER],
A.[TAX_YEAR_BEGIN] AS [TAXYEARBEGIN],
A.[TAX_YEAR_END] AS [TAXYEAREND],
A.[FREQUENCY_SDESC] AS [FREQUENCYSDESC],
A.[INSTALLMENT_NUMBER_1] AS [INSTALLMENTNUMBER1],
A.[BILL_NUMBER_1] AS [BILLNUMBER1],
A.[BASE_TAX_AMOUNT_1] AS [BASETAXAMOUNT1],
A.[NET_TAX_AMOUNT_DUE_1] AS [NETTAXAMOUNTDUE1],
A.[TAX_PAID_IND_1] as [ASSUMEDPAIDIND1],
--A.[ASSUMED_PAID_IND_1] AS [ASSUMEDPAIDIND1],
A.[MULTIPLE_JURISDICTION_IND_1] AS [MULTIPLEJURISDICTIONIND1],
A.[INSTALLMENT_NUMBER_2] AS [INSTALLMENTNUMBER2],
A.[BILL_NUMBER_2] AS [BILLNUMBER2],
A.[BASE_TAX_AMOUNT_2] AS [BASETAXAMOUNT2],
A.[NET_TAX_AMOUNT_DUE_2] AS [NETTAXAMOUNTDUE2],
A.[TAX_PAID_IND_2] as [ASSUMEDPAIDIND2],
A.[MULTIPLE_JURISDICTION_IND_2] AS [MULTIPLEJURISDICTIONIND2],
A.[INSTALLMENT_NUMBER_3] AS [INSTALLMENTNUMBER3],
A.[BILL_NUMBER_3] AS [BILLNUMBER3],
A.[BASE_TAX_AMOUNT_3] AS [BASETAXAMOUNT3],
A.[NET_TAX_AMOUNT_DUE_3] AS [NETTAXAMOUNTDUE3],
A.[TAX_PAID_IND_3] as [ASSUMEDPAIDIND3],
A.[MULTIPLE_JURISDICTION_IND_3] AS [MULTIPLEJURISDICTIONIND3],
A.[INSTALLMENT_NUMBER_4] AS [INSTALLMENTNUMBER4],
A.[BILL_NUMBER_4] AS [BILLNUMBER4],
A.[BASE_TAX_AMOUNT_4] AS [BASETAXAMOUNT4],
A.[NET_TAX_AMOUNT_DUE_4] AS [NETTAXAMOUNTDUE4],
A.[TAX_PAID_IND_4] as [ASSUMEDPAIDIND4],
A.[MULTIPLE_JURISDICTION_IND_4] AS [MULTIPLEJURISDICTIONIND4],
A.[EARLIEST_DELINQUENT_YEAR] AS [EARLIESTDELINQUENTYEAR],
A.[TOTAL_DELINQ_AMOUNT] AS [TOTALDELINQAMOUNT],
A.[NO_OF_DELINQ_PAYMENTS_IN_SYSTEM] AS [NOOFDELINQPAYMENTSINSYSTEM],
A.[TOTAL_BASE_TAX_AMOUNT] AS [TOTALBASETAXAMOUNT],
A.[TOTAL_NET_TAX_AMOUNT_DUE] AS [TOTALNETTAXAMOUNTDUE],
'I' AS [UCID],
A.[UPDATED] AS [FATimestamp]


------------Added 20181001 for iPro----
,B.OwnerStd1CorpInd as OwnerStd1CorpInd


,B.PropertyClassID as PropertyClassID
,B.[MailingOptOut] as [MailingOptOut]


----------Added 20190408 per CR----
,A.[Source_As_Of_Date] as DelinquencyAsOfDate

------Added 20200123 per EC----
,C.Jurisdiction_Name as Jurisdiction_Name

------Added 20220815 for Snowlake primary key
,A.id as [ID]

FROM  [DBS_Tax_LIC].[dbo].[Licensing_Deliverable] as A with(NOLOCK)
left outer join Data.dbo.Property as B WITH (nolock)
on A.LIC_FIPS = B.FIPS
and A.[FAPropertyID] = B.PropertyID

left outer join [DBS_Tax_Lic].[dbo].[TaxYears] as C with(NOLOCK) on A.[PAYEE_CODE] = C.TSCode
WHERE a.CurrentRecord = 'Y'








GRANT SELECT ON [dbo].[vDBS_TAX] TO [CORP\cbrady] AS [dbo]
