<?xml version="1.0"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:output method="xml" standalone="yes"
  doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
  doctype-public="-//W3C//DTD XHTML 1.1//EN"
  encoding="UTF-8"
  />

<xsl:include href="library.xsl"/>
<xsl:include href="resume-css.xsl"/>

<xsl:template match="resume">
  <html xsl:version="1.0" xml:lang="en"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <title><xsl:value-of select="contact/name"/>’s Portfolio</title>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <xsl:call-template name="stylesheet"/>
    </head>
    <body>
      <div class="contact">
        <h2><xsl:value-of select="contact/name"/></h2>
        <h2>Portfolio</h2>
      </div>
      <div class="content">
      <h3>Public Speaking</h3>
      <xsl:call-template name="talks"/>
      <h3>Open Source</h3>
      <xsl:call-template name="portfolio"/>
      </div>
    </body>
  </html>
</xsl:template>

<xsl:template name="talks">
  <xsl:for-each select="portfolio/talk">
    <p class="portfolio">
      <strong><xsl:value-of select="@name"/></strong><br/>
      <xsl:value-of select="desc"/><br/>
      <xsl:if test="video">
        <span class="url-text">
          <strong>Video:</strong><br/>  <a>
            <xsl:attribute name="href">
              <xsl:value-of select="video"/>
             </xsl:attribute>
            <xsl:call-template name="display-url">
              <xsl:with-param name="href" select="video" />
            </xsl:call-template>
          </a><br/>
        </span>
      </xsl:if>
      <xsl:if test="slides">
        <span class="url-text">
          <strong>Slides:</strong><br/>  <a>
            <xsl:attribute name="href">
              <xsl:value-of select="slides"/>
             </xsl:attribute>
            <xsl:call-template name="display-url">
              <xsl:with-param name="href" select="slides" />
            </xsl:call-template>
          </a><br/>
        </span>
      </xsl:if>
    </p>
  </xsl:for-each>
</xsl:template>

<xsl:template name="portfolio">
  <xsl:for-each select="portfolio/item[@type!='@meta']">
    <xsl:sort select="@sort" data-type="number" order="ascending"/>
    <xsl:sort select="@name" data-type="text" order="ascending"/>
    <p>
      <xsl:if test="@sort!='1500'">
        <xsl:attribute name="class">portfolio</xsl:attribute>
      </xsl:if>
      <xsl:if test="(@type='author' or @type='@meta')"><strong><xsl:value-of select="@name"/></strong></xsl:if>
      <xsl:if test="@type!='author' and @type!='@meta'"><xsl:value-of select="@name"/></xsl:if><xsl:if test="url!=''"> (<a>
              <xsl:attribute name="href">
                <xsl:value-of select="url"/>
              </xsl:attribute>
              <xsl:variable name="showurl">
                  <xsl:call-template name="display-url">
                      <xsl:with-param name="href" select="url" />
                  </xsl:call-template>
              </xsl:variable>
              <xsl:value-of select="$showurl"/>
            </a>)
      </xsl:if>
      <xsl:call-template name="lang"/><br/>
      <xsl:if test="desc!=''"><xsl:value-of select="desc"/></xsl:if>
      <xsl:if test="contrib!=''"><br/><xsl:value-of select="contrib"/></xsl:if>
    </p>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>

