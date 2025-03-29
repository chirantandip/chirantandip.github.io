## @file Makefile
## @brief Build system for Markdown to HTML conversion using Pandoc.
## 
## This Makefile processes Markdown (`.md`) files in the project root and the `notes/` directory, 
## converting them into corresponding HTML (`.html`) files using Pandoc.
##
## It ensures that HTML files are only updated if their respective Markdown files or templates change.
## Dependencies include templates and CSS files used for styling.
## (AI generated documentation)
##

# List all Markdown files in the current directory
MD_FILES 	:= $(shell find . -maxdepth 1 -type f -name "*.md")

# Define corresponding HTML files
HTML_FILES 	:= $(MD_FILES:%.md=%.html)

# List all Markdown files inside the 'notes' directory
NOTES_MD 	:= $(shell find notes -type f -name "*.md")

# Define corresponding HTML files for 'notes' directory
NOTES_HTML 	:= $(NOTES_MD:%.md=%.html)

# Path to Pandoc executable
pandoc   := /usr/bin/pandoc

# Pandoc options for math rendering
mathopts := --mathjax

# Bibliography command for citations
bibcmd   := -M link-citations=true --csl=assets/bibref/aaps-open.csl --bibliography=assets/bibref/ref.bib

## @brief Default target: Builds all HTML files
all: $(NOTES_HTML) $(HTML_FILES)

## @brief Rule to convert Markdown files in 'notes/' to HTML
## @param notes/%.md The source Markdown file
## @param assets/notes_template.html The HTML template for notes
## @param assets/css/notes-style.css The CSS file for styling
notes/%.html: notes/%.md assets/notes_template.html assets/css/notes-style.css
	${pandoc} ${bibcmd} --template=assets/notes_template.html ${mathopts} -s $< -o $@

## @brief Converts cv.md to cv.html using a specific template and CSS file
cv.html: cv.md assets/cv_template.html assets/css/cv-style.css
	${pandoc} --template=assets/cv_template.html -s $< -o $@

## @brief Converts index.md to index.html using its template
index.html: index.md assets/index_template.html
	${pandoc} --template=assets/index_template.html -s $< -o $@

## @brief Converts fluids.md to fluids.html using its template
fluids.html: fluids.md assets/fluids_template.html
	${pandoc} --template=assets/fluids_template.html -s $< -o $@

## @brief General rule for converting Markdown files with specific templates
## @param %.md Source Markdown file
## @param assets/%_template.html Corresponding template file
%.html: %.md assets/%_template.html
	${pandoc} --template=assets/$*_template.html -s $< -o $@

## @brief General rule for converting Markdown files with a default template
## @param %.md Source Markdown file
## @param assets/template.html Default template file
%.html: %.md assets/template.html
	${pandoc} --template=assets/template.html -s $< -o $@

## @brief Generates assets HTML files by inserting navbar and footer
## @param assets/base/%.html Base template
## @param assets/base/navbar.html Navbar content
## @param assets/base/footer.html Footer content
assets/%.html: assets/base/%.html assets/base/navbar.html assets/base/footer.html
	sed '/^NAVBAR$$/r assets/base/navbar.html' $< | sed '/^NAVBAR$$/d' > tmp.html
	sed '/^FOOTER$$/r assets/base/footer.html' tmp.html | sed '/^FOOTER$$/d' > $@
	rm -f tmp.html

## @brief Clean target: Removes all generated HTML files
clean:
	rm -f $(HTML_FILES) $(NOTES_HTML)
