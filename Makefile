# Makefile for building potentially complex LaTeX documents.
#
# Required packages:
#	TeX Live
#	tex4ebook

LATEX = latex
PDFLATEX = pdflatex
XELATEX = xelatex
#TEX4EBOOK = tex4ebook
TEX4EBOOK = /home/dave/texmf/tex/latex/tex4ebook/tex4ebook

XELATEX_OPTS = --shell-escape
TEX4EBOOK_OPTS = -xs

NAME = demo
TITLE = "Demonstrations of tex4ebook"
VERSION = 0.1
DISTNAME = $(NAME)-$(VERSION)
ARTDIR = art

PDF = demo1.pdf
EPUB = demo1.epub

all:	book1 book2

book1:	book1-pdf book1-epub

book2:	book2-pdf book2-epub

book1-pdf:
	$(PDFLATEX) book1
	$(PDFLATEX) book1

book1-epub:
	$(TEX4EBOOK) -c book1.cfg book1

book2-pdf:
	$(XELATEX) $(XELATEX_OPTS) book2
	$(XELATEX) $(XELATEX_OPTS) book2

book2-epub:
	$(TEX4EBOOK) -xs -c book2.cfg book2

dist:
	git archive --format=tar.gz --prefix $(DISTNAME)/ -o $(DISTNAME).tar.gz HEAD

distclean: clean
	rm -f $(DISTNAME)
	rm -f *.pdf *.ps *.epub *.html *.dvi *.eps

clean:
	rm -f *.html *.dvi *.eps
	rm -f *.aux *.log *.out *.toc *.bbl *blg *.cot *.idx
	rm -f *.tmp *.xref *.4ct *.4tc *.idv *.css *.lg
	rm -f *.mx1 *.mx2 *.opf *.ncx *.env *.bak *.xdv
	rm -rf *-epub svg-inkscape

.PHONY: clean dist distclean
