﻿<?xml version="1.0" encoding="utf-8"?>
<?page processor="saxon"?>

<xsl:stylesheet version="2.0" exclude-result-prefixes="#all"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xs="http://www.w3.org/2001/XMLSchema"
   xmlns:math="http://www.w3.org/2005/xpath-functions/math"
   xmlns="http://www.w3.org/1999/xhtml">

   <xsl:import href="~/layout.xslt"/>

   <xsl:variable name="samples-xpath3" xmlns="">
      <math:acos>
         <xsl:value-of select="math:acos(.5)"/>
      </math:acos>
      <math:asin>
         <xsl:value-of select="math:asin(.5)"/>
      </math:asin>
      <math:atan>
         <xsl:value-of select="math:atan(.5)"/>
      </math:atan>
      <math:cos>
         <xsl:value-of select="math:cos(.5)"/>
      </math:cos>
      <math:exp>
         <xsl:value-of select="math:exp(2)"/>
      </math:exp>
      <math:exp10>
         <xsl:value-of select="math:exp10(.5)"/>
      </math:exp10>
      <math:log>
         <xsl:value-of select="math:log(2)"/>
      </math:log>
      <math:log10>
         <xsl:value-of select="math:log10(2)"/>
      </math:log10>
      <math:pi>
         <xsl:value-of select="math:pi()"/>
      </math:pi>
      <math:pow>
         <xsl:value-of select="math:pow(2, 3)"/>
      </math:pow>
      <math:sin>
         <xsl:value-of select="math:sin(.5)"/>
      </math:sin>
      <math:sqrt>
         <xsl:value-of select="math:sqrt(9)"/>
      </math:sqrt>
      <math:tan>
         <xsl:value-of select="math:tan(.5)"/>
      </math:tan>
   </xsl:variable>

   <xsl:template name="content">
      
      <h1>XPath 3.0 Math</h1>
      <p>
         <a href="http://www.w3.org/TR/xpath-functions-30/">XPath 3.0 Math functions</a>
         are natively available in Saxon-PE and Saxon-EE. myxsl.net provides its own implementations for Saxon-HE.
      </p>
      <h2>Namespace Bindings</h2>
      <ul>
         <li>math = <strong>http://www.w3.org/2005/xpath-functions/math</strong></li>
      </ul>

      <h2>Function Index</h2>
      <ul>
         <xsl:for-each select="$samples-xpath3/*">
            <li>
               <a href="#{replace(name(), ':', '-')}">
                  <xsl:value-of select="name()"/>
               </a>
            </li>
         </xsl:for-each>
      </ul>

      <xsl:for-each select="$samples-xpath3/*">
         <xsl:call-template name="function">
            <xsl:with-param name="sampleVar" select="'samples-xpath3'"/>
         </xsl:call-template>
      </xsl:for-each>
      
   </xsl:template>

   <xsl:template name="function">
      <xsl:param name="sampleVar" as="xs:string"/>

      <h2 id="{replace(name(), ':', '-')}">
         <a href="http://www.w3.org/TR/xpath-functions-30/#func-{replace(name(), ':', '-')}">
            <xsl:value-of select="name()"/>
         </a>
      </h2>
      <div>
         <xsl:variable name="sampleCode" select="document('')/*/xsl:variable[@name=$sampleVar]/*[local-name()=local-name(current())]" as="element()"/>

         <code>
            <xsl:value-of select="$sampleCode/*/@select"/>
         </code>
         
         <xsl:value-of select="concat(' returns ', string())"/>
      </div>
   </xsl:template>

</xsl:stylesheet>