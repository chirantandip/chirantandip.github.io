
MD_FILES:=$(shell find . -maxdepth 1 -type f -name "*.md")
HTML_FILES:= $(MD_FILES:%.md=%.html)

NOTES_MD = $(shell find ./notes -type f -name "*.md")
NOTES_HTML = $(NOTES_MD:%.md=%.html)

pandoc   =/usr/bin/pandoc
mathopts =--mathml
bibcmd   =-M link-citations=true --csl=assets/bibref/aaps-open.csl --bibliography=assets/bibref/ref.bib
stylehtml=--template=assets/template.html


all: $(NOTES_HTML) $(HTML_FILES)

notes/%.html: notes/%.md assets/notes_template.html
	${pandoc} ${bibcmd} --template=assets/notes_template.html ${mathopts} -s $< -o $@


cv.html: cv.md assets/cv_template.html
	${pandoc} --template=assets/cv_template.html  -s $< -o $@
	rm assets/cv_template.html

%.html: %.md assets/template.html
	${pandoc} ${stylehtml} -s $< -o $@

assets/%.html: assets/base/%.html 
	sed '/^NAVBAR$$/r assets/base/navbar.html' $< | sed '/^NAVBAR$$/d' > $@

clean:
	rm -f $(HTML_FILES) $(NOTES_HTML)
