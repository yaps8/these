subdirs := $(wildcard */) $(wildcard */*/) $(wildcard */*/*/)
all_dot := $(wildcard $(addsuffix *.dot,$(subdirs)))
#all_pdf := $(wildcard $(addsuffix *.dot,$(subdirs)))
pdf_from_dot := $(patsubst %.dot,%.pdf,$(all_dot))
#low_from_pdf := $(patsubst %.pdf,%_low.pdf,$(sources))
#$(info $$var is [${subdirs}])
#$(info $$var is [${sources}])
#$(info $$var is [${objects}])


default: $(pdf_from_dot) these.bbl these.pdf

chap.pdf: chap.bbl *.tex these.bbl $(pdf_from_dot)
	pdflatex chap.tex

these.pdf: *.tex these.bbl $(pdf_from_dot)
	pdflatex these.tex

these.bbl: these.bib
	pdflatex these.tex
	biber these

chap.bbl: chap.bib
	pdflatex chap.tex
	biber chap

clean:
	rm -f *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc these.pdf *.idf *.maf *.mtc *.idx *.lof *.glo *.bcf chap.pdf *.mtc* *.flg *.xml

%.pdf: %.dot
	dot -Tpdf $< -o $@

#%_low.pdf: %.pdf
#	dot -Tpdf $< -o $@
