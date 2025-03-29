
MD_FILES:=$(shell find . -maxdepth 1 -type f -name "*.md")
HTML_FILES:= $(MD_FILES:%.md=%.html)

NOTES_MD = $(shell find notes -type f -name "*.md")
NOTES_HTML =$(NOTES_MD:%.md=%.html)

pandoc   =/usr/bin/pandoc
mathopts =--mathjax
bibcmd   =-M link-citations=true --csl=assets/bibref/aaps-open.csl --bibliography=assets/bibref/ref.bib

all: $(NOTES_HTML) $(HTML_FILES)

notes/%.html: notes/%.md assets/notes_template.html assets/css/notes-style.css
	${pandoc} ${bibcmd} --template=assets/notes_template.html ${mathopts} -s $< -o $@

cv.html: cv.md assets/cv_template.html assets/css/cv-style.css
	${pandoc} --template=assets/cv_template.html  -s $< -o $@
	rm assets/cv_template.html

index.html: index.md assets/index_template.html
	${pandoc} --template=assets/index_template.html -s $< -o $@
	rm assets/index_template.html

fluids.html: fluids.md assets/fluids_template.html
	${pandoc} --template=assets/fluids_template.html -s $< -o $@
	rm assets/fluids_template.html

%.html: %.md assets/%_template.html
	$(PANDOC) --template=assets/$*_template.html -s $< -o $@
# rm assets/$*_template.html


%.html: %.md assets/template.html
	${pandoc} --template=assets/template.html -s $< -o $@

assets/%.html: assets/base/%.html 
	sed '/^NAVBAR$$/r assets/base/navbar.html' $< | sed '/^NAVBAR$$/d' > tmp.html
	sed '/^FOOTER$$/r assets/base/footer.html' tmp.html | sed '/^FOOTER$$/d' > $@

clean:
	rm -f $(HTML_FILES) $(NOTES_HTML)
