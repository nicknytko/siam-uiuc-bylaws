.PHONY: view clean

bylaws.pdf: bylaws.tex
	latexmk $<

view: bylaws.pdf
	open $<

clean:
	-rm bylaws.pdf
