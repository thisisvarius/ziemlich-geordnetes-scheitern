# File names
SRC = [0-8]*.md
TEX = tex
PDF = pdf

# Tools
PANDOC = pandoc
LATEX = xelatex

# Default target
all: $(PDF)

# Step 1: Markdown → LaTeX
$(TEX): $(SRC)
	$(PANDOC)  -f markdown+smart -V csquotes --standalone --toc  --lua-filter=theory.lua --number-sections --pdf-engine=xelatex $(SRC) -o buch.$(TEX) 

# Step 2: LaTeX → PDF
$(PDF): $(TEX)
	$(LATEX) -interaction=nonstopmode buch.$(TEX)
	$(LATEX) -interaction=nonstopmode buch.$(TEX)  # run twice for references

# Clean up intermediate files
clean:
	rm -f *.aux *.log *.out *.toc *.tex

# Count words in manuscript chapters, excluding notes and character sheets
word_count:
	$(PANDOC) -t plain $(SRC) | wc -w

# Clean everything including PDF
distclean: clean
	rm -f buch.$(PDF)
