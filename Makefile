.DEFAULT_GOAL := all

all: $(patsubst %.md, pdfs/%.pdf, $(wildcard *.md))

pdfs/%.pdf: %.md
	marp $< --pdf --allow-local-files --output $@

clean:
	rm -rf pdfs
