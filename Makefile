# Makefile for Latex
# Created by Sibin M.
# Date : May 15, 2004.

# LATEX = pdflatex 
LATEX = xelatex 
BIBTEX = bibtex
DVIPS = dvips
DVIPDF = dvipdf
PDFTOOO = pdf2oo -batch 
PSTOPDF = ps2pdf
PDFTOPS = pdf2ps
ACROBAT_COMPATIBILITY = 1.5

# MAIN_FILE_NAME = rtss09
MAIN_FILE_NAME = $(shell egrep -l '^[^%]*\\begin\{document\}' *.tex | gawk -F . 'BEGIN {filename;} /tex/ { filename = $$1; } END{printf(filename);}' )
BIB_FILES = mybib.bib realime.bib ada9x.bib sibin.bib power.bib zhu.bib arch.bib
# BIB_FILES := $(shell perl -ne '($$_)=/^[^%]*\\bibliography\{(.*?)\}/;@_=split /,/;foreach $$b (@_) {print "$$b.bib "}' $(SRC))

EMBED_SRC := $(MAIN_FILE_NAME)
EMBED_RESULT := $(MAIN_FILE_NAME)_embedded
EMBED = gs -sDEVICE=pdfwrite -q -dBATCH -dNOPAUSE -dSAFER -dPDFX -dPDFSETTINGS=/prepress -dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode -dAutoFilterGrayImages=false -dGrayImageFilter=/FlateEncode -sOutputFile=$(EMBED_RESULT).ps -c '<> setdistillerparams' -f $(EMBED_SRC).ps -c quit

GOALS = $(MAIN_FILE_NAME).dvi

#%.pdf:  %.dvi
#	$(DVIPDF) $<
#	$(EMBED)

%.pdf:  %.ps
#	$(DVIPDF) $<
#	$(EMBED)
#	$(PDFTOPS) $(EMBED_RESULT).pdf 
#	cp $(EMBED_RESULT).ps $(EMBED_RESULT)_temp.ps
	$(EMBED)
	$(PSTOPDF) -dCompatibilityLevel=$(ACROBAT_COMPATIBILITY) -dMAxSubsetPct=100 -dSubsetFonts=true -dEmbedAllFonts=true -sPAPERSIZE=letter $(EMBED_RESULT).ps
	cp $(EMBED_RESULT).pdf $(MAIN_FILE_NAME)_submission.pdf


%.ps:	%.dvi
	$(DVIPS) -o $(MAIN_FILE_NAME).ps $<

%.odp:	%.pdf
	$(PDFTOOO) $(MAIN_FILE_NAME).pdf

%.dvi:	$(MAIN_FILE_NAME)
	$(LATEX) $(MAIN_FILE_NAME)
	$(BIBTEX) $(MAIN_FILE_NAME)
	$(LATEX) $(MAIN_FILE_NAME)
	$(LATEX) $(MAIN_FILE_NAME)

all: 	clean $(GOALS)

$(MAIN_FILE_NAME).dvi:	$(MAIN_FILE_NAME).tex
	$(LATEX) $(MAIN_FILE_NAME)
	$(BIBTEX) $(MAIN_FILE_NAME)
	$(LATEX) $(MAIN_FILE_NAME)
	$(LATEX) $(MAIN_FILE_NAME)

clean:
	rm -rf *.dvi *.log *.bbl *.blg *.aux *~

clobber:
	make clean
	rm -rf $(MAIN_FILE_NAME).pdf $(MAIN_FILE_NAME).ps $(MAIN_FILE_NAME).odt
