# Resume Template

This is how I produce my resume. You can find here:

* [resume.xml](https://github.com/iarna/resume/blob/master/resume.xml) - Semantic resume markup, with example text.

* [resume-css.xsl](https://github.com/iarna/resume/blob/master/resume-css.xsl) - The CSS rules for generated pages, embedded to reduce load-flicker.
* [resume.xsl](https://github.com/iarna/resume/blob/master/resume.xsl) - Rules to generate the resume XHTML file.
* [portfolio.xsl](https://github.com/iarna/resume/blob/master/portfolio.xsl) - Rules to generate the portfolio XHTML file.
* [library.xsl](https://github.com/iarna/resume/blob/master/library.xsl) - Some layout templates shared between the resume and portfolio files.

* [resume.xhtml](https://iarna.github.io/resume/resume.xhtml) - Generated resume
* [portfolio.xhtml](https://iarna.github.io/resume/portfolio.xhtml) - Generated portfolio

## Editing

Of particular note, the content goes in `resume.xml`, the styles go in
`resume-css.xsl` (note that there are small screen and print styles) and the
HTML goes in `resume.xsl` and `portfolio.xsl`.

You'll need something that can process XSL -- support for xsltproc and xalan
are included.  Install either and run `make` to regenerate the xhtml files.

## PDFs/Printing

I generate PDFs from all of this, typically using Safari, though it works
with any browser.  You'll note that the print styling is quite different,
for example, in places where text is linked, you'll find that the target URL
is displayed instead.  While the generated PDF, with the right viewer, has
clickable links, obviously this isn't the case when printing.
