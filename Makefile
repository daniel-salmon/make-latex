build:
	docker build -t make-paper:latest .

paper:
	docker run --rm \
		-v ${CURDIR}/src:/home/cp-src \
		-v ${CURDIR}/output:/home/output \
		make-paper:latest
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
