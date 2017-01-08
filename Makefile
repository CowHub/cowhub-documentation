all: clean report

report: report.tex
  pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^
  pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^
  pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^
  pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^

clean:
	$(RM) -r **/*.aux **/*.bbl **/*.bcf **/*.blg **/*.dvi **/*.log **/*.pdf **/*.run.xml **/*.synctex.gz **/*.toc .texpadtmp

.PHONY: all report clean
