redo-ifchange "$2.md"

./post-date.sh "$2.md" > date.temp
./post-title.sh "$2.md" > title.temp
read DATE < date.temp
read TITLE < title.temp
tail -n +5 "$2.md" > md.temp
cmark --to html md.temp > html.temp
cat head.html header.html html.temp footer.html | sed -e "s/%PAGE-TITLE%/$TITLE/g" -e "s/%POST-DATE%/$DATE/g" -f site-variables.sed
rm date.temp title.temp md.temp html.temp
