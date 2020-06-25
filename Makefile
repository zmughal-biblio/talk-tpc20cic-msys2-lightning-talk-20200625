## Config global
LATEXMK = latexmk $(LATEXMKRC_FLAGS) -f -pdf -silent -diagnostics
XELATEX_OPT := -e '$$pdflatex=q/xelatex -synctex=1 %O %S/'

%.pdf: %.tex
	-$(LATEXMK) $<

PRESENT_DEP := preamble/present-helper.tex meta/present.tex

MINIMAL_TARGETS := msys2-and-you.pdf

ALL_TARGETS := $(MINIMAL_TARGETS)

all: $(ALL_TARGETS)

minimal: $(MINIMAL_TARGETS)

msys2-and-you.pdf: LATEXMKRC_FLAGS +=  $(XELATEX_OPT)
msys2-and-you.pdf: msys2-and-you.tex $(PRESENT_DEP)

include ~/sw_projects/zmughal/scraps/scraps/build/latex/clean.mk

cleanall::
	rm -Rf $(ALL_TARGETS)
