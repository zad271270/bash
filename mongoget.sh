#!/bin/sh

# link a las apis de DBs de IBM cloud
# https://cloud.ibm.com/apidocs/resource-controller/resource-controller#get-resource-instance
#crn de la base de mongo en ibm cloud
# crn:v1:bluemix:public:databases-for-mongodb:us-east:a/7411e6f2e656483fb6469638fa7d0411:d715e596-4dab-435c-85da-cccd28ca9115::

export IBM_APIKEY=`cat apikey.json|jq -j ".apikey"`
export BT=`curl -s -X POST  "https://iam.cloud.ibm.com/identity/token"  -H "Content-Type: application/x-www-form-urlencoded"  -H "Accept: application/json"  -d "grant_type=urn%3Aibm%3Aparams%3Aoauth%3Agrant-type%3Aapikey&apikey=$IBM_APIKEY" | jq -j ".access_token"`
curl -X GET https://resource-controller.cloud.ibm.com/v2/resource_instances/d715e596-4dab-435c-85da-cccd28ca9115 -H "Authorization: Bearer $BT"|jq -j ".state"