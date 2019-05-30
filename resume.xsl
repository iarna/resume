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
      <title><xsl:value-of select="contact/name"/>’s Résumé</title>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <xsl:call-template name="stylesheet"/>
    </head>
    <body>
      <header>
        <!-- Contact Info -->
        <xsl:call-template name="contact"/>
        
        <!-- Executive Summary -->
        <section class="exec-summary">
          <xsl:apply-templates select="summary/executive"/>
          <xsl:apply-templates select="summary/wanted"/>
        </section>
      </header>

      <main class="resume">
        <!-- Job Details -->
        <xsl:call-template name="experience"/>

        <!-- References -->     
        <xsl:call-template name="references"/>
      </main>

      <!-- Skills and Supporting Evidence -->
      <aside class="sidebar">
        <xsl:call-template name="skills"/>

        <xsl:call-template name="quotes"/>

        <xsl:call-template name="portfolio"/>
      </aside>


    </body>
  </html>
</xsl:template>

<xsl:template name="link">
  <xsl:param name="label"/>
  <xsl:param name="value"/>
  <xsl:param name="href"/>

  <xsl:if test="$href">
    <xsl:if test="$label">
      <label><xsl:value-of select="$label"/>: </label>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$href">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="$href"/>
          </xsl:attribute>
          <xsl:choose>
            <xsl:when test="value">
              <xsl:value-of select="$value"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="display-url">
                <xsl:with-param name="href">
                  <xsl:value-of select="$href"/>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </a>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="$value"/>
      </xsl:otherwise>
    </xsl:choose>
    <br/>
  </xsl:if>
</xsl:template>

<xsl:template name="contact">
  <div class="contact">
    <h2><xsl:value-of select="contact/name"/></h2>
    <address>
    <xsl:if test="contact/street"><xsl:value-of select="contact/street"/><br/></xsl:if>
    <xsl:if test="contact/city"><xsl:value-of select="contact/city"/>,<xsl:text> </xsl:text></xsl:if>
    <xsl:if test="contact/state"><xsl:value-of select="contact/state"/><xsl:text> </xsl:text></xsl:if>
    <xsl:if test="contact/zip"><xsl:value-of select="contact/zip"/></xsl:if>
    </address>

    <xsl:for-each select="contact/phone[@type='home']">
      <label>Home: </label><xsl:value-of select="."/><br/>
    </xsl:for-each>

    <xsl:for-each select="contact/phone[@type='cell']">
      <label>Cell: </label><xsl:value-of select="."/><br/>
    </xsl:for-each>

    <xsl:for-each select="contact/email">
      <xsl:value-of select="."/><br/>
    </xsl:for-each>

    <xsl:for-each select="contact/resumeurl">
      <xsl:call-template name="link">
        <xsl:with-param name="href"><xsl:value-of select="."/></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

    <xsl:for-each select="contact/blog">
      <xsl:call-template name="link">
        <xsl:with-param name="label">Blog</xsl:with-param>
        <xsl:with-param name="href"><xsl:value-of select="."/></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>

    <!-- These account names of well known services, along with a distinctive icon. The link destination will not be printed. -->

    <xsl:for-each select="portfolio/src">
      <xsl:choose>
        <xsl:when test="logo!=''">
          <span class="site">
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="url"/>
              </xsl:attribute>
              <img class="logo">
                <xsl:attribute name="alt"><xsl:value-of select="@name"/></xsl:attribute>
                <xsl:attribute name="src">images/<xsl:value-of select="logo"/></xsl:attribute>
              </img>
              <xsl:value-of select="name"/>
            </a>
          </span>
        </xsl:when>
        <xsl:otherwise>
          <div class="site">
            <label><xsl:value-of select="@name"/>:</label>
            <a>
              <xsl:attribute name="href">
                <xsl:value-of select="url"/>
              </xsl:attribute>
              <xsl:value-of select="name"/>
            </a>
          </div>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>
    <br/>

    <xsl:for-each select="contact/portfolio">
      <xsl:call-template name="link">
        <xsl:with-param name="label">Full Portfolio</xsl:with-param>
        <xsl:with-param name="href"><xsl:value-of select="."/></xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </div>
</xsl:template>

<xsl:template name="experience">
  <h3>Professional Experience</h3>

  <xsl:for-each select="experience/job">
    <xsl:call-template name="job"/>
  </xsl:for-each>
</xsl:template>

