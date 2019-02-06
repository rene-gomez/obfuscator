#!/bin/bash
# version 1.6
if [ $# -eq 0 ]
        then
        echo "No arguments supplied, please supplied the directory"
        exit 0
fi

for file in $1/*
do
FileRenamed="${file%.log}_obfuscated.log"
        if  [[  "$file" ==  *`date +'%Y-%m-%d'`*.log ]] && [[ "$file" != *obfuscated.log ]]; then
                [ -f "$FileRenamed" ] && rm $FileRenamed
                echo -e "\n Creating a copy of $file"
                cp "$file" "$FileRenamed"
                ds=`date '+%d/%m/%Y %H:%M:%S'`
                echo -e "\n Start obfuscation process in file: $FileRenamed at $ds"
                perl -p -i -e 's/((?<=plainPassword:\s)|(?<=Authorization=B)|(?<=Authorization Bearer\s)|(?<=Authorization Basic\s)|(?<=encrypted Pass:\s)|(?<=password=..)|(?<=client_id=)|(?<=Bearer Exitosamente:\s)|(?<="access_token":")|(?<="password":"..))\w+[A-Za-z0-9\-\_\s]+/*****/g' $FileRenamed
                de=`date '+%d/%m/%Y %H:%M:%S'`
                echo -e "\n Done obfuscation in file: $FileRenamed at $de"
        fi
done