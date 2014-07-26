default: these.bbl these.pdf

these.pdf: *.tex these.bbl
	pdflatex these.tex

these.bbl: these.bib
	pdflatex these.tex
	biber these

clean: these.bib
	rm -f these.aux these.bbl these.blg these.log these.nav these.out these.snm these.toc these.pdf these.idf these.log these.maf these.mtc these.idx these.lof these.glo these.bcf
