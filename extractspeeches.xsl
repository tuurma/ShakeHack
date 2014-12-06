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
            
            <xsl:value-of select="/TEI/teiHeader/profileDesc/particDesc/listPerson/person[@xml:id=substring(current-grouping-key(), 2)]/persName[@type='standard']"/><xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="current-grouping-key()"/><xsl:text>&#x9;</xsl:text>
            <xsl:value-of select="count(current-group())"/><xsl:text>&#x9;</xsl:text>
        
            <xsl:for-each select="key('speeches', current-grouping-key())">
                <xsl:for-each select="*[name()!='speaker']">
                    <xsl:choose>
                        <xsl:when test="descendant-or-self::node()[matches(normalize-space(.), '.*[-­]') and following-sibling::lb]">
                            <xsl:call-template name="stripHyphens">
                                <xsl:with-param name="content" select="."/>
                            </xsl:call-template>
                            <xsl:message>aha!                             <xsl:value-of select="normalize-space(.)"/>
                            </xsl:message>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="normalize-space(.)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:text> </xsl:text>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:text>&#xa;</xsl:text>
                
        </xsl:for-each-group>
        
    </xsl:template>
    
    <xsl:template name="stripHyphens">
        <xsl:param name="content"/>
        
        <xsl:variable name="temp" select="$content"/>
        <xsl:message>*<xsl:value-of select="$temp"/>* <xsl:value-of select="name($content)"/></xsl:message>
        <xsl:for-each select="$content/node()">
            <!-- this one probably won't work for deeply nested hyphens, but let's leave it for now -->
            <xsl:choose>
                <xsl:when test="(ends-with(normalize-space(.), '-') or ends-with(normalize-space(.), '­')) and following-sibling::lb">
                    <xsl:value-of select="substring(normalize-space(.), 0, string-length(normalize-space(.)))"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="normalize-space(.)"/>
                    
                </xsl:otherwise>
            </xsl:choose>
            
            
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>