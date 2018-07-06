#!/bin/bash

FILE="./migrations"
REGEX=".*V([0-9]+)__.*\.sql"
BASE_NEW_VERSION=9000000

LARGEST_VERSION=0
ALL_VERSION=()
for f in "$FILE"/*; do
    if [[ $f =~ $REGEX ]]; then
        
        VERSION=${BASH_REMATCH[1]}
        ALL_VERSION+=($VERSION)
        if [ "$VERSION" -gt "$LARGEST_VERSION" ]; then
            LARGEST_VERSION=$VERSION
        fi
    fi
done

echo ${ALL_VERSION[*]}
NEW_VERSION=$(($LARGEST_VERSION+1))