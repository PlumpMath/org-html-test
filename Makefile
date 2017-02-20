EMACS ?= emacs

all: generate

generate:
	${EMACS} -Q --script "makefile.el" -f generate-html

clean:
	$(RM) *.html

.PHONY: all generate
