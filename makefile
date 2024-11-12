OPEN = xdg-open
PDF = rm -rf solutions.tex; touch solutions.tex; \
	pdflatex --shell-escape -halt-on-error -interaction=nonstopmode -file-line-error $@.tex && \
	pythontex main.tex && \
        makeindex $@.idx && \
        pdflatex --shell-escape $@.tex && \
        $(OPEN) $@.pdf;
LATEXRM = rm -rf \
        main.aux main.ilg main.log main.idx main.ind main.out \
        main.py.err main.py.out \
        comment.cut comment.err comment.out \
        latex.py __pycache__ pythontex-files-main main.pytxcode

main:
	$(PDF)
c:
	$(LATEXRM)
v:
	$(OPEN) main.pdf
