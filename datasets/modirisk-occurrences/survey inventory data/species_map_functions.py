import pandas as pd
import folium as fl

def species_on_map(df, background='Stamen Terrain'):
    """plot species occurrences on a map with markers
    
    Parameters
    ----------
    df: Pandas.DataFrame
        dataframe with DarwinCore terms. For coorindates, the column names decimalLatitude and decimalLongitude will be used.
    background: str
        valid name for folium background tiles
    """
    map_1 = fl.Map(location=df[['decimalLatitude', 'decimalLongitude']].mean().values.tolist(),
                   zoom_start=8,
                   tiles=background)
    
    # remove Nan coordinate values as folium skips all points after Nan
    df = df[df[['decimalLatitude', 'decimalLongitude']].notnull().sum(axis=1) != 0]
    
    for ids, row in df.iterrows():
        fl.Marker(row[['decimalLatitude', 'decimalLongitude']].values.tolist(), 
                   popup=fol.Popup(row["scientificName"])).add_to(map_1)
    print(ids, "markers printed.")
    return map_1


def clustered_species_on_map(df, tile_set="OpenStreetMap"):
    """make folium clustermap of species from dwc
    
    Using DwC standard 
    
    Parameters
    ----------
    df : pd.data.frame according to dwc standard, need to have decimalLatitude, decimalLongitude and scientificName columns
    tile_set : str default OpenStreetMap; for alternative options, see http://python-visualization.github.io/folium/modules.html#module-folium.map
    
    Returns
    -------
    folium.folium.Map
    
    """
    make_a_map = fl.Map(tiles=tile_set)
    df = core_df[core_df[['decimalLatitude', 'decimalLongitude']].notnull().sum(axis=1) != 0]
    lons = df["decimalLongitude"].values
    lats = df["decimalLatitude"].values

    locations = np.vstack((lats, lons)).transpose()  #list(zip(lats, lons))
    locations = locations.reshape(int(locations.size/2), 2)
    popups = df['scientificName']

    make_a_map.add_children(MarkerCluster(locations=locations, popups=popups))
    make_a_map.fit_bounds([(min(lats), min(lons)), (max(lats), max(lons))])
    return(make_a_map)
