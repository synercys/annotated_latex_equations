# Makefile for Latex
# Created by Sibin M.
# Date : May 15, 2004.

# LATEX_CHOICE = -pdf  # pdflatex 
LATEX_CHOICE = -pdfxe  # xelatex
# LATEX_CHOICE = -pdflua  # lualatex

MAIN_FILE_NAME = $(shell egrep -l '^[^%]*\\begin\{document\}' *.tex | gawk -F . 'BEGIN {filename;} /tex/ { filename = $$1; } END{printf(filename);}' )

GOALS = $(MAIN_FILE_NAME).pdf

%.pdf:	%.tex
	latexmk $(LATEX_CHOICE) $<

all: 	clean $(GOALS)

clean:
	latexmk -C
	rm -f *.bbl

clobber:
	make clean
	rm -f $(MAIN_FILE_NAME).pdf
