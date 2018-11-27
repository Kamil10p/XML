<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" >


	<xsl:template match="/">
<przychodnia>
<xsl:for-each select="/plik/przychodnia/baza_danych/karty_pacjentów/karta_pacjenta">
<xsl:variable name="id_pacjenta" select="@numer_id" />
    <karta_pacjenta numer_id="{@numer_id}">
	<numer_ubezpieczenia><xsl:value-of select="numer_ubezpieczenia"/></numer_ubezpieczenia>
	<dane_personalne>
		<nazwisko><xsl:value-of select="dane_personalne/nazwisko"/></nazwisko>
		<imię><xsl:value-of select="dane_personalne/imie"/></imię>
	</dane_personalne>
	<wiek><xsl:value-of select="wiek"/></wiek>
    </karta_pacjenta>
<wizyty>
    <xsl:for-each select="/plik/przychodnia/wizyty/wizyta">
    <xsl:if test="@numer_id_pacjenta=$id_pacjenta">
        <wizyta numer="{@numer}" numer_id_pacjenta="{@numer_id_pacjenta}">
            <data_wizyty><xsl:value-of select="data_wizyty"/></data_wizyty>
            <objawy><xsl:value-of select="objawy"/></objawy>
            <rozpoznanie><xsl:value-of select="rozpoznanie"/></rozpoznanie>
            <zalecenia><xsl:value-of select="zalecenia"/></zalecenia>
        </wizyta>
    </xsl:if>
    </xsl:for-each>
</wizyty>

</xsl:for-each>
</przychodnia>
</xsl:template>

</xsl:stylesheet>





























