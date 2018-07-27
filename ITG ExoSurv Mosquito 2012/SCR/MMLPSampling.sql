Drop view exosurvMMLPLatinSampling;
create view exosurvMMLPLatinSampling as

SELECT *		
		
FROM IdentificationMMLP
	 LEFT join MMLP_LatinSamplingJoined  ON  MMLP_LatinSamplingJoined.SamplingCode = IdentificationMMLP.SamplingCode
	 LEFT join SiteForm ON SiteForm.SiteCode = MMLP_LatinSamplingJoined.SiteCode
