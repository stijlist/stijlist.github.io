basename=$(basename $2)
redo-ifchange "posts/$basename.md"

POST="posts/$basename.md"
# POST="../posts/$2.md"

./post-date.sh "$POST" > date.temp
./post-title.sh "$POST" > title.temp
read DATE < date.temp
read TITLE < title.temp
tail -n +5 "$POST" > md.temp
cmark --to html md.temp > html.temp
cat head.html header.html post_preamble.html html.temp post_postamble.html footer.html | sed -e "s/%PAGE-TITLE%/$TITLE/g" -e "s/%POST-DATE%/$DATE/g" -f site-variables.sed
rm date.temp title.temp md.temp html.temp
