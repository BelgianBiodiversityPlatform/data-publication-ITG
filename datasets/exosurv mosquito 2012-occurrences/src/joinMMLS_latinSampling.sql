Drop view MMLP_LatinSamplingJoined;
create table MMLP_LatinSamplingJoined as
select 
     SamplingCode
	,SiteCode
	,TrapCode
	,StartDate
	,EndDate
	,'MMLP' as samplingProtocol 

FROM SamplingMMLP
WHERE Presencemosquitoes = 1
UNION 

SELECT  
	 SamplingCode
	,SiteCode
	,TrapCode
	,StartDate
	,EndDate
	, 'LatinSquare' as samplingProtocol

FROM SamplingLatinSquareDesign

Order By SamplingCode