
mdfile=./cv.md
pdffile=./cv.pdf
htmlfile=./cv.html

all: md2html

mdcss2pdf:
	pandoc -t html --css ./assets/css/mdpdf.css ${mdfile} -o ${pdffile}

md2pdf:
	 pandoc -H ./assets/cv_md2pdf.sty -s ${mdfile} -o ${pdffile}

md2html:
	pandoc -H ./assets/css/cv.css -s ${mdfile} -o ${htmlfile}