SRC := lab2.pml
SRC_FIX := lab2_fixed.pml
REPORT := report.pdf
TEXDIR = tex
PDFLATEX = pdflatex -interaction=nonstopmode

TEXS = $(wildcard $(TEXDIR)/*.tex)

all: clean

.PHONY clean:
clean:
	rm $(TEX)/*.aux $(TEX)/*.log $(TEX)/*.out $(TEX)/*.toc  ;\
	rm $(REPORT)

.PHONY run:
run:
	spin ./$(SRC)

.PHONY run_fixed:
run_fixed:
	spin ./$(SRC_FIX)

.PHONY report:
report: $(REPORT)

$(REPORT): $(TEX)/report.tex 
	cd $(TEXDIR) && echo `$(PDFLATEX) report.tex` 
	cd $(TEXDIR) && echo `$(PDFLATEX) report.tex` 
	mv $(TEXDIR)/report.pdf ./$(REPORT)