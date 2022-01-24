#!/bin/bash

adm0="ne_10m_admin_0_boundary_lines_land"
adm1="ne_10m_admin_1_states_provinces_lines"
plce="ne_10m_populated_places"

lyrs=( "$adm0" "$adm1" "$plce")

cd data

for lyr in "${lyrs[@]}"
do
    echo "${lyr}"

    mkdir -p ${lyr}
    wget --quiet --no-clobber -P "${lyr}" "https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/$lyr.zip"
    unzip -qq -n "${lyr}.zip"

    if [ "${lyr}" == "ne_10m_admin_0_boundary_lines_land" ];
    then

        mapshaper "${lyr}/${lyr}.shp" \
        -drop fields=* \
        -explode \
        -o force geojson-type="FeatureCollection" "${lyr}/${lyr}.geojson" 

    elif [ "${lyr}" == "ne_10m_admin_1_states_provinces_lines" ];
    then

        mapshaper "${lyr}/${lyr}.shp" \
            -filter '"USA,CAN,BRA".indexOf(ADM0_A3) > -1' \
            -explode \
            -drop fields=* \
            -o force geojson-type="FeatureCollection" "${lyr}/${lyr}.geojson"

    elif [ "${lyr}" == "ne_10m_populated_places" ];
    then

        mapshaper "${lyr}/${lyr}.shp" \
            -filter 'SCALERANK <= 2' \
            -filter-fields SCALERANK,NAME \
            -rename-fields rank=SCALERANK,name=NAME \
            -o force geojson-type="FeatureCollection" "${lyr}/${lyr}.geojson"

    fi
    
done
