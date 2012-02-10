# Makefile for Sphinx documentation
#

# repos
REPO_SPHINX_PHP=git://github.com/fabpot/sphinx-php.git
DIR_SPHINX_PHP=misc/sphinx-php
REPO_SRC=git://github.com/symfony/symfony-docs.git
REPO_DST=git://github.com/symfony-japan/symfony-docs-ja.git

# You can set these variables from the command line.
TRANSLANG      = ja
SPHINXOPTS_SRC = -D language=$(TRANSLANG)
SPHINXOPTS_DST =
SPHINXBUILD    = sphinx-build -c misc
PAPER          =
SOURCEDIR_SRC  = source-en
SOURCEDIR_DST  = source-$(TRANSLANG)
BUILDDIR_SRC   = build-en
BUILDDIR_DST   = build-$(TRANSLANG)

# Internal variables.
PAPEROPT_a4        = -D latex_paper_size=a4
PAPEROPT_letter    = -D latex_paper_size=letter
ALLSPHINXOPTS_SRC  = -d $(BUILDDIR_SRC)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS_SRC) $(SOURCEDIR_SRC)
ALLSPHINXOPTS_DST  = -d $(BUILDDIR_DST)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS_DST) $(SOURCEDIR_DST)

.PHONY: help clean clean-src clean-dst html html-src html-dst

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  html       to make standalone HTML files"
	@echo "  html-src   to make standalone HTML files for SRC"
	@echo "  html-dst   to make standalone HTML files for DST"
	@echo "  clean      to clean HTML files"
	@echo "  clean-src  to clean HTML files for SRC"
	@echo "  clean-dst  to clean HTML files for DST"

setting:
	git submodule update --init $(SOURCEDIR_SRC)
	git submodule update --init $(SROUCEDIR_DST)
	git submodule update --init $(DIR_SPHINX_PHP)
	mkdir -p $(BUILDDIR_SRC)
	mkdir -p $(BUILDDIR_DST)

clean: clean-src clean-dst

clean-src:
	rm -rf $(BUILDDIR_SRC)/*

clean-dst:
	rm -rf $(BUILDDIR_DST)/*

html: html-src html-dst

html-src:
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS_SRC) $(BUILDDIR_SRC)/html
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR_SRC)/html."

html-dst:
	$(SPHINXBUILD) -b html $(ALLSPHINXOPTS_DST) $(BUILDDIR_DST)/html
	@echo
	@echo "Build finished. The HTML pages are in $(BUILDDIR_DST)/html."

