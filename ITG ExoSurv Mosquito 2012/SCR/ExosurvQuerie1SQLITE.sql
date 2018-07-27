Drop view exosurvSiteInfo;
create view exosurvSiteInfo as
SELECT SiteForm.[SiteCode] as [locationIDSiteCode]
	, SiteForm.[SiteName] as [locality]
	, BreedingSiteForm.[Latitutde] as [decimalLatitudeSiteForm]
	, BreedingSiteForm.[Longitude] as [decimalLongitudeSiteForm]
	, SiteForm.[comments]
	, SiteForm.[landCoverLevel1]
	, BreedingSiteCode as [locationIDBreedingSiteCode]
	, BreedingSiteForm.[LandCoverLevel1] as [landcoverlevel1BreedingSiteForm]
	, BreedingSiteForm.[Municipality]
	, LarvalHabitatSurface
	
	
FROM SiteForm
	 LEFT join BreedingSiteForm  ON BreedingSiteForm.[Sitecode] = SiteForm.[SiteCode]
	 LEFT join SubsiteForm on SubsiteForm.SiteCode = SiteForm.SiteCode ;
	 
	 