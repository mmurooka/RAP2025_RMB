#!/bin/bash

set -e

platex -interaction=nonstopmode main.tex
bibtex main
platex -interaction=nonstopmode main.tex
platex -interaction=nonstopmode main.tex
dvipdfmx main.dvi

echo -e "\033[1m\033[32m\n==== Build completed! ====\n\033[0m"
