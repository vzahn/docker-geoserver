#!/bin/bash

for pbf in maps/*.pbf
do
	echo "#############################################################################################"
	echo "Importing " . $pbf . " into database " . $database . " at server " . $pg_server
        ./imposm-0.8.1-linux-x86-64/imposm import --config import.config -read $pbf -appendcache
done

echo "Optimizing tables ..."
./imposm-0.8.1-linux-x86-64/imposm import --config import.config -optimize

echo "Writing to database ... "
./imposm-0.8.1-linux-x86-64/imposm import --config import.config -write

