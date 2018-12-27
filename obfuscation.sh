#!/bin/bash
# version 1.3
if [ $# -eq 0 ]
        then
        echo "No arguments supplied, please supplied the directory"
        exit 0
fi

for file in $1/*
do
        if [[ -s "$file" && ${file: -4} == ".log" ]]; then
                ds=`date '+%d/%m/%Y %H:%M:%S'`
                echo -e "\n Start obfuscation process in file: $file at $ds"
                perl -p -i -e 's/((?<=plainPassword:\s)|(?<=Authorization=B)|(?<=Authorization Bearer\s)|(?<=Authorization Basic\s)|(?<=encrypted Pass:\s)|(?<=password=)|(?<=client_id=)|(?<=Bearer Exitosamente:\s)|(?<="access_token":")|(?<="password":"))\w+[A-Za-z0-9\-\_\s]+/*****/g' $file
                de=`date '+%d/%m/%Y %H:%M:%S'`
                echo -e "\n Done obfuscation in file: $file at $de"
        fi
done

 