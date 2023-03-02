#!/bin/bash

# 遍歷目錄中的所有影像檔案
for file in *.jpg *.jpeg *.JPG *.JPEG *.png *.PNG *.bmp *.BMP *.gif *.GIF; do

    # 檢查檔案是否存在
    if [ -f "$file" ]; then
        
        # 從照片中的exif資訊中提取日期時間
        datetime=$(exiftool -d "%y%m%d_%H%M" -DateTimeOriginal "$file" | cut -c 35-44)
        
        # 將檔案名稱改成 YYMMDD_hhmm.jpg 格式
        new_filename="${datetime}.jpg"
        
        # 確認新的檔案名稱不存在，再進行更名
        if [ ! -f "$new_filename" ]; then
            mv "$file" "$new_filename"
        fi
        
    fi
    
done
