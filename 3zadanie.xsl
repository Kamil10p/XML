<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<html>
<style>
.headcenter{text-align:center}
</style>
<body>
<h2 class="headcenter">SYSTEM PRZYCHODNI</h2>
<table border="1">
    <tr bgcolor="#9acd32">
      <th>Data wizyty</th>
	  <th>Objawy</th>
	  <th>Rozpoznanie</th>
	  <th>Zalecenia</th>
	  <th>Data kolejnej wizyty</th>
    </tr>
    <xsl:for-each select="przychodnia/wizyty/wizyta">
    <tr>
      <td><xsl:value-of select="data_wizyty"/></td>
      <td><xsl:value-of select="objawy"/></td>
	  <td><xsl:value-of select="rozpoznanie"/></td>
	  <td><xsl:value-of select="zalecenia"/></td>
	  <td><xsl:value-of select="data_kolejnej_wizyty"/></td>
    </tr>
    </xsl:for-each>
</table>
<h2 class="headcenter">Karty Pacjentów</h2>
 <table border="1">
    <tr bgcolor="#9acd32">
<th>Numer ubezpieczenia</th>
<th>Nazwisko i imię</th>
<th>Wiek</th>
<th>Numer telefonu</th>
<th>Adres</th>
<th>Alergie</th>
<th>Przebyte choroby</th>
<th>Szczepienia</th>
<th>Grupa krwi</th>
<th>Przyjmowanie obecnie leki</th>
</tr>
<xsl:for-each select="przychodnia/baza_danych/karty_pacjentów/karta_pacjenta">
<tr>
      <td><xsl:value-of select="numer_ubezpieczenia"/></td>
      <td><xsl:value-of select="dane_personalne"/></td> 
      <td><xsl:value-of select="wiek"/></td> 
      <td><xsl:value-of select="numer_tel"/></td> 
      <td><xsl:value-of select="adres"/></td>
      <td><xsl:value-of select="alergie"/></td>
      <td><xsl:value-of select="przebyte_choroby"/></td>
      <td><xsl:value-of select="szczepienia"/></td>
      <td><xsl:value-of select="grupa_krwi"/></td>
      <td><xsl:value-of select="przyjmowane_obecnie_leki"/></td>
      
    </tr>
</xsl:for-each>
</table>
</body>

</xsl:template>

</xsl:stylesheet>