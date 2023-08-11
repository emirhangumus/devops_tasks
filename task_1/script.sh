#!/bin/bash

read -p "Bir dosya adı girin: " fname

fname="$fname.txt"

if [ -f "$fname" ]; then
    echo "$fname dosyasının içeriği:"
    start=1;
    while IFS= read -r line; do
	    echo "$start: $line"
	    ((start++))
    done < "$fname"
else
    echo "$fname dosyası bulunamadı. Oluşturuluyor..."
    touch "$fname"

    dateHour=$(date +"%Y-%m-%d_%H-%M")

    for i in {1..3}; do
        cName="${dateHour}_copy${i}_${fname}"
        cp "$fname" "$cName"
        echo "$cName oluşturuldu"
    done
fi
