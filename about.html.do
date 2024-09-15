redo-ifchange about.md
TITLE=About

tail -n +6 about.md > md.temp
cmark --unsafe --to html md.temp > html.temp
cat head.html header.html html.temp footer.html | sed -e "s/%PAGE-TITLE%/$TITLE/g" -e "s/%POST-DATE%/$DATE/g" -f site-variables.sed
rm md.temp html.temp
