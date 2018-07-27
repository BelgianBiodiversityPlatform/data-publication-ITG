Drop view exosurvMMLPSampling;
create view exosurvMMLPSampling as

SELECT *		
		
FROM IdentificationMMLP
	 LEFT join SamplingMMLP  ON  SamplingMMLP.SamplingCode = IdentificationMMLP.SamplingCode
	 LEFT join SiteForm ON SiteForm.SiteCode = SamplingMMLP.SiteCode
