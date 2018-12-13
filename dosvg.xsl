<?xml version="1.0" encoding="iso-8859-2" standalone="yes" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN"
            doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg" />
    <xsl:template match="/">
        <svg width="100" height="100" >
        <style><![CDATA[
        circle {
    fill: #ddd;
    stroke-width: 50;
    stroke-dasharray: 0 158;
    transition: stroke-dasharray .3s ease;
    transform: rotate(-90deg);
}
svg {
    margin: 0 auto;
    -webkit-transform: rotate(-90deg);
    transform: rotate(-90deg);
    background: #ddd;
    border-radius: 50%;
    display: block;
}
        ]]>
        </style>

            <circle r="25" cx="50" cy="50" class="pie" style="stroke-dasharray: 94.8, 158;stroke:blue;"></circle>
        </svg>
    </xsl:template>
</xsl:stylesheet>
