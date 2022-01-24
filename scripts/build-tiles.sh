#!/bin/bash

rm -rf docs/
mkdir -p docs/

./bin/tippecanoe --drop-densest-as-needed \
    --force \
    --no-tile-compression \
    --output-to-directory="docs/" \
    --maximum-zoom=10 \
    data/ne_10m_admin_0_boundary_lines_land/ne_10m_admin_0_boundary_lines_land.geojson \
    data/ne_10m_admin_1_states_provinces_lines/ne_10m_admin_1_states_provinces_lines.geojson \
    data/ne_10m_populated_places/ne_10m_populated_places.geojson