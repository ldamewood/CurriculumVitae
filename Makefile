all: html pdf docx rtf

%.pdf: %.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=letter \
	-o $(<:.md=.tex) $<; \
	context $(<:.md=.tex)

%.html: %.md style_chmduquesne.css
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o $@ $<

%.docx: %.md
	pandoc -s -S $< -o $@

%.rtf: %.md
	pandoc -s -S $< -o $@
