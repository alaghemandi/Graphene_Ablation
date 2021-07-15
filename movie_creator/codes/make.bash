#!/bin/bash

gnuplot plotting_script
#gnuplot plotting_script_b

pdflatex figure_t.tex
#pdflatex figure_b.tex

pdfcrop figure_t.pdf
#pdfcrop figure_b.pdf

mv figure_t-crop.pdf figure_t.pdf
#mv figure_b-crop.pdf figure_b.pdf

pdflatex figure.tex
pdfcrop figure.pdf
mv figure-crop.pdf figure.pdf


rm -f figure_a.aux figure.aux figure.log figa.eps figure_a.log figa-eps-converted-to.pdf
rm -f fig_a.eps fig_a-eps-converted-to.pdf figa.tex fig_b.eps fig_b-eps-converted-to.pdf 
rm -f fig_a.tex fig_b.tex figure_b.aux figure_b.log figure_b.pdf figure_a.pdf
rm -f figure_t.aux figure_t.log figure_t.pdf figure_t.pdf