
# blogserver depends on having an html file built for every md file.
find files -type f -print0 | sed -e 's/\.md/\.html/g' | xargs -r0 redo-ifchange
redo-ifchange main.go 
go build -o $3
