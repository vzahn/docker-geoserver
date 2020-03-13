#!/bin/bash

mkdir -p data/postgis_data_dir
cd data
tar zxvf ../geoserver_data_dir.tgz

cd geoserver_data_dir/data/earth-data/
./get_earthdata.sh

cd ../../../../


