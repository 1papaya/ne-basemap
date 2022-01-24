#!/bin/bash

cd data/

lyr="ne_10m_admin_0_boundary_lines_land"

mapshaper "${lyr}/${lyr}.shp" \
    -drop fields=* \
    -explode \
    -o force geojson-type="FeatureCollection" "${lyr}/${lyr}.geojson" 

lyr="ne_10m_admin_1_states_provinces_lines"

mapshaper "${lyr}/${lyr}.shp" \
    -filter '"USA,CAN,BRA".indexOf(ADM0_A3) > -1' \
    -explode \
    -drop fields=* \
    -o force geojson-type="FeatureCollection" "${lyr}/${lyr}.geojson"

lyr="ne_10m_populated_places"

mapshaper "${lyr}/${lyr}.shp" \
    -filter 'SCALERANK <= 2' \
    -filter-fields SCALERANK,NAME \
    -rename-fields rank=SCALERANK,name=NAME \
    -o force geojson-type="FeatureCollection" "${lyr}/${lyr}.geojson"
