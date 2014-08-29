subdirs := $(wildcard */) $(wildcard */*/) $(wildcard */*/*/)
all_dot := $(wildcard $(addsuffix *.dot,$(subdirs)))
#all_pdf := $(wildcard $(addsuffix *.dot,$(subdirs)))
pdf_from_dot := $(patsubst %.dot,%.pdf,$(all_dot))
#low_from_pdf := $(patsubst %.pdf,%_low.pdf,$(sources))
#$(info $$var is [${subdirs}])
#$(info $$var is [${sources}])
#$(info $$var is [${objects}])
TEXCOMP = latexmk -pdf


#default: $(pdf_from_dot) these.bbl these.pdf
default: $(pdf_from_dot) these.pdf

#chap.pdf: chap.bbl *.tex these.bbl $(pdf_from_dot)
chap.pdf: *.tex these.pdf $(pdf_from_dot)
	$(TEXCOMP) chap.tex

#these.pdf: *.tex these.bbl $(pdf_from_dot)
these.pdf: *.tex $(pdf_from_dot)
	$(TEXCOMP) these.tex

#these.bbl: these.bib
#	$(TEXCOMP) these.tex
#	biber these

#chap.bbl: chap.bib
#	$(TEXCOMP) chap.tex
#	biber chap

clean:
	rm -f *.aux *.bbl *.blg *.log *.nav *.out *.snm *.toc these.pdf *.idf *.maf *.mtc *.idx *.lof *.glo *.bcf chap.pdf *.mtc* *.flg *.xml *.fls *.dvi *.ilg *.ind *.old *latexmk

%.pdf: %.dot
	dot -Tpdf $< -o $@

#%_low.pdf: %.pdf
#	dot -Tpdf $< -o $@
