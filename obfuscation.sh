#!/bin/bash
# version 1.4
if [ $# -eq 0 ]
        then
        echo "No arguments supplied, please supplied the directory"
        exit 0
fi

for file in $1/*
do
FileRenamed="${file%.log}_obfuscated.log"
        if  [[  "$file" ==  *`date +'%Y-%m-%d'`*.log ]] && [[ "$file" != *obfuscated.log ]]; then
#        if [[ -s "$file" && ${file: -4} == ".log" ]] && [["$file" != "obfuscated.log"]]; then
                if [ ! -f "$FileRenamed" ]; then
                         echo -e "\n Create a copy of $file"
                        cp "$file" "$FileRenamed"
                else
                        echo -e "\n Delete old $FileRenamed"
                        rm "$FileRenamed"
                        echo -e "\n Create a copy of $file"
                        cp "$file" "$FileRenamed"
                fi
                if [[  "$FileRenamed" ==  *`date +'%Y-%m-%d'`*.log ]] ; then
                        ds=`date '+%d/%m/%Y %H:%M:%S'`
                        echo -e "\n Start obfuscation process in file: $FileRenamed at $ds"
                        perl -p -i -e 's/((?<=plainPassword:\s)|(?<=Authorization=B)|(?<=Authorization Bearer\s)|(?<=Authorization Basic\s)|(?<=encrypted Pass:\s)|(?<=password=)|(?<=client_id=)|(?<=Bearer Exitosamente:\s)|(?<="access_token":")|(?<="password":"))\w+[A-Za-z0-9\-\_\s]+/*****/g' $file
                        de=`date '+%d/%m/%Y %H:%M:%S'`
                        echo -e "\n Done obfuscation in file: $FileRenamed at $de"
                fi
        fi
done