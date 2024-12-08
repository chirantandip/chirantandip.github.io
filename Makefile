
MD_FILES:=$(shell find . -type f -name "*.md")
HTML_FILES := $(MD_FILES:%.md=%.html)

all: clean $(HTML_FILES)

%.html: %.md
	/usr/bin/pandoc -s $< -o $@ --template=assets/template.html --css=assets/style.css

clean:
	rm -f $(HTML_FILES)
