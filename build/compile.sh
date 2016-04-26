#!/bin/sh

FILE=manifest.txt

rm -rf all.md

cat $FILE | while read LINE

do


cat $LINE >> all.md
printf "\n" >> all.md

done

pandoc all.md -o all.html

cat /srv/camporamasop/sop/resources/img/style.html | cat - all.html > /tmp/foo && rm -rf all.html && mv /tmp/foo all.html
wkhtmltopdf all.html all.pdf
rm -rf all.html
rm -rf all.md


