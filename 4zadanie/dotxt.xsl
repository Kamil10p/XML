<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8"/>
<xsl:strip-space elements="*"/>

<xsl:template match="/">
<xsl:text>---------Authors--------- &#xa;</xsl:text>
<xsl:text>Dawid Pytka</xsl:text>
<xsl:text>&#xa;</xsl:text>
<xsl:text>Kamil Piatkowski</xsl:text>
<xsl:text>&#xa; &#xa; &#xa;</xsl:text>

<xsl:text>Date raport: </xsl:text><xsl:value-of select="substring(przychodnia/data_wygenerowania_raportu,1,30)"/><xsl:text>&#xa;</xsl:text>
<xsl:text>---------Przychodnia--------- &#xa;</xsl:text>
<xsl:for-each select="//przychodnia/karta_pacjenta">
 <xsl:value-of select="substring(concat('Pacjent(imie, nazwisko,wiek, id):',dane_personalne/imie,' | ',dane_personalne/nazwisko,' | ',wiek,' lat | ',@numer_id,' |'),1,200)"/> 
<xsl:text>&#xa;</xsl:text>
<xsl:value-of select="substring(concat('Ilość wizyt: ',ile_wizyt),1,50)"/>
<xsl:text>&#xa;</xsl:text>
<xsl:text>Data Wizyty                 Objawy                                               Rozpoznanie                                             Zalecenia                                                              </xsl:text>
<xsl:text>&#xa;</xsl:text>
<xsl:for-each select="wizyty/wizyta">
<xsl:value-of select="substring(concat(data_wizyty,'       '),1,15)"/>
<xsl:value-of select="substring(concat(objawy,'                                                                                                    '),1,66)"/>
<xsl:value-of select="substring(concat(rozpoznanie,'                              '),1,35)"/>
<xsl:value-of select="substring(concat(zalecenia,' '),1,90)"/>

<xsl:text>&#xa;</xsl:text>
</xsl:for-each>
<xsl:text>&#xa;</xsl:text>
</xsl:for-each>
<xsl:text>&#xa;</xsl:text>
<xsl:text>--------------Podsumowanie-------------- &#xa;</xsl:text>
<xsl:value-of select="concat('Ilość wszystkich pacjentów: ',//przychodnia/ilosc_pacjentow)"/>
<xsl:text>&#xa;</xsl:text>
<xsl:value-of select="concat('Ilość wszystkich wizyt: ', //przychodnia/ilosc_wizyt_pacjentow)"/>
<xsl:text>&#xa;</xsl:text>
<xsl:value-of select="concat('Ilość pacjentów powyżej 50 roku życia: ', //przychodnia/powyzej_50)"/>
<xsl:text>&#xa;</xsl:text>
<xsl:value-of select="concat('Ilość mężczyzn w przychodni: ', //przychodnia/ile_mezczyzn)"/>
<xsl:text>&#xa;</xsl:text>
<xsl:value-of select="concat('Ilość kobiet w przychodni: ', //przychodnia/ile_kobiet)"/>
<xsl:text>&#xa;</xsl:text>
<xsl:value-of select="concat('Średni wieku: ', //przychodnia/srednia_wieku)"/>
<xsl:text>&#xa;</xsl:text>
<xsl:value-of select="concat('Średni ilość wizyt: ', //przychodnia/srednia_ilosc_wizyt)"/>
</xsl:template>
</xsl:stylesheet>