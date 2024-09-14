redo-ifchange "$2.md"

dateprefix=`echo $2.md | grep -Eo '[[:digit:]]+-[[:digit:]]+-[[:digit:]]+'`
date -j -f "%F" $dateprefix +"%B %d, %Y" > date.temp
grep title: "$2.md" | sed -e 's/title: //g' > title.temp
read DATE < date.temp
read TITLE < title.temp
tail -n +5 "$2.md" > md.temp
cmark --to html md.temp > html.temp
cat head.html header.html html.temp footer.html | sed -e "s/%PAGE-TITLE%/$TITLE/g" -e "s/%POST-DATE%/$DATE/g" -f site-variables.sed
rm date.temp title.temp md.temp html.temp
