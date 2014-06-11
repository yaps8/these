default: these.bbl these.pdf

these.pdf: *.tex these.bbl
	pdflatex these.tex

these.bbl: these.bib
	biber these

clean: these.bib
	rm -f these.aux these.bbl these.blg these.log these.nav these.out these.snm these.toc these.pdf
