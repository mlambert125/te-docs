.DEFAULT_GOAL := all

all: $(patsubst %.md, html/%.html, $(wildcard *.md))

pdfs/%.pdf: %.md
	marp $< --pdf --allow-local-files --output $@

html/%.html: %.md
	marp $< --html--allow-local-files --output $@

clean:
	rm -rf pdfs
