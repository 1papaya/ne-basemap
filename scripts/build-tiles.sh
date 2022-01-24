#!/bin/bash

rm -rf docs/
mkdir -p docs/

./bin/tippecanoe --drop-densest-as-needed \
    --force \
    --no-tile-compression \
    --output-to-directory="docs/" \
    --maximum-zoom=10 \
    --named-layer=adm0_lines:data/ne_10m_admin_0_boundary_lines_land/ne_10m_admin_0_boundary_lines_land.geojson \
    --named-layer=adm1_lines:data/ne_10m_admin_1_states_provinces_lines/ne_10m_admin_1_states_provinces_lines.geojson \
    --named-layer=places:data/ne_10m_populated_places/ne_10m_populated_places.geojson