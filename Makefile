all:
	pandoc index.md -f markdown -t html -o index.html
