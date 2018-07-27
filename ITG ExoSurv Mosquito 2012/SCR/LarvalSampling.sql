Drop view exosurvLarvalSampling;
create view exosurvLarvalSampling as
SELECT Identificationlarvalsampling.SamplingCode as samplingID
		,Identificationlarvalsampling.Genus as genus
		,Identificationlarvalsampling.lifeStage as lifeStage
		,Identificationlarvalsampling.BreedingSiteCode as locationID
		,Identificationlarvalsampling.Sex as sex
		,Identificationlarvalsampling.Species as scientificName
		,Identificationlarvalsampling.Tubenumber
		,Identificationlarvalsampling.Comments as occurrenceRemarks
		,Identificationlarvalsampling.DateID as dateIdentified
		,Identificationlarvalsampling.Number as individualCount
		,'Isra Deblauwe' as identifiedBy
		
FROM Identificationlarvalsampling
	 LEFT join LarvalSampling  ON LarvalSampling.SamplingCode = Identificationlarvalsampling.SamplingCode
	 LEFT join BreedingSiteForm ON BreedingSiteForm.BreedingSiteCode = Identificationlarvalsampling.BreedingSiteCode
	 left join SubsiteForm ON SubsiteForm.Subsitecode = LarvalSampling.SubsiteCode