.PHONY: all
all: resume.xhtml portfolio.xhtml
resume.xhtml: resume.xml resume.xsl library.xsl resume-css.xsl
	./xsl-transform resume.xml resume.xsl resume.xhtml
portfolio.xhtml: resume.xml portfolio.xsl library.xsl resume-css.xsl
	./xsl-transform resume.xml portfolio.xsl portfolio.xhtml
