%.pdf: %.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=letter \
	-o $(<:.md=.tex) $<; \
	context $(<:.md=.tex)

%.html: %.md
	pandoc --standalone \
        --from markdown --to html \
        -o $@ $<

%.docx: %.md
	pandoc -s -S $< -o $@

%.rtf: %.md
	pandoc -s -S $< -o $@
