<?xml version="1.0" encoding="UTF-8" standalone="no" ?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg">
    <xsl:output method="xml" indent="yes" standalone="no" doctype-public="-//W3C//DTD SVG 1.1//EN"
            doctype-system="http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" media-type="image/svg" />
    <xsl:template match="/">
        <xsl:variable name="ile_mezczyzn" select="//przychodnia/ile_mezczyzn"/>
        <xsl:variable name="ile_kobiet" select="//przychodnia/ile_kobiet"/>
        <xsl:variable name="mezczyzni" select="round(//przychodnia/ile_mezczyzn div //przychodnia/ilosc_pacjentow*360)" />
        <xsl:variable name="kobiety" select="round(//przychodnia/ile_kobiet div //przychodnia/ilosc_pacjentow*360)" />
        <svg width="1260" height="800" version="1.1" onload="circleGraph('kobiety',610, 245, 130, {$kobiety},-1);
       circleGraph('mezczyzni',610, 245, 130, {$mezczyzni},1);">
        <style>
            <![CDATA[

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
     .ilosc{
        opacity:0;
        transition-duration: 1s;
     }
     .slupek_wykresuM, .slupek_wykresuK{
    transition-duration:1s;
    height:0;

     }
     .text_wykresuM, .text_wykresuK{
        transition-duration:1s;
        opacity:0;
        fill:black;
     }
     .wartosc_wykresuM, .wartosc_wykresuK{
        fill:white;
        opacity:0;
        transition-duration:4s;
     }

            ]]>
        </style>
            <script type="text/ecmascript">
                <![CDATA[
var clicked=0;
var oldclas;
var oldclasText;
var oldilosc;
var oldclasWartosc;

function circleGraph(name, cx, cy, radius, max, direction){
       var circle = document.getElementById(name);
        var e = circle.getAttribute("d");
        var d = " M "+cx+" "+cy + " L "+cx  + " " + (cy - radius)
        //var d = " M "+ (cx + radius) + " " + cy +" L"+cx+" "+cy;
        var angle=0;
        var timer = setInterval(
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
            if(angle>=max){
            clearInterval(timer);
            }
            angle++;
        }
      ,5)
 }

function wykres_wizyt_close(){
for(var i=0;i<oldilosc;i++){
            var height=document.getElementsByClassName(oldclas)[i].getAttribute("height");
            document.getElementsByClassName(oldclas)[i].style="height: 0";
            var y=document.getElementsByClassName(oldclas)[i].getAttribute("y");
            var newy= parseInt(y) + parseInt(height)
            document.getElementsByClassName(oldclas)[i].setAttribute("y",newy);
            document.getElementsByClassName(oldclasWartosc)[i].style.opacity="0";
            var ywartosc=document.getElementsByClassName(oldclasWartosc)[i].getAttribute("y");
            document.getElementsByClassName(oldclasWartosc)[i].setAttribute("y",`${parseInt(ywartosc)+parseInt(height)+500}`);
            document.getElementsByClassName(oldclasText)[i].style.opacity="0";
            document.getElementById("linieWykresu").style.opacity="0";
        }
        clicked=0;
}

function wykres_wizyt_open(el, ilosc){
 var clas="slupek_wykresu"+el;
    var clasText="text_wykresu"+el;
    var clasWartosc="wartosc_wykresu"+el;
for(var i=0;i<ilosc;i++){
            var height=document.getElementsByClassName(clas)[i].getAttribute("height");
            document.getElementsByClassName(clas)[i].style=`height: ${height}`;
            var y=document.getElementsByClassName(clas)[i].getAttribute("y");
            document.getElementsByClassName(clas)[i].setAttribute("y",`${y-height}`);
            document.getElementsByClassName(clasText)[i].style.opacity="1";
            document.getElementsByClassName(clasWartosc)[i].setAttribute("y",`${y-height+20}`);
            document.getElementsByClassName(clasWartosc)[i].style.opacity="1";
            document.getElementById("linieWykresu").style.opacity="1";
        }
      clicked=1;
     oldclas=clas;
    oldclasText=clasText;
    oldilosc=ilosc;
    oldclasWartosc=clasWartosc;
}
function wykres_wizyt(el, ilosc){
 var clas="slupek_wykresu"+el;
    if(clicked==0){
        wykres_wizyt_open(el, ilosc)
    }
    else if(clicked==1 && clas!=oldclas){
    wykres_wizyt_close();
    wykres_wizyt_open(el, ilosc)
    }
}
            ]]>
            </script>
            <!--tło-->
            <rect x="0" y="0" width="1260" height="1000" fill="#FFFDD0"/>

       <!--nagłówek-->
            <text x="330" y="40" class="naglowek">Wykres kołowy podziału na płci

            </text>

        <!--wykres kołowy-->
            <!--ilość mężczyzn-->
            <g class="ilosc">
                <set attributeName="opacity" to="1"
                     begin="mezczyzni.mouseover"
                     end="mezczyzni.mouseout"/>
            <polyline points="670,132 695,115 825,115" style="fill:none;stroke:black;stroke-width:3" />
            <text x="750" y="110" style="fill:black">
                <xsl:value-of select='$ile_mezczyzn'/> mężczyzn
            </text>
            </g>

            <!--ilość kobiet-->
            <g class="ilosc">
            <set attributeName="opacity" to="1"
                 begin="kobiety.mouseover"
                 end="kobiety.mouseout"/>
            <polyline points="549,132 520,115 390,115" style="fill:none;stroke:black;stroke-width:3" />
            <text x="390" y="110" style="fill:black">
                <xsl:value-of select='$ile_kobiet'/> kobiety
            </text>

                <!--wykres właściwy-->
            </g>
            <path d="" id="mezczyzni" fill="rgb(85, 119, 68)" onclick="wykres_wizyt('M',{$ile_mezczyzn})"/>
            <path d="" id="kobiety" fill="rgb(51, 85, 34)" onclick="wykres_wizyt('K',{$ile_kobiet})"/>

            <!--napis procent-->
            <g class="graphText">
                <animate attributeName="visibility" begin="0s" from="hidden" to="visible" dur="3s" repeatCount="indefinite" />
            <text x="530" y="270">
                <xsl:value-of select='round($kobiety div 3.6*10)div 10'/>%
            </text>
            <text x="653" y="226">
                <xsl:value-of select='round($mezczyzni div 3.6*10)div 10'/>%
            </text>
            </g>

            <!--legenda wykresu kołowego-->
            <g class="graphLegend">
            <rect x="980" y="257" width="15" height="15" fill="rgb(85, 119, 68)"/>
            <text x="1000" y="270">Mężczyźni</text>
            <rect x="980" y="287" width="15" height="15" fill="rgb(51, 85, 34)"/>
            <text x="1000" y="300">Kobiety</text>
            </g>
         <!--koniec wykresu kołowego-->

            <!--wykresy słupkowe-->
            <g id="linieWykresu" style="opacity:0;transition-duration:1s">
                <text x="230" y="454" class="naglowek">Wykres ilości wizyt w zależności od wieku</text>
                <text x="746" y="781">wiek</text>
                <text x="414" y="512">ilość wizyt</text>
            <polyline points="500,751 762,751 750,741 762,751 750,761" style="fill:none;stroke:black;stroke-width:3" />
            <polyline points="500,751 500,505 490,517 500,505 510,517" style="fill:none;stroke:black;stroke-width:3" />
            </g>
            <g id="wizyty_kobiet">
            <xsl:for-each select="//przychodnia/karta_pacjenta/@plec[.= 'K']">
                <xsl:sort select="../wiek"/>
                <xsl:variable name="i" select="position()" />
                    <xsl:variable name="wysokosc" select='count(../wizyty/wizyta)*40'/>
                    <xsl:variable name="x" select='$i*60+460'/>
                <xsl:variable name="color" select='$i*74+278'/>
                    <text x="{$x+13}" y="770" class="text_wykresuK"><xsl:value-of select='../wiek'/></text>
                    <rect x="{$x}" y="750" width="40" height="{$wysokosc}" class="slupek_wykresuK" fill="#{$color}" onclick="wykres_wizyt_close()"/>
                <text x="{$x+15}" y="760" class="wartosc_wykresuK"><xsl:value-of select='count(../wizyty/wizyta)'/></text>
            </xsl:for-each>
            </g>
            <g id="wizyty_mezczyzn">
            <xsl:for-each select="//przychodnia/karta_pacjenta/@plec[.= 'M']">
                <xsl:sort select="../wiek"/>
                <xsl:variable name="i" select="position()" />
                <xsl:variable name="wysokosc" select='count(../wizyty/wizyta)*40'/>

                <xsl:variable name="x" select='$i*60+460'/>
                <xsl:variable name="color" select='$i*74+278'/>
                <text x="{$x+13}" y="770" class="text_wykresuM"><xsl:value-of select='../wiek'/></text>
                <rect x="{$x}" y="750" width="40" height="{$wysokosc}" class="slupek_wykresuM" fill="#{$color}" onclick="wykres_wizyt_close()"/>
                <text x="{$x+15}" y="760" class="wartosc_wykresuM"><xsl:value-of select='count(../wizyty/wizyta)'/></text>
            </xsl:for-each>
            </g>

        </svg>
    </xsl:template>
</xsl:stylesheet>
