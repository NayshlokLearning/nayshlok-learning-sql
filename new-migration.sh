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
if [ "$LARGEST_VERSION" -lt "$BASE_NEW_VERSION" ]; then
  NEW_VERSION=$(($BASE_NEW_VERSION))
else
  NEW_VERSION=$(($LARGEST_VERSION+1))
fi
FILENAME=./migrations/V"$NEW_VERSION"__NewMigration.sql
TIME=`date +%F_%T`
touch "$FILENAME"
echo "-- =====================================" >> "$FILENAME"
echo "-- Author: " >> "$FILENAME"
echo "-- Date: $TIME" >> "$FILENAME"
echo "-- Description: " >> "$FILENAME"
echo "-- =====================================" >> "$FILENAME"
echo "" >> "$FILENAME"
echo "START TRANSACTION;" >> "$FILENAME"
echo "" >> "$FILENAME"
echo "ROLLBACK;" >> "$FILENAME"
