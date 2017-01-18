all: clean report 
	make cleanish

report: report.tex
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 $^

cleanish:
	$(RM) -r **/*.aux **/*.bbl **/*.bcf **/*.blg **/*.dvi **/*.lof **/*.lot **/*.log **/*.run.xml **/*.synctex.gz **/*.toc .texpadtmp
	$(RM) -r *.aux *.bbl *.bcf *.blg *.dvi *.lof *.lot *.log *.run.xml *.synctex.gz *.toc

clean: cleanish
	$(RM) -r report.pdf

open: report
	open report.pdf

.PHONY: all clean open
