<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html>
<style>
.headcenter{text-align:center}
</style>
<body>
<h2 class="headcenter">RAPORT</h2>
<table border="1">
    <tr bgcolor="#9acd32">
      <th>ID</th>
	  <th>Imie i nazwisko</th>
	  <th>Wiek</th>
	  <th>Ilość wizyt</th>
      </tr>
<xsl:for-each select="przychodnia/baza_danych/karty_pacjentów/karta_pacjenta">
<xsl:if test="@numer_id='p1'">
<tr>
      <td><xsl:value-of select="numer_ubezpieczenia"/></td>
      <td><xsl:value-of select="dane_personalne"/></td> 
      <td><xsl:value-of select="wiek"/></td> 
      <td><xsl:value-of select="count(//przychodnia/wizyty/wizyta/@numer_id_pacjenta[.='p1'])"/></td>
   
    </tr>
</xsl:if>
</xsl:for-each>
</table>
<table border="1">
    <tr bgcolor="#9acd32">
      <th>Data wizyty</th>
	  <th>Objawy</th>
	  <th>Rozpoznanie</th>
	  <th>Zalecenia</th>
	  
    </tr>
    <xsl:for-each select="przychodnia/wizyty/wizyta">
    <xsl:if test="@numer_id_pacjenta='p1'">
    <tr>
      <td><xsl:value-of select="data_wizyty"/></td>
      <td><xsl:value-of select="objawy"/></td>
	  <td><xsl:value-of select="rozpoznanie"/></td>
	  <td><xsl:value-of select="zalecenia"/></td>
	  
    </tr>
    </xsl:if>
    </xsl:for-each>
</table>
<br style="line-height:30px"/>
<table border="1">
    <tr bgcolor="#9acd32">
      <th>ID</th>
	  <th>Imie i nazwisko</th>
	  <th>Wiek</th>
	  <th>Ilość wizyt</th>
      </tr>
<xsl:for-each select="przychodnia/baza_danych/karty_pacjentów/karta_pacjenta">
<xsl:if test="@numer_id='p2'">
<tr>
      <td><xsl:value-of select="numer_ubezpieczenia"/></td>
      <td><xsl:value-of select="dane_personalne"/></td> 
      <td><xsl:value-of select="wiek"/></td> 
      <td><xsl:value-of select="count(//przychodnia/wizyty/wizyta/@numer_id_pacjenta[.='p2'])"/></td>
   
    </tr>
</xsl:if>
</xsl:for-each>
</table>
<table border="1">
    <tr bgcolor="#9acd32">
      <th>Data wizyty</th>
	  <th>Objawy</th>
	  <th>Rozpoznanie</th>
	  <th>Zalecenia</th>
	  
    </tr>
    <xsl:for-each select="przychodnia/wizyty/wizyta">
    <xsl:if test="@numer_id_pacjenta='p2'">
    <tr>
      <td><xsl:value-of select="data_wizyty"/></td>
      <td><xsl:value-of select="objawy"/></td>
	  <td><xsl:value-of select="rozpoznanie"/></td>
	  <td><xsl:value-of select="zalecenia"/></td>
	  
    </tr>
    </xsl:if>
    </xsl:for-each>
</table>

<br style="line-height:30px"/>
<table border="1">
    <tr bgcolor="#9acd32">
      <th>ID</th>
	  <th>Imie i nazwisko</th>
	  <th>Wiek</th>
	  <th>Ilość wizyt</th>
      </tr>
<xsl:for-each select="przychodnia/baza_danych/karty_pacjentów/karta_pacjenta">
<xsl:if test="@numer_id='p3'">
<tr>
      <td><xsl:value-of select="numer_ubezpieczenia"/></td>
      <td><xsl:value-of select="dane_personalne"/></td> 
      <td><xsl:value-of select="wiek"/></td> 
      <td><xsl:value-of select="count(//przychodnia/wizyty/wizyta/@numer_id_pacjenta[.='p3'])"/></td>
   
    </tr>
</xsl:if>
</xsl:for-each>
</table>
<table border="1">
    <tr bgcolor="#9acd32">
      <th>Data wizyty</th>
	  <th>Objawy</th>
	  <th>Rozpoznanie</th>
	  <th>Zalecenia</th>
	  
    </tr>
    <xsl:for-each select="przychodnia/wizyty/wizyta">
    <xsl:if test="@numer_id_pacjenta='p3'">
    <tr>
      <td><xsl:value-of select="data_wizyty"/></td>
      <td><xsl:value-of select="objawy"/></td>
	  <td><xsl:value-of select="rozpoznanie"/></td>
	  <td><xsl:value-of select="zalecenia"/></td>
	  
    </tr>
    </xsl:if>
    </xsl:for-each>
</table>


<table align="center" width="60%" cellspacing="0" border="1">
	<tr bgcolor="#9dcd62">
       <th>ile pacjentów mamy?</th>
	   <th>Ile wizyt łącznie</th>
	   <th>ile osób powyżej 50 lat ?</th>
	
		
     </tr>
	 <tr>
	 <td><center><xsl:value-of select="count(//przychodnia/baza_danych/karty_pacjentów/karta_pacjenta)"/></center></td>
	   <td><center><xsl:value-of select="count(//przychodnia/wizyty/wizyta)"/></center></td>
	   <td><center><xsl:value-of select="count(//przychodnia/baza_danych/karty_pacjentów/karta_pacjenta/wiek[. &gt; 50])"/></center></td>
		<td><center>.</center></td>
	</tr>
	</table>
</body>

</xsl:template>

</xsl:stylesheet>





























