
CREATE VIEW exosurvIdentificationMMLPoVitrap_occurrences as
SELECT occurrenceID
	,sampleID as eventID
	,subsiteCode 
	,lifeStage
	,genus
	,genus || ' ' || specificEpithet as scientificName
    ,case sex 
			when 'F' then 'female'
			When 'M' then 'male'
			Else 'unknown'
			end as sex
	,individualCount
	,identifiedBy
	,SiteForm.SiteCode as siteCode
	,UNION_OVITRAPS_MMLP_LATIN_occurrences.samplingProtocol
	,Trapcode
	,Startdate as eventDate
	,StartDate || '/' || EndDate as verbatimEventDate
	,SiteName as locality
	,Municipality as municipality
	,Longitude as decimalLongitude
	,Latitude as decimalLatitude
--SELECT *
FROM UNION_OVITRAPS_MMLP_LATIN_occurrences
LEFT JOIN UNION_OVITRAPS_MMLP_LATIN_sampling ON UNION_OVITRAPS_MMLP_LATIN_sampling.SamplingCode = UNION_OVITRAPS_MMLP_LATIN_occurrences.sampleID
LEFT JOIN SiteForm ON SiteForm.SiteCode = UNION_OVITRAPS_MMLP_LATIN_sampling.SiteCode