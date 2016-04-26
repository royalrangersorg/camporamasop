#!/bin/sh
# wkhtmltopdf --footer-center [page] --header-left 'Pavillion Orientation [doctitle]' --header-spacing='1cm'  --header-right '[page]/[toPage]'  --header-line --margin-top '1cm'  or.html or.pdf 
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


