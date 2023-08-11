#!/bin/bash

read -p "Bir dosya adı girin: " fname

BBlue='\033[1;34m'
NC='\033[0m'
fname="$fname.txt"

isExist=$(find . -maxdepth 1 -type f -exec basename {} \; | cut -c 18- | grep -E "^$fname" | wc -l)

if [ $isExist -gt 0 ]; then
    echo "$fname dosyasının içeriği:"
    fname=$(find . -maxdepth 1 -type f -exec basename {} \; | grep -E "*_$fname" | awk '{ print length, $0 }' | sort -n | head -n 1 | cut -d ' ' -f 2-)
    start=1;
    while IFS= read -r line; do
	    echo -ne "${BBlue}${start}:${NC} $line"
	    echo -e '\n'
	    ((start++))
    done < "$fname"
else
    echo "$fname dosyası bulunamadı. Oluşturuluyor..."
    
    dateHour=$(date +"%Y-%m-%d_%H-%M")
    
    touch "${dateHour}_$fname"

    for i in {1..3}; do
        cName="${dateHour}_copy${i}_${fname}"
        cp "${dateHour}_$fname" "$cName"
        echo "$cName oluşturuldu"
    done
fi
