#!/bin/bash

# Collect data
echo Collecting data from repositories ...
mkdir pren-et
for i in bldc dc doc frdm stepper
do
    gource --output-custom-log $i.txt ../../$i
    sed -i -r "s#(.+)\|#\1|/$i#" $i.txt
done

cat *.txt | sort -n > pren-et/log.txt

# start gource ...
echo Starting gource ...
#time gource -i 0 -s 0.1 --key --hide filenames,dirnames --hide-root --title "PREN-ET" --stop-at-end pren-et/log.txt
time gource -i 0 -s 0.1 --key --hide filenames --bloom-multiplier 0.25 --bloom-intensity 0.25 --title "PREN-ET" --stop-at-end pren-et/log.txt

echo done
