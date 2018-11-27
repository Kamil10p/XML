<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" />
<xsl:template match="/">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl">
    <head>
        <title>Raport</title>
    </head>
<body>
<h2>RAPORT</h2>

<xsl:for-each select="//przychodnia/karta_pacjenta">
<xsl:variable name="id_pacjenta" select="@numer_id" />
<table>
    <tr>
      <th>ID</th>
	  <th>Imie i nazwisko</th>
	  <th>Wiek</th>
	  <th>Ilość wizyt</th>
      </tr>
<tr align="center">
      <td><xsl:value-of select="numer_ubezpieczenia"/></td>
      <td><xsl:value-of select="dane_personalne"/></td> 
      <td><xsl:value-of select="wiek"/></td> 
      <td><xsl:value-of select="count(//przychodnia/wizyty/wizyta/@numer_id_pacjenta[.=$id_pacjenta])"/></td>
   
    </tr>
    </table>
    
    <table>
    <tr>
      <th>Data wizyty</th>
	  <th>Objawy</th>
	  <th>Rozpoznanie</th>
	  <th>Zalecenia</th>
	  
    </tr>
    <xsl:for-each select="//przychodnia/wizyty/wizyta">
    <xsl:if test="@numer_id_pacjenta=$id_pacjenta">
    <tr>
      <td><xsl:value-of select="data_wizyty"/></td>
      <td><xsl:value-of select="objawy"/></td>
	  <td><xsl:value-of select="rozpoznanie"/></td>
	  <td><xsl:value-of select="zalecenia"/></td>
	  
    </tr>
    </xsl:if>
    </xsl:for-each>
</table>
</xsl:for-each>


<h2>PODSUMOWANIE</h2>
<table>
	<tr>
       <th>ile pacjentów mamy?</th>
	   <th>Ile wizyt łącznie</th>
	   <th>ile osób powyżej 50 lat ?</th>
	   <th>ile mężczyzn?</th>
	   <th>ile kobiet?</th>

		
     </tr>
	 <tr>
	 <td><xsl:value-of select="//przychodnia/ilosc_pacjentow"/></td>
	   <td><xsl:value-of select="//przychodnia/ilosc_wizyt_pacjentow"/></td>
	   <td><xsl:value-of select="//przychodnia/powyzej_50"/></td>
		<td><xsl:value-of select="//przychodnia/ile_mężczyzn"/></td>
		<td><xsl:value-of select="//przychodnia/ile_kobiet"/></td>
	</tr>
	</table>

</body>
</html>
</xsl:template>

</xsl:stylesheet>





























