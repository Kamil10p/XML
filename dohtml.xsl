<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" version="1.0" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtmlll/DTD/xhtmlll.dtd" />
<xsl:template match="/">
<html>
    <head>
    <meta charset="utf-8"/>
<style>
.headcenter{text-align:center}
</style>
    </head>
<body>
<h2 class="headcenter">RAPORT</h2>

<xsl:for-each select="//plik/przychodnia/baza_danych/karty_pacjentów/karta_pacjenta">
<xsl:variable name="id_pacjenta" select="@numer_id" />
<table border="1"  >
    <tr bgcolor="#9acd32" align="center">
      <th>ID</th>
	  <th>Imie i nazwisko</th>
	  <th>Wiek</th>
	  <th>Ilość wizyt</th>
      </tr>
<tr align="center">
      <td><xsl:value-of select="numer_ubezpieczenia"/></td>
      <td><xsl:value-of select="dane_personalne"/></td> 
      <td><xsl:value-of select="wiek"/></td> 
      <td><xsl:value-of select="count(//plik/przychodnia/wizyty/wizyta/@numer_id_pacjenta[.=$id_pacjenta])"/></td>
   
    </tr>
    </table>
    
    <table border="1" width="100%" align="center">
    <tr bgcolor="#9acd32" align="center">
      <th>Data wizyty</th>
	  <th>Objawy</th>
	  <th>Rozpoznanie</th>
	  <th>Zalecenia</th>
	  
    </tr>
    <xsl:for-each select="//plik/przychodnia/wizyty/wizyta">
    <xsl:if test="@numer_id_pacjenta=$id_pacjenta">
    <tr align="center">
      <td><xsl:value-of select="data_wizyty"/></td>
      <td><xsl:value-of select="objawy"/></td>
	  <td><xsl:value-of select="rozpoznanie"/></td>
	  <td><xsl:value-of select="zalecenia"/></td>
	  
    </tr>
    </xsl:if>
    </xsl:for-each>
</table>
<br style="line-height:30px"/>
</xsl:for-each>


<h2 class="headcenter">PODSUMOWANIE</h2>
<table align="center" width="60%" cellspacing="0" border="1">
	<tr bgcolor="#9dcd62">
       <th>ile pacjentów mamy?</th>
	   <th>Ile wizyt łącznie</th>
	   <th>ile osób powyżej 50 lat ?</th>
	
		
     </tr>
	 <tr>
	 <td><center><xsl:value-of select="//plik/przychodnia/ilosc_pacjentow"/></center></td>
	   <td><center><xsl:value-of select="//plik/przychodnia/ilosc_wizyt_pacjentow"/></center></td>
	   <td><center><xsl:value-of select="//plik/przychodnia/powyzej_50"/></center></td>
		<td><center>.</center></td>
	</tr>
	</table>

</body>
</html>
</xsl:template>

</xsl:stylesheet>





























