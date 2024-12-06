
name=cv

mdfile=./${name}.md
pdffile=./${name}.pdf
htmlfile=./${name}.html

pandoc=/usr/bin/pandoc

all: md2html

md2pdf:
	 ${pandoc} -H ./assets/style.sty -s ${mdfile} -o ${pdffile}

md2html:
	${pandoc} -f markdown-auto_identifiers --css ./assets/style.css -s ${mdfile} -o ${htmlfile}

clean:
	rm *.pdf *.html