<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:n="www.example.com"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" 
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:output method="text"></xsl:output>
    
      
    <xsl:key name="speeches" match="sp" use="@who"/>
    
    <xsl:template match="/">
                
        <xsl:for-each-group select="//sp" group-by="@who">
            <xsl:sort select="@who"/>
            
            <xsl:value-of select="current-grouping-key()"/><xsl:text>&#x9;</xsl:text><xsl:value-of select="count(current-group())"/><xsl:text>&#x9;</xsl:text>
        
            <xsl:for-each select="key('speeches', current-grouping-key())">
                <xsl:for-each select="child::*[name()!='speaker']">
                    <xsl:value-of select="normalize-space(.)"/>
                    <xsl:text> </xsl:text>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:text>&#xa;</xsl:text>
                
        </xsl:for-each-group>
        
    </xsl:template>
    
</xsl:stylesheet>