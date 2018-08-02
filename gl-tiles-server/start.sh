#!/usr/bin/env bash
stateFile="state.txt"
planetFileBZ2="history-latest.osm.bz2"
planetFileOSM="history-latest.osm"
# Creating a gcloud-service-key to authenticate the gcloud
if [ $STORAGE == "GS" ]; then
echo $GCLOUD_SERVICE_KEY | base64 --decode --ignore-garbage > gcloud-service-key.json
/root/google-cloud-sdk/bin/gcloud --quiet components update
/root/google-cloud-sdk/bin/gcloud auth activate-service-account --key-file gcloud-service-key.json
/root/google-cloud-sdk/bin/gcloud config set project $GCLOUD_PROJECT
fi

# Getting the latest planet data
if [ $STORAGE == "S3" ]; then 
    # Get the state.txt file from S3
    aws s3 cp $S3_OSM_PATH/planet/full-history/$stateFile .
    filePath=$(head -n 1 $stateFile)
    aws s3 cp $filePath $planetFileBZ2
fi

# Google Storage
if [ $STORAGE == "GS" ]; then 
    # Get the state.txt file from GS
    echo "---------------------------------"
    echo $GS_OSM_PATH/planet/full-history/$stateFile
    gsutil cp $GS_OSM_PATH/planet/full-history/$stateFile .
    filePath=$(head -n 1 $stateFile)
    echo "========================================================="
    echo $filePath
    gsutil cp $filePath $planetFileBZ2
fi

bzip2 -d $planetFileBZ2
osmtogeojson $planetFileOSM > $planetFileOSM.geojson
tippecanoe -l osm -n osm-latest -o $planetFileOSM.mbtiles -z12 -Z12 -psfk $planetFileOSM.geojson
tileserver-gl $planetFileOSM.mbtiles