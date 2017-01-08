all: clean report

report: report.tex
  pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^
  pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^
  pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^
  pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^

clean:
	$(RM) -r **/*.aux **/*.bbl **/*.bcf **/*.blg **/*.dvi **/*.lof **/*.lot **/*.log **/*.run.xml **/*.synctex.gz **/*.toc .texpadtmp
	$(RM) -r *.aux *.bbl *.bcf *.blg *.dvi *.lof *.lot *.log report.pdf *.run.xml *.synctex.gz *.toc

.PHONY: all report clean
