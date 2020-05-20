paper:
	$(MAKE) run
	$(MAKE) run
	$(MAKE) clean

run:
	cd src; pdflatex -output-directory .. paper.tex

clean:
	rm *.aux *.log *.toc *.out
