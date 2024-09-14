# if any markdown files are added, the index needs to include its posts.
find files -type f -regex '.*\.md' -print0 > posts.temp
cat posts.temp | xargs -r0 redo-ifchange

cat head.html header.html | sed -f site-variables.sed
cat <<EOF 
<div class="home">
  <h1 class="page-heading">Posts</h1>

  <ul class="post-list">
EOF

find files -type f -regex '.*\.md' -print | while IFS= read -r post; do
  ./post-date.sh "$post" > date.temp
  ./post-title.sh "$post" > title.temp
  ./post-url.sh "$post" > url.temp
  read DATE < date.temp
  read TITLE < title.temp
  read URL < url.temp
  printf '    <li>\n'
  printf '      <span class="post-meta">%s</span>\n' "$DATE"
  printf '      <h2><a class="post-link" href="%s">%s</a></h2>\n' $URL "$TITLE"
  printf '    </li>\n'
done

cat <<EOF 
  </ul>
</div>
EOF
cat footer.html | sed -f site-variables.sed
rm posts.temp date.temp title.temp url.temp