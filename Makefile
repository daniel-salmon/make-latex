build:
	docker build -t make-latex:latest .

paper:
	docker run --rm \
		-v ${CURDIR}/src:/home/cp-src \
		-v ${CURDIR}/output:/home/output \
		make-latex:latest
	cp output/paper.pdf .

native-paper:
	$(MAKE) run
	$(MAKE) run
	cp output/paper.pdf .
	$(MAKE) clean

run:
	cd src; pdflatex -output-directory ../output paper.tex

clean:
	sudo rm -f output/*
