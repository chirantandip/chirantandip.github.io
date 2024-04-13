
name=cv

mdfile=./${name}.md
pdffile=./${name}.pdf
htmlfile=./${name}.html

pandoc=/usr/bin/pandoc

all: md2html

md2pdf:
	 ${pandoc} -H ./assets/cv_md2pdf.sty -s ${mdfile} -o ${pdffile}

md2html:
	${pandoc} -H ./assets/css/cv.css -s ${mdfile} -o ${htmlfile}

clean:
	rm *.pdf *.html