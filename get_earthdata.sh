#!/bin/bash

wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_boundary_lines_land.zip
unzip ne_110m_admin_0_boundary_lines_land.zip
rm ne_110m_admin_0_boundary_lines_land.zip

wget https://osmdata.openstreetmap.de/download/simplified-water-polygons-split-3857.zip
unzip simplified-water-polygons-split-3857.zip
rm simplified-water-polygons-split-3857.zip

wget https://osmdata.openstreetmap.de/download/water-polygons-split-3857.zip
unzip water-polygons-split-3857.zip
rm water-polygons-split-3857.zip

wget https://osmdata.openstreetmap.de/download/antarctica-icesheet-polygons-3857.zip
unzip antarctica-icesheet-polygons-3857.zip
rm antarctica-icesheet-polygons-3857.zip

wget https://osmdata.openstreetmap.de/download/antarctica-icesheet-outlines-3857.zip
unzip antarctica-icesheet-outlines-3857.zip
rm antarctica-icesheet-outlines-3857.zip

