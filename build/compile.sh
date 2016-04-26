#!/bin/sh

#loop through cur dir and convert to html
find ./ -iname "*.md" -type f -exec sh -c 'pandoc "${0}" -o "${0%.md}.html"' {} \;

pandoc $1 -0 $1.pdf
wkhtmltopdf --footer-center [page] --header-left 'Pavillion Orientation [doctitle]' --header-spacing='1cm'  --header-right '[page]/[toPage]'  --header-line --margin-top '1cm'  

##loop through and convert to pdf
find ./ -iname "*.html" -type f -exec sh -c 'cat /srv/camporamasop/sop/resources/img/style.html | cat - ${0} > /tmp/foo && mv /tmp/foo ${0}' {} \;
find ./ -iname "*.html" -type f -exec sh -c 'wkhtmltopdf "${0}" "${0%.html}.pdf"' {} \;
