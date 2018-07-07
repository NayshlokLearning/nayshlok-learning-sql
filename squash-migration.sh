#!/bin/bash

FILE="./migrations"
REGEX=".*V([0-9]+)__.*\.sql"
BASE_NEW_VERSION=9000000

LARGEST_VERSION=0
for f in "$FILE"/*; do
    if [[ $f =~ $REGEX ]]; then

        VERSION=${BASH_REMATCH[1]}
        if [ "$VERSION" -lt 9000000 ] && [ "$VERSION" -gt "$LARGEST_VERSION" ]; then
          LARGEST_VERSION=$(($VERSION))
        fi
    fi
done

for f in "$FILE"/*; do
    if [[ $f =~ $REGEX ]]; then

        VERSION=${BASH_REMATCH[1]}
       if [ "$VERSION" -gt 8999999 ]; then
         NEW_VERSION=$(($LARGEST_VERSION+1))
         NEW_FILENAME=${f/$VERSION/$NEW_VERSION}
         echo "old $f"
         echo "new $NEW_FILENAME"
         mv "$f" "$NEW_FILENAME"
         LARGEST_VERSION=$(($NEW_VERSION))
       fi
    fi
done

echo "$LARGEST_VERSION"
