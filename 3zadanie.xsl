<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
<informacje_o_pliku>
	<opis_zawartości>SYSTEM PRZYCHODNI - RAPORT</opis_zawartości>
	<autor>Dawid Pytka</autor>
	<autor>Kamil Piątkowski</autor>
	<data_modyfikacji>09.10.2018</data_modyfikacji>
	<osoba_modyfikująca>Kamil Piątkowski</osoba_modyfikująca>
</informacje_o_pliku>
<przychodnia>
<xsl:for-each select="/przychodnia/baza_danych/karty_pacjentów/karta_pacjenta">
<xsl:variable name="id_pacjenta" select="@numer_id" />
<baza_danych>
<karty_pacjentów>
	<numer_ubezpieczenia><xsl:value-of select="numer_ubezpieczenia"/></numer_ubezpieczenia>
	<dane_personalne płeć="M">
		<nazwisko><xsl:value-of select="dane_personalne/nazwisko"/></nazwisko>
		<imię><xsl:value-of select="dane_personalne/imie"/></imię>
	</dane_personalne>
	<wiek><xsl:value-of select="wiek"/></wiek>
</karty_pacjentów>
</baza_danych>
<wizyty>
    <xsl:for-each select="/przychodnia/wizyty/wizyta">
    <xsl:if test="@numer_id_pacjenta=$id_pacjenta">
    <tr>
      <td><xsl:value-of select="data_wizyty"/></td>
      <td><xsl:value-of select="objawy"/></td>
	  <td><xsl:value-of select="rozpoznanie"/></td>
	  <td><xsl:value-of select="zalecenia"/></td>
	  
    </tr>
    </xsl:if>
    </xsl:for-each>
</wizyty>

</xsl:for-each>
</przychodnia>

</xsl:template>

</xsl:stylesheet>





























