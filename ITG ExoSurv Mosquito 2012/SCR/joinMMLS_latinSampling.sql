Drop view MMLP_LatinSamplingJoined;
create view MMLP_LatinSamplingJoined as
select 
     SamplingCode
	,SiteCode
	,TrapCode
	,StartDate
	,EndDate
	,'MMLP' as samplingProtocol 

FROM SamplingMMLP
WHERE Presencemosquitos 
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