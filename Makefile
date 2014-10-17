subdirs := $(wildcard */) $(wildcard */*/) $(wildcard */*/*/)
all_dot := $(wildcard $(addsuffix *.dot,$(subdirs)))
#all_pdf := $(wildcard $(addsuffix *.dot,$(subdirs)))
pdf_from_dot := $(patsubst %.dot,%.pdf,$(all_dot))
tex_from_dot := $(patsubst %.dot,%.tex,$(all_dot))
#low_from_pdf := $(patsubst %.pdf,%_low.pdf,$(sources))
#$(info $$var is [${subdirs}])
#$(info $$var is [${sources}])
#$(info $$var is [${objects}])
TEXCOMP = latexmk -pdf


#default: $(pdf_from_dot) these.bbl these.pdf
default: $(pdf_from_dot) $(tex_from_dot) these.pdf

all: default chap.pdf

#chap.pdf: chap.bbl *.tex these.bbl $(pdf_from_dot)
chap.pdf: *.tex chap.bib $(pdf_from_dot)
	$(TEXCOMP) chap.tex
	if [ -d ~/lectures ]; then cp chap.pdf ~/lectures/; fi

#these.pdf: *.tex these.bbl $(pdf_from_dot)
these.pdf: *.tex these.bib $(pdf_from_dot)
	$(TEXCOMP) these.tex
	if [ -d ~/lectures ]; then cp these.pdf ~/lectures/; fi

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

%.tex: %.dot
	dot2tex -e utf8 --figonly --usepdflatex --autosize $< > $@

#%_low.pdf: %.pdf
#	dot -Tpdf $< -o $@
