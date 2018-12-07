#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied, please supplied the directory"
    exit 0
fi
for file in $1/*
do


        if [[ -s "$file" && ${file: -4} == ".log" ]]; then
                echo -e "\n Start obfuscation process in file: $file"
        .       cp $file $file.obfuscated
                grep -oP '((?<=plainPassword:\s)|(?<=Authorization=B)|(?<=password=)|(?<=client_id=)|(?<=Bearer Exitosamente:\s)|(?<="access_token":")|(?<="password":"))\w+[A-Za-z0-9\-\_\s]+' $file.obfuscated|xargs -I '{}' sed -i 's/{}/*****/g' $file.obfuscated
                echo -e "\n Done obfuscation in file: $file"
        fi
done
