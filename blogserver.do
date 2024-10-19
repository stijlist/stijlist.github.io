
# blogserver depends on having an html file built for every md file.
find posts -type f -print0 | sed -e 's/posts/files/g' -e 's/\.md/\.html/g' | xargs -r0 redo-ifchange

redo-ifchange about.html index.html head.html header.html footer.html
redo-ifchange main.go 
cp about.html files/about.html
cp index.html files/index.html
go build -o $3
