SRC := lab1.pml
BUILD_DIRECTORY := ./bin
REPORT := report.pdf
TEXDIR = tex
PDFLATEX = pdflatex -interaction=nonstopmode

TEXS = $(wildcard $(TEXDIR)/*.tex)

all: clean

.PHONY clean:
clean:
	rm -rf $(BUILD_DIRECTORY) ;\
	rm $(TEX)/*.aux $(TEX)/*.log $(TEX)/*.out $(TEX)/*.toc  ;\
	rm $(REPORT)

.PHONY run:
run:
	spin -p -l ./$(SRC)

.PHONY report:
report: $(REPORT)

$(BUILD_DIRECTORY):
	mkdir $(BUILD_DIRECTORY)

$(BUILD_DIRECTORY)/pan: $(BUILD_DIRECTORY)
	cd $(BUILD_DIRECTORY) ;\
	spin -a ../$(SRC) ;\
	gcc -DVERBOSE -o pan pan.c  

$(BUILD_DIRECTORY)/pan.dot: $(BUILD_DIRECTORY)/pan
	cd $(BUILD_DIRECTORY) ;\
	pan -D > pan.dot

$(BUILD_DIRECTORY)/%.dot: $(BUILD_DIRECTORY)/pan.dot 
	cd $(BUILD_DIRECTORY) ;\
	../get_graph.sh ./pan.dot

$(BUILD_DIRECTORY)/%_dot.png: $(BUILD_DIRECTORY)/%.dot
	dot -Tpng $< > $@

$(REPORT): $(TEX)/report.tex $(BUILD_DIRECTORY)/p_fibonacci_dot.png $(BUILD_DIRECTORY)/init_dot.png
	cd $(TEXDIR) && echo `$(PDFLATEX) report.tex` 
	cd $(TEXDIR) && echo `$(PDFLATEX) report.tex` 
	mv $(TEXDIR)/report.pdf ./$(REPORT)