#!/bin/bash

mkdir -p renamed

for file in *.jpg *.jpeg *.png *.gif; do
    exif_date=$(exiftool -s -s -s -d "%y%m%d_%H%M" -DateTimeOriginal "$file")
    mv "$file" "renamed/$exif_date.jpg"
done
