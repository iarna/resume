<?xml version="1.0"?>
<xsl:stylesheet xmlns="http://www.w3.org/1999/xhtml" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:template name="lang">
    <xsl:if test="lang!=''">
      <xsl:choose>
        <xsl:when test="lang='Node.js'">
          <img class="lang" src="images/nodejs.png" alt="Node.js"/>
        </xsl:when>
        <xsl:when test="lang='PHP'">
          <img class="lang" src="images/php.svg" alt="PHP"/>
        </xsl:when>
        <xsl:when test="lang='Perl6'">
          <img class="lang" src="images/perl6.png" alt="Perl6"/>
        </xsl:when>
        <xsl:when test="lang='Perl'">
          <img class="lang" src="images/perl.png" alt="Perl"/>
        </xsl:when>
        <xsl:when test="lang='Shell'">
          <img class="lang" src="images/bash.svg" alt="Shell"/>
        </xsl:when>
        <xsl:when test="lang='C++'">
          <img class="lang" src="images/cpp.png" alt="C++"/>
        </xsl:when>
        <xsl:when test="lang='C'">
          <img class="lang" src="images/c.svg" alt="C"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="lang"/>: 
        </xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:template>

  <xsl:template name="display-url">
    <xsl:param name="href"/>
    <xsl:variable name="no-proto">
      <xsl:choose>
        <xsl:when test="contains($href, 'https://')">
          <xsl:value-of select="substring-after($href, 'https://')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$href"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:variable name="no-readme">
      <xsl:choose>
        <xsl:when test="contains($no-proto, '#readme')">
          <xsl:value-of select="substring-before($no-proto, '#readme')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$no-proto"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:value-of select="$no-readme"/>
  </xsl:template>

</xsl:stylesheet>
