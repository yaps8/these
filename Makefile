default: these.tex these.bib clean
	rm -f these.bbl these.aux
	pdflatex these.tex
	biber these
	pdflatex these.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc
