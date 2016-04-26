#!/bin/sh

pandoc $1 -0 $1.pdf
wkhtmltopdf --footer-center [page] --header-left 'Pavillion Orientation [doctitle]' --header-spacing='1cm'  --header-right '[page]/[toPage]'  --header-line --margin-top '1cm'  
