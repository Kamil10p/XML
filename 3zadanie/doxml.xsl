<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" >


	<xsl:template match="/">
<przychodnia>
<xsl:for-each select="/plik/przychodnia/baza_danych/karty_pacjentów/karta_pacjenta">
<xsl:variable name="id_pacjenta" select="@numer_id" />
    <karta_pacjenta numer_id="{@numer_id}" płeć="{dane_personalne/@płeć}">
	<numer_ubezpieczenia><xsl:value-of select="numer_ubezpieczenia"/></numer_ubezpieczenia>
	<dane_personalne>
		<nazwisko><xsl:value-of select="dane_personalne/nazwisko"/></nazwisko>
		<imię><xsl:value-of select="dane_personalne/imię"/></imię>
	</dane_personalne>
	<wiek><xsl:value-of select="wiek"/></wiek>
	<ile_wizyt><xsl:value-of select="count(//plik/przychodnia/wizyty/wizyta/@numer_id_pacjenta[.=$id_pacjenta])"/></ile_wizyt>
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
    </karta_pacjenta>
</xsl:for-each>
    <ilosc_pacjentow><xsl:value-of select="count(//przychodnia/baza_danych/karty_pacjentów/karta_pacjenta)"/></ilosc_pacjentow>
    <ilosc_wizyt_pacjentow><xsl:value-of select="count(//przychodnia/wizyty/wizyta)"/></ilosc_wizyt_pacjentow>
    <powyzej_50><xsl:value-of select="count(//przychodnia/baza_danych/karty_pacjentów/karta_pacjenta/wiek[. &gt; 50])"/></powyzej_50>
    <ile_mężczyzn><xsl:value-of select="count(//przychodnia/baza_danych/karty_pacjentów/karta_pacjenta/dane_personalne/@płeć[.= 'M'])"/></ile_mężczyzn>
    <ile_kobiet><xsl:value-of select="count(//przychodnia/baza_danych/karty_pacjentów/karta_pacjenta/dane_personalne/@płeć[.= 'K'])"/></ile_kobiet>
    <srednia_wieku><xsl:value-of select="round(sum(//przychodnia/baza_danych/karty_pacjentów/karta_pacjenta/wiek) div count(//przychodnia/baza_danych/karty_pacjentów/karta_pacjenta) * 100) div 100"/></srednia_wieku>
    <srednia_ilosc_wizyt><xsl:value-of select="round(count(//przychodnia/wizyty/wizyta) div count(//przychodnia/baza_danych/karty_pacjentów/karta_pacjenta) * 100) div 100"/></srednia_ilosc_wizyt>
    <data_wygenerowania_raportu><xsl:value-of select="current-dateTime()"/></data_wygenerowania_raportu>
</przychodnia>
</xsl:template>

</xsl:stylesheet>





























