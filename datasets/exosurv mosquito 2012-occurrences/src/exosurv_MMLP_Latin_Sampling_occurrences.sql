Drop view exosurvMMLPLatinSampling;
create view exosurvMMLPLatinSampling as

SELECT IdentificationMMLP.SamplingCode as samplingID
		,IdentificationMMLP.Genus as genus
		,IdentificationMMLP.Sex as sex
		,IdentificationMMLP.Species as specificEpithet
		,IdentificationMMLP.Tubenumber as occurrenceID
		,IdentificationMMLP.Comments as occurrenceRemarks
		,IdentificationMMLP.DateID as dateIdentified
		,IdentificationMMLP.Number as individualCount
		,'Isra Deblauwe' as identifiedBy
		,SiteForm.Latitutde as decimalLatitude
		,SiteForm.Longitude as decimalLongitude
		,SiteForm.Municipality as municipality
		,SiteForm.Comments as comments		

		
FROM IdentificationMMLP
	 LEFT join MMLP_LatinSamplingJoined  ON  MMLP_LatinSamplingJoined.SamplingCode = IdentificationMMLP.SamplingCode
	 LEFT join SiteForm ON SiteForm.SiteCode = MMLP_LatinSamplingJoined.SiteCode
	 
