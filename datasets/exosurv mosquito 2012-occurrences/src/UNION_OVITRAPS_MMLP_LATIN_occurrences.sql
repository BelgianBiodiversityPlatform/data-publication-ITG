Drop table UNION_OVITRAPS_MMLP_LATIN_occurrences;
create table Sampling_UNION_OVITRAPS_MMLP_LATIN_occurrences as

SELECT *
    , 'Ovitrap' as samplingProtocol
FROM IdentificationOvitraps
--WHERE Presencemosquitoes = 1
UNION 

SELECT  *
	, 'noCode' as subSiteCode
	, 'not relevant' as EclosiondateAdultLarvae
	, 'MosquitoMagnet' as samplingProtocol
FROM IdentificationMMLP



