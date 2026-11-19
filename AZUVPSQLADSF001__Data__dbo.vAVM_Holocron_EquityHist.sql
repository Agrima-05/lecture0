SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON


CREATE VIEW [dbo].[vAVM_Holocron_EquityHist]
AS

SELECT 
b.[Fips],
b.[PropertyID],
b.[APN] as [APN],
b.[APNSeqNbr] ,
b.[OldAPN],
B.[OldApnIndicator],
b.[TaxAccountNumber],
b.[SitusFullStreetAddress] as [SitusFullStreetAddress],
b.[SitusHouseNbr] as [SitusHouseNbr],
b.[SitusHouseNbrSuffix] as [SitusHouseNbrSuffix],
b.[SitusDirectionLeft] as [SitusDirectionLeft],
b.[SitusStreet] as [SitusStreet],
b.[SitusMode] as [SitusMode],
b.[SitusDirectionRight] as [SitusDirectionRight],
b.[SitusUnitType] as [SitusUnitType],
b.[SitusUnitNbr] as [SitusUnitNbr],
b.[SitusCity] as [SitusCity],
b.[SitusState] as [SitusState],
b.[SitusZIP5] as [SitusZIP5],
b.[SitusZIP4] as [SitusZIP4],
b.[SitusCarrierCode] as [SitusCarrierCode],
B.[SitusLatitude] as SitusLatitude,
B.[SitusLongitude] as SitusLongitude,
B.[SitusGeoStatusCode] as SitusGeoStatusCode,
B.[PropertyClassID] as PropertyClassID,
B.[LandUseCode] as LandUseCode,
B.[Owner1CorpInd] as Owner1CorpInd,
B.[Owner1LastName] as Owner1LastName,
B.[Owner1FirstName] as Owner1FirstName,
B.[Owner1MiddleName] as Owner1MiddleName,
B.[Owner1Suffix] as Owner1Suffix,
B.[Owner2CorpInd] as Owner2CorpInd,
B.[Owner2LastName] as Owner2LastName,
B.[Owner2FirstName] as Owner2FirstName,
B.[Owner2MiddleName] as Owner2MiddleName,
B.[Owner2Suffix] as Owner2Suffix,
B.[OwnerNAME1FULL] as OwnerNAME1FULL,
B.[OwnerNAME2FULL] as OwnerNAME2FULL,
B.[OwnerOccupied] as OwnerOccupied,
b.[MailingFullStreetAddress] as [MailingFullStreetAddress],
B.[MailingHouseNbr] as MailingHouseNbr,
B.[MailingHouseNbrSuffix] as MailingHouseNbrSuffix,
B.[MailingDirectionLeft] as MailingDirectionLeft,
B.[MailingStreet] as MailingStreet,
B.[MailingMode] as MailingMode,
B.[MailingDirectionRight] as MailingDirectionRight,
B.[MailingUnitType] as MailingUnitType,
B.[MailingUnitNbr] as MailingUnitNbr,
B.[MailingCity] as MailingCity,
B.[MailingState] as MailingState,
B.[MailingZIP5] as MailingZIP5,
B.[MailingZIP4] as MailingZIP4,
B.[MailingCarrierCode] as MailingCarrierCode,
B.[MailingOptOut] as [MailingOptOut],
B.[MailingCOName] as [MailingCOName],
B.[MailingForeignAddressInd] as [MailingForeignAddressInd],
B.[TotalOpenLienNbr] as [TotalOpenLienNbr],
B.[TotalOpenLienAmt] as [TotalOpenLienAmt],
B.[Mtg1TransactionId] as [Mtg1TransactionId],
B.[Mtg1RecordingDate] as [Mtg1RecordingDate],
B.[Mtg1LoanAmt] as [Mtg1LoanAmt],
B.[Mtg1Lender] as [Mtg1Lender],
B.[Mtg1PrivateLender] as [Mtg1PrivateLender],
B.[Mtg1Term] as [Mtg1Term],
B.[Mtg1LoanDueDate] as [Mtg1LoanDueDate],
B.[Mtg1AdjRider] as [Mtg1AdjRider],
B.[Mtg1LoanType] as [Mtg1LoanType],
B.[Mtg1TypeFinancing] as [Mtg1TypeFinancing],
B.[Mtg1LienPosition] as [Mtg1LienPosition],
B.[Mtg2TransactionId] as [Mtg2TransactionId],
B.[Mtg2RecordingDate] as [Mtg2RecordingDate],
B.[Mtg2LoanAmt] as [Mtg2LoanAmt],
B.[Mtg2Lender] as [Mtg2Lender],
B.[Mtg2PrivateLender] as [Mtg2PrivateLender],
B.[Mtg2Term] as [Mtg2Term],
B.[Mtg2LoanDueDate] as [Mtg2LoanDueDate],
B.[Mtg2AdjRider] as [Mtg2AdjRider],
B.[Mtg2LoanType] as [Mtg2LoanType],
B.[Mtg2TypeFinancing] as [Mtg2TypeFinancing],
B.[Mtg2LienPosition] as [Mtg2LienPosition],
B.[Mtg3TransactionId] as [Mtg3TransactionId],
B.[Mtg3RecordingDate] as [Mtg3RecordingDate],
B.[Mtg3LoanAmt] as [Mtg3LoanAmt],
B.[Mtg3Lender] as [Mtg3Lender],
B.[Mtg3PrivateLender] as [Mtg3PrivateLender],
B.[Mtg3Term] as [Mtg3Term],
B.[Mtg3LoanDueDate] as [Mtg3LoanDueDate],
B.[Mtg3AdjRider] as [Mtg3AdjRider],
B.[Mtg3LoanType] as [Mtg3LoanType],
B.[Mtg3TypeFinancing] as [Mtg3TypeFinancing],
B.[Mtg3LienPosition] as [Mtg3LienPosition],
B.[Mtg4TransactionId] as [Mtg4TransactionId],
B.[Mtg4RecordingDate] as [Mtg4RecordingDate],
B.[Mtg4LoanAmt] as [Mtg4LoanAmt],
B.[Mtg4Lender] as [Mtg4Lender],
B.[Mtg4PrivateLender] as [Mtg4PrivateLender],
B.[Mtg4Term] as [Mtg4Term],
B.[Mtg4LoanDueDate] as [Mtg4LoanDueDate],
B.[Mtg4AdjRider] as [Mtg4AdjRider],
B.[Mtg4LoanType] as [Mtg4LoanType],
B.[Mtg4TypeFinancing] as [Mtg4TypeFinancing],
B.[Mtg4LienPosition] as [Mtg4LienPosition],

------Per BR 20221019 - **Cascade - Start w/ Premier (Lender), then Power(White Label), then Direct(DIRECT) to get high hit rate**
-------20221102 - Per BR - REMOVE PREMIER FROM CASCADE FOR FULL!!!-------

coalesce(A.[POWER_FINAL_VALUE],A.[DIRECT_FINAL_VALUE]) as [CurrentAVMValue],

case when  a.[POWER_FINAL_VALUE] > 0 then a.[POWER_LOW_VALUE]
	 when  ISNULL(a.[POWER_FINAL_VALUE],'0') like '0' 
	 and a.[DIRECT_FINAL_VALUE] > 0 then a.[DIRECT_LOW_VALUE]
	 else NULL end
	 as  [vLowValue],


case when a.[POWER_FINAL_VALUE] > 0 then a.[POWER_HIGH_VALUE]
	 when ISNULL(a.[POWER_FINAL_VALUE],'0') like '0' 
	  and a.[DIRECT_FINAL_VALUE] > 0 then a.[DIRECT_HIGH_VALUE]
	 else NULL end
	 as  [vHighValue],

case when a.[POWER_FINAL_VALUE] > 0 then a.[POWER_CONFIDENCE_SCORE]
	 when ISNULL(a.[POWER_FINAL_VALUE],'0') like '0' 
	  and a.[DIRECT_FINAL_VALUE] > 0 then a.[DIRECT_CONFIDENCE_SCORE]
	 else NULL end
	 as  [vConfidenceScore],


case when a.[POWER_FINAL_VALUE] > 0 then a.[POWER_FORECAST_STANDARD_DEVIATION]
	 when ISNULL(a.[POWER_FINAL_VALUE],'0') like '0' 
	  and a.[DIRECT_FINAL_VALUE] > 0 then a.[DIRECT_FORECAST_STANDARD_DEVIATION]
	 else NULL end
	 as  [vStandardDeviation],


convert(varchar(8),convert(date,a.[VALUE_AS_OF]),112) as [vValuationDate],

B.[Mtg1EstLoanBalance] as Mtg1EstLoanBalance,
B.[Mtg2EstLoanBalance] as Mtg2EstLoanBalance,
B.[Mtg3EstLoanBalance] as Mtg3EstLoanBalance,
B.[Mtg4EstLoanBalance] as Mtg4EstLoanBalance,

B.[Mtg1EstInterestRate] as [Mtg1EstInterestRate],
B.[Mtg2EstInterestRate] as [Mtg2EstInterestRate],
B.[Mtg3EstInterestRate] as [Mtg3EstInterestRate],
B.[Mtg4EstInterestRate] as [Mtg4EstInterestRate],

CASE WHEN isNULL(B.TotalOpenLienAmt,0) = 0 THEN NULL 
WHEN coalesce(CASE WHEN a.[PREMIER_FINAL_VALUE] = 0 THEN NULL ELSE a.[PREMIER_FINAL_VALUE] END,CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END) IS NULL THEN NULL 
WHEN Convert(Money,B.[TotalOpenLienAmt]) / Convert(Money,coalesce(CASE WHEN a.[PREMIER_FINAL_VALUE] = 0 THEN NULL ELSE a.[PREMIER_FINAL_VALUE] END,CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END)) > 1.5 THEN NULL 
WHEN Convert(Money,B.[TotalOpenLienAmt]) / Convert(Money,coalesce(CASE WHEN a.[PREMIER_FINAL_VALUE] = 0 THEN NULL ELSE a.[PREMIER_FINAL_VALUE] END,CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END)) < 0.004 THEN NULL 
ELSE CONVERT(numeric(5, 2), Convert(Money,B.TotalOpenLienAmt) / Convert(Money,coalesce(CASE WHEN a.[PREMIER_FINAL_VALUE] = 0 THEN NULL ELSE a.[PREMIER_FINAL_VALUE] END,CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END)) * 100)
END AS CLTV,

CASE WHEN  isNULL(convert(bigint,b.[Mtg1EstLoanBalance]),0) + isNULL(convert(bigint,b.[Mtg2EstLoanBalance]),0) + isNULL(convert(bigint,b.[Mtg3EstLoanBalance]),0) + isNULL(convert(bigint,b.[Mtg4EstLoanBalance]),0) = 0.0 THEN NULL 
WHEN coalesce(CASE WHEN a.[PREMIER_FINAL_VALUE] = 0 THEN NULL ELSE a.[PREMIER_FINAL_VALUE] END,CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END) IS NULL THEN NULL 
WHEN (isNULL(convert(money,b.[Mtg1EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg2EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg3EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg4EstLoanBalance]),0)) / Convert(Money,coalesce(CASE WHEN a.[PREMIER_FINAL_VALUE] = 0 THEN NULL ELSE a.[PREMIER_FINAL_VALUE] END,CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END)) > 1.5 THEN NULL 
WHEN (isNULL(convert(money,b.[Mtg1EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg2EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg3EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg4EstLoanBalance]),0)) / Convert(Money,coalesce(CASE WHEN a.[PREMIER_FINAL_VALUE] = 0 THEN NULL ELSE a.[PREMIER_FINAL_VALUE] END,CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END)) < 0.004 THEN NULL 
ELSE CONVERT(numeric(5, 2), (ISNULL(CAST(b.[Mtg1EstLoanBalance] AS money),0) + isNULL(CAST(b.[Mtg2EstLoanBalance] AS money),0) + isNULL(CAST(b.[Mtg3EstLoanBalance] AS money),0) + isNULL(CAST(b.[Mtg4EstLoanBalance] AS money),0)) / (coalesce(CASE WHEN convert(money,A.[POWER_FINAL_VALUE]) = 0 THEN NULL ELSE convert(money,A.[POWER_FINAL_VALUE]) END,CASE WHEN convert(money,A.[DIRECT_FINAL_VALUE]) = 0 THEN NULL ELSE convert(money,a.[DIRECT_FINAL_VALUE]) END)) * 100) 
END AS CLBTV,


B.[FATimestamp] as FATimestamp,
B.[FARecordType] as [FARecordType],

a.[PREMIER_FINAL_VALUE],
a.[PREMIER_HIGH_VALUE],
a.[PREMIER_LOW_VALUE],
a.[PREMIER_CONFIDENCE_SCORE],
a.[PREMIER_FORECAST_STANDARD_DEVIATION],

a.[DIRECT_FINAL_VALUE],
a.[DIRECT_HIGH_VALUE],
a.[DIRECT_LOW_VALUE],
a.[DIRECT_CONFIDENCE_SCORE],
a.[DIRECT_FORECAST_STANDARD_DEVIATION],

a.[POWER_FINAL_VALUE],
a.[POWER_HIGH_VALUE],
a.[POWER_LOW_VALUE],
a.[POWER_CONFIDENCE_SCORE],
a.[POWER_FORECAST_STANDARD_DEVIATION],

--B.DTDB_Ref_ID,
--B.DTDB_UNFORMATTED_APN,
--B.DTDB_FORMATTED_APN,

-----Added 20220721 for Costar
--B.CS_FORMATTED_APN,
--B.CS_UNFORMATTED_APN,

-----Added 20221021 for Type--
case when a.[PREMIER_FINAL_VALUE] > 0 then 'PREMIER'
	 when ISNULL(a.[PREMIER_FINAL_VALUE],'0') like '0' and a.[POWER_FINAL_VALUE] > 0 then 'POWER'
	 when ISNULL(a.[PREMIER_FINAL_VALUE],'0') like '0' and ISNULL(a.[POWER_FINAL_VALUE],'0') like '0' 
	 and a.[DIRECT_FINAL_VALUE] > 0 then 'DIRECT'
	 else NULL end
	 as  [AVM_TYPE]

-------Added per BR for FULL LAYOUT to REMOVE PREMIER from cascade!!----
,CASE WHEN isNULL(B.TotalOpenLienAmt,0) = 0 THEN NULL 
WHEN coalesce(CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END) IS NULL THEN NULL 
WHEN Convert(Money,B.[TotalOpenLienAmt]) / Convert(Money,coalesce(CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END)) > 1.5 THEN NULL 
WHEN Convert(Money,B.[TotalOpenLienAmt]) / Convert(Money,coalesce(CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END)) < 0.004 THEN NULL 
ELSE CONVERT(numeric(5, 2), Convert(Money,B.TotalOpenLienAmt) / Convert(Money,coalesce(CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END)) * 100) 
END AS CLTV_FULL

,CASE WHEN  isNULL(convert(bigint,b.[Mtg1EstLoanBalance]),0) = 0 THEN NULL 
WHEN coalesce(CASE WHEN A.[POWER_FINAL_VALUE] = 0 THEN NULL ELSE A.[POWER_FINAL_VALUE] END,CASE WHEN A.[DIRECT_FINAL_VALUE] = 0 THEN NULL ELSE a.[DIRECT_FINAL_VALUE] END) IS NULL THEN NULL 
WHEN (isNULL(convert(money,b.[Mtg1EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg2EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg3EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg4EstLoanBalance]),0)) / (coalesce(CASE WHEN convert(money,A.[POWER_FINAL_VALUE]) = 0 THEN NULL ELSE convert(money,A.[POWER_FINAL_VALUE]) END,CASE WHEN convert(money,A.[DIRECT_FINAL_VALUE]) = 0 THEN NULL ELSE convert(money,a.[DIRECT_FINAL_VALUE]) END)) > 1.5 THEN NULL 
WHEN (isNULL(convert(money,b.[Mtg1EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg2EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg3EstLoanBalance]),0) + isNULL(convert(money,b.[Mtg4EstLoanBalance]),0)) / (coalesce(CASE WHEN convert(money,A.[POWER_FINAL_VALUE]) = 0 THEN NULL ELSE convert(money,A.[POWER_FINAL_VALUE]) END,CASE WHEN convert(money,A.[DIRECT_FINAL_VALUE]) = 0 THEN NULL ELSE convert(money,a.[DIRECT_FINAL_VALUE]) END)) < 0.004 THEN NULL 
ELSE CONVERT(numeric(5,2), (ISNULL(CAST(b.[Mtg1EstLoanBalance] AS money),0) + isNULL(CAST(b.[Mtg2EstLoanBalance] AS money),0) + isNULL(CAST(b.[Mtg3EstLoanBalance] AS money),0) + isNULL(CAST(b.[Mtg4EstLoanBalance] AS money),0)) / (coalesce(CASE WHEN convert(money,A.[POWER_FINAL_VALUE]) = 0 THEN NULL ELSE convert(money,A.[POWER_FINAL_VALUE]) END,CASE WHEN convert(money,A.[DIRECT_FINAL_VALUE]) = 0 THEN NULL ELSE convert(money,a.[DIRECT_FINAL_VALUE]) END)) * 100)
END AS CLBTV_FULL

,case  when  a.[POWER_FINAL_VALUE] > 0 then 'POWER'
	 when  ISNULL(a.[POWER_FINAL_VALUE],'0') like '0' 
	 and a.[DIRECT_FINAL_VALUE] > 0 then 'DIRECT' 
	 else NULL end
	 as  [AVM_TYPE_FULL]

,B.[FATimeStamp] as LienPosUpdateDate,

----Added 20231018---
B.[Mtg1EstPaymentAmount]  as Mtg1EstPaymentAmount,
B.[Mtg2EstPaymentAmount]  as Mtg2EstPaymentAmount,
B.[Mtg3EstPaymentAmount]  as Mtg3EstPaymentAmount,
B.[Mtg4EstPaymentAmount]  as Mtg4EstPaymentAmount
--Select COUNT(*)
--FROM [Holocron].[dbo].[Holocron] a with(NOLOCK) JOIN [Data].[dbo].[Property] b with(NOLOCK)

FROM [AZUVPSQLADSF006.datatree.local].Holocron.[dbo].[PROCISION_AVM_YEARLY_2024] a  with(NOLOCK)

JOIN Data.dbo.Property p with(NOLOCK) on RIGHT('0' + a.Fips,5) = p.FIPS and a.REF_ID = p.DTDB_Ref_ID

JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20240126] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20240227] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20240329] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20240429] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20240529] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20240627] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20240727] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20240827] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20240927] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20241029] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID  ---- DONT RUN UNTIL I LOAD DATA
--JOIN [AZUVPSQLADSF008].[Snapshot].[dbo].[Snapshot_20241127] b with(NOLOCK) ON p.FIPS = b.FIPS and b.PropertyID = p.PropertyID
where 
(
----Removed 20221102 as we removed this value from cascade for Full-----
--a.[PREMIER_FINAL_VALUE] > 0 OR
a.[DIRECT_FINAL_VALUE] > 0 OR
a.[POWER_FINAL_VALUE] > 0
)

-------20221020 - Added per BR----
and B.[TotalOpenLienAmt] > 0

and CAST(A.value_as_of as DATE) = '2024-01-30'
--and CAST(A.value_as_of as DATE) = '2024-02-25'
--and CAST(A.value_as_of as DATE) = '2024-03-26'
--and CAST(A.value_as_of as DATE) = '2024-04-30'
--and CAST(A.value_as_of as DATE) = '2024-05-31'
--and CAST(A.value_as_of as DATE) = '2024-06-28'
--and CAST(A.value_as_of as DATE) = '2024-07-31'
--and CAST(A.value_as_of as DATE) = '2024-08-30'
--and CAST(A.value_as_of as DATE) = '2024-09-25'
--and CAST(A.value_as_of as DATE) = '2024-10-30'  ---- DONT RUN UNTIL I LOAD DATA
--and CAST(A.value_as_of as DATE) = '2024-11-25'



