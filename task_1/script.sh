#!/bin/bash

read -p "Bir dosya adı girin: " fname

if [ -f "$fname" ]; then
    echo "$fname dosyasının içeriği:"
    cat "$fname"
else
    echo "$fname dosyası bulunamadı. Oluşturuluyor..."
    touch "$fname"

    dateHour=$(date +"%Y-%m-%d_%H-%M")

    for i in {1..3}; do
        cName="${dateHour}_${fname}_kopya$i"
        cp "$fname" "$cName"
        echo "$cName oluşturuldu"
    done
fi
