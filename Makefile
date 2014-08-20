subdirs := $(wildcard */) $(wildcard */*/) $(wildcard */*/*/)
all_dot := $(wildcard $(addsuffix *.dot,$(subdirs)))
#all_pdf := $(wildcard $(addsuffix *.dot,$(subdirs)))
pdf_from_dot := $(patsubst %.dot,%.pdf,$(all_dot))
#low_from_pdf := $(patsubst %.pdf,%_low.pdf,$(sources))
#$(info $$var is [${subdirs}])
#$(info $$var is [${sources}])
#$(info $$var is [${objects}])


default: $(pdf_from_dot) these.bbl these.pdf

these.pdf: *.tex these.bbl $(pdf_from_dot)
	pdflatex these.tex

these.bbl: these.bib
	pdflatex these.tex
	biber these

clean: these.bib
	rm -f these.aux these.bbl these.blg these.log these.nav these.out these.snm these.toc these.pdf these.idf these.log these.maf these.mtc these.idx these.lof these.glo these.bcf

%.pdf: %.dot
	dot -Tpdf $< -o $@

#%_low.pdf: %.pdf
#	dot -Tpdf $< -o $@