<xsl:template name="job">
  <article class="job">
    <div class="summary">
      <xsl:for-each select="logo">
        <img class="logo">
          <xsl:attribute name="src">images/<xsl:value-of select="."/></xsl:attribute>
        </img>
      </xsl:for-each>
      <div class="dates">
        <xsl:value-of select="@start"/><xsl:text> ‒ </xsl:text>
        <xsl:value-of select="@end"/>
      </div>
      <xsl:for-each select="company">
        <span class="company"><xsl:value-of select="."/></span><br/>
      </xsl:for-each>
      <div class="titles">
        <xsl:for-each select="title">– <xsl:apply-templates/><br/></xsl:for-each>
      </div>
    </div>
    <div>
      <xsl:if test="@ancient = 'true'">
        <xsl:attribute name="class">ancient</xsl:attribute>
      </xsl:if>
      <xsl:if test="desc">
        <xsl:apply-templates select="desc"/>
      </xsl:if>
      <xsl:apply-templates select="responsibilities"/>
      <xsl:apply-templates select="departure"/>
      <xsl:if test="achievements/achievement != ''"> 
        <ul>
          <xsl:for-each select="achievements/achievement">
            <li><xsl:apply-templates/></li>
          </xsl:for-each>
        </ul>
      </xsl:if>
    </div>
  </article>
</xsl:template>

<xsl:template name="skills">
  <xsl:if test="skills">
    <section class="skills">
      <h3>Knowledge and Skills</h3>

      <xsl:for-each select="skills/skill">
        <article><xsl:apply-templates/></article>
      </xsl:for-each>
    </section>
  </xsl:if>
</xsl:template>

<xsl:template name="quotes">
  <xsl:if test="quotes">
    <section class="quotes">
      <h3>Quotes</h3>

      <xsl:for-each select="quotes/quote">
          <article><xsl:apply-templates/></article>
      </xsl:for-each>
    </section>
  </xsl:if>
</xsl:template>

<xsl:template name="portfolio">
  <section class="portfolio">
  <xsl:if test="portfolio/talk">
    <section>
      <h3>Public Speaking</h3>
        <xsl:for-each select="portfolio/talk">
          <article>
            <div class="quick-link">
            <xsl:if test="video"><a><xsl:attribute name="href"><xsl:value-of select="video"/></xsl:attribute>Video</a></xsl:if>
            <xsl:if test="slides"><a><xsl:attribute name="href"><xsl:value-of select="slides"/></xsl:attribute>Slides</a></xsl:if>
            </div>
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
              <div class="url-text">
                <strong>Slides:</strong><br/>  <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="slides"/>
                   </xsl:attribute>
                  <xsl:call-template name="display-url">
                    <xsl:with-param name="href" select="slides" />
                  </xsl:call-template>
                </a><br/>
              </div>
            </xsl:if>
          </article>
        </xsl:for-each>
      </section>
    </xsl:if>

    <xsl:if test="portfolio/item[@sort&lt;30]">
      <section>
        <h3>Selected Open Source Software</h3>
        <xsl:for-each select="portfolio/item[@sort&lt;30]">
          <xsl:sort select="@sort" data-type="number" order="ascending"/>
          <xsl:sort select="@name" data-type="text" order="ascending"/>
          <article>

            <a>
            <xsl:attribute name="href">
              <xsl:value-of select="url"/>
            </xsl:attribute>
            <xsl:if test="(@type='author' or @type='@meta')"><strong><xsl:value-of select="@name"/></strong></xsl:if>
            <xsl:if test="@type!='author' and @type!='@meta'"><xsl:value-of select="@name"/></xsl:if>
            </a>
            <xsl:if test="lang!=''">
              <xsl:call-template name="lang"/><br/>
            </xsl:if>
            <xsl:if test="url!=''">
              <span class="url-text">
                <a>
                  <xsl:attribute name="href">
                    <xsl:value-of select="url"/>
                  </xsl:attribute>
                  <xsl:call-template name="display-url">
                      <xsl:with-param name="href" select="url" />
                  </xsl:call-template>
                </a>
                <br/>
              </span>
            </xsl:if>
            <xsl:if test="desc!=''">
              <xsl:value-of select="desc"/></xsl:if>
            <xsl:if test="contrib!=''"><br/><xsl:value-of select="contrib"/></xsl:if>
          </article>
        </xsl:for-each>
      </section>
    </xsl:if>
  </section>
</xsl:template>

<xsl:template name="references">
  <xsl:if test="references">
    <section>
      <h3>References</h3>

      <xsl:choose>
        <xsl:when test="references/reference">
          <xsl:for-each select="references/reference">
            <article class="reference">
              <xsl:value-of select="name"/><br/>
              <xsl:if test="title"><xsl:value-of select="title"/><br/></xsl:if>
              <xsl:if test="company"><xsl:value-of select="company"/><br/></xsl:if>
              <xsl:if test="location"><xsl:value-of select="location"/><br/></xsl:if>
              <xsl:if test="email"><xsl:value-of select="email"/><br/></xsl:if>
              <xsl:if test="phone"><xsl:value-of select="phone"/><br/></xsl:if>
            </article>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <article>
            Available on request.
          </article>
        </xsl:otherwise>
      </xsl:choose>
    </section>
  </xsl:if>
</xsl:template>

<!-- Preserve paragraphs -->
<xsl:template match="p"><p><xsl:apply-templates/></p></xsl:template>

</xsl:stylesheet>

