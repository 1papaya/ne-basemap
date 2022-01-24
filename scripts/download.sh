#!/bin/bash

adm0="ne_10m_admin_0_boundary_lines_land"
adm1="ne_10m_admin_1_states_provinces_lines"
plce="ne_10m_populated_places"

lyrs=( "$adm0" "$adm1" "$plce")

mkdir -p data/
cd data

for lyr in "${lyrs[@]}"
do
    echo "${lyr}"

    mkdir -p ${lyr}
    wget --quiet --no-clobber -P "${lyr}" "https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/$lyr.zip"
    unzip -qq -n "${lyr}/${lyr}.zip" -d "${lyr}"
    
done
