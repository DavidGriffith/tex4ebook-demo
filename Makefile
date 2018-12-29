# Makefile for building potentially complex LaTeX documents.
#
# Required packages:
#	TeX Live
#	tex4ebook

LATEX = xelatex
#TEX4EBOOK = tex4ebook
TEX4EBOOK = /home/dave/texmf/tex/latex/tex4ebook/tex4ebook

LATEX_OPTS = --shell-escape
TEX4EBOOK_OPTS = -xs

NAME = demo
TITLE = "Demonstration of tex4ebook"
ARTDIR = art

PDF = demo1.pdf
EPUB = demo1.epub


pdf:	$(PDF)

epub:	$(EPUB)

%.pdf: %.tex
	$(LATEX) $(LATEX_OPTS) $<
	$(LATEX) $(LATEX_OPTS) $<

%.epub:	%.tex
	$(TEX4EBOOK) $(TEX4EBOOK_OPTS) -c $*.cfg $<

dist:
	git archive --format=tar.gz --prefix $(NAME)/ -o $(NAME).tar.gz HEAD

distclean: clean
	rm -f $(NAME).tar.gz
	rm -f *.pdf *.ps *.epub *.html *.dvi *.eps

clean:
	rm -f *.html *.dvi *.eps *.svg
	rm -f *.aux *.log *.out *.toc *.bbl *blg *.cot *.idx
	rm -f *.tmp *.xref *.4ct *.4tc *.idv *.css *.lg
	rm -f *.mx1 *.mx2 *.opf *.ncx *.env *.bak *.xdv
	rm -f $(NAME).tar.gz
	rm -rf *-epub

.PHONY: clean dist distclean
