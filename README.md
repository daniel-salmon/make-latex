# make-latex
Tools for making documents in LaTeX.

It uses [ACM's Master Article
Template](https://www.acm.org/publications/proceedings-template) prepared by
Boris Veytsman as the default document class. You can find the `acmart` source
code on GitHub [here](https://github.com/borisveytsman/acmart).

## About

This repository forms a template for preparing documents and making personal
notes using LaTeX. LaTeX let's us generate high-quality documents that include
lots of mathematical scripts. Moreover, most journals expect your submission to
be in LaTeX, so maintaining notes in LaTeX throughout the course of a research
project helps make publication more seamless.

To that end, this repository forms a template of some defaults I like to use
for maintaining personal notes. It uses the [ACM's Master Article
Template](https://www.acm.org/publications/proceedings-template) as the base
document class, which is just a matter of preference.

The template also includes a `Makefile` for easy document compiling. Running
`make paper` will execute `pdflatex` twice on the paper's source files located
under `/src` and clean up collateral files. Executing `pdflatex` twice ensures
all document references are properly linked. Executing `make run` will
`pdflatex` the paper once and keep all collateral files; `make clean` will
remove all non-pdf collateral files.
