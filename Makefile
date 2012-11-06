FILE = presentation

default: $(FILE).out.pdf

edit: ${FILE}.tex
	gvim $<

view: ${FILE}.out.pdf 
	xpdf ${FILE}.out.pdf

acro: ${FILE}.out.pdf
	acroread $<

edit:
	gvim ${FILE}.tex

${FILE}.out.tex: parser.pl ${FILE}.tex 
	perl parser.pl < ${FILE}.tex > ${FILE}.out.tex





${FILE}.out.pdf:	${FILE}.out.ps
	ps2pdf $<
#${FILE}.out.pdf:	${FILE}.out.tex 
#	pdflatex ${FILE}.out.tex
#	bibtex ${FILE}.out
#	pdflatex ${FILE}.out.tex
#	pdflatex ${FILE}.out.tex
${FILE}.out.ps:	${FILE}.out.dvi 
	dvips -T 30cm,22cm $< -o $@
#

$(FILE).out.dvi: $(FILE).out.tex 
	latex $(FILE).out
	latex $(FILE).out
	latex $(FILE).out

$(FILE).ps: $(FILE).dvi
	dvips -T 30cm,22cm -o $@ $<

$(FILE).pdf: $(FILE).ps
	ps2pdf $< $@

.ps.pdf:
	ps2pdf $<
clean:
	rm -f *.bbl *.aux
	rm -f ${FILE}.out.*
	rm -f ${FILE}.out.pdf 
