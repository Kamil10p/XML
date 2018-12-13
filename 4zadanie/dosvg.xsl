<?xml version="1.0" encoding="UTF-8" standalone="no" ?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN"
            doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg" />
    <xsl:template match="/">
        <xsl:variable name="ile_mezczyzn" select="//przychodnia/ile_mężczyzn"/>
        <xsl:variable name="ile_kobiet" select="//przychodnia/ile_kobiet"/>
        <xsl:variable name="mezczyzni" select="//przychodnia/ile_mężczyzn div //przychodnia/ilosc_pacjentow*360" />
        <xsl:variable name="kobiety" select="//przychodnia/ile_kobiet div //przychodnia/ilosc_pacjentow*360" />
        <svg width="1260" height="1000" version="1.1" onload="circleGraph('mezczyzni',610, 210, 100, {$mezczyzni},1); circleGraph('kobiety',610, 210, 100, {$kobiety},-1);">
        <style>
            <![CDATA[

    circle {
    fill: #ddd;
    stroke-width: 50;
    stroke-dasharray: 0 158;
    transition: stroke-dasharray .3s ease;
    transform: rotate(-90deg);
    }
    svg {
       color:white;
    }
     .naglowek{
       font-family:Verdana;
       font-size:34px;
       text-transform: uppercase;
     }
     .graphLegend{
        font-style:italic;
     }
     .graphText{
     fill:white;
     }

            ]]>
        </style>
            <script type="text/ecmascript">
                <![CDATA[
                function circleGraph(name, cx, cy, radius, max, direction){
       var circle = document.getElementById(name);
        var e = circle.getAttribute("d");
        var d = " M "+cx+" "+cy + " L "+cx  + " " + (cy - radius)
        //var d = " M "+ (cx + radius) + " " + cy +" L"+cx+" "+cy;
        var angle=0;
        window.timer = window.setInterval(
        function() {
            var radians= angle * (Math.PI / 180);  // convert degree to radians
       if(direction>0){
            var x = cx + Math.sin(radians) * radius;
       }
       else{
       var x = cx - Math.sin(radians) * radius;
       }
            var y = cy - Math.cos(radians) * radius;

            d += " L "+x + " " + y ;
            circle.setAttribute("d", d)
            if(angle>=max)window.clearInterval(window.timer);
            angle++;
        }
      ,5)
 }
 function show(){
    var e1=document.getElementById("text1").innerText;
    var e2=document.getElementById("text2");

 }

            ]]>
            </script>
            <rect x="0" y="0" width="1260" height="1000" fill="yellow"/>
            <text x="330" y="40" class="naglowek">Wykres kołowy podziału na płcie

            </text>
            <path d="" id="mezczyzni" fill="blue" onmousemove="show()"/>
            <path d="" id="kobiety" fill="green"/>
            <text x="600" y="270" id="text1" class="graphText"><xsl:value-of select='round($mezczyzni div 3.6*10)div 10'/>%
                <animate attributeName="visibility" begin="0s"
                         from="hidden" to="visible" dur="3s" repeatCount="indefinite" />
            </text>

            <text x="540" y="220" id="text2" class="graphText"><xsl:value-of select='round($kobiety div 3.6*10)div 10'/>%
                <animate attributeName="visibility" begin="0s"
                         from="hidden" to="visible" dur="3s" repeatCount="indefinite" />
            </text>


            <rect x="980" y="257" width="15" height="15" fill="blue"/>
            <text x="1000" y="270" class="graphLegend">Mężczyźni</text>
            <rect x="980" y="287" width="15" height="15" fill="green"/>
            <text x="1000" y="300" class="graphLegend">Kobiety</text>
        </svg>
    </xsl:template>
</xsl:stylesheet>
