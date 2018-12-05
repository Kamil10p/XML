<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl">
            <head>
                <title>Raport</title>
                <link rel="stylesheet" type="text/css" href="3zadanie.css"></link>
            </head>
            <body>
                <h2>RAPORT</h2>
                <table class="data">
                    <tr>
                        <th>Data wygenerowania raportu</th>
                    </tr>
                    <tr>
                        <td><xsl:value-of select="//przychodnia/data_wygenerowania_raportu"/></td>
                    </tr>
                </table>
                <xsl:for-each select="//przychodnia/karta_pacjenta">
                    <xsl:variable name="id_pacjenta" select="@numer_id" />
                    <table class="pacjent">
                        <tr>
                            <th>ID</th>
                            <th>Imie i nazwisko</th>
                            <th>Wiek</th>
                            <th>Ilość wizyt</th>
                        </tr>
                        <tr>
                            <td><xsl:value-of select="numer_ubezpieczenia"/></td>
                            <td><xsl:value-of select="dane_personalne"/></td>
                            <td><xsl:value-of select="wiek"/></td>
                            <td><xsl:value-of select="count(//przychodnia/karta_pacjenta/wizyty/wizyta/@numer_id_pacjenta[.=$id_pacjenta])"/></td>

                        </tr>
                    </table>

                    <table class="wizyty">
                        <tr>
                            <th>Data wizyty</th>
                            <th>Objawy</th>
                            <th>Rozpoznanie</th>
                            <th>Zalecenia</th>

                        </tr>
                        <xsl:for-each select="//przychodnia/karta_pacjenta/wizyty/wizyta">
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
                <table class="podsumowanie">
                    <tr>
                        <th>Liczba pacjentów</th>
                        <th>Łączna liczba wizyt</th>
                        <th>Średnia liczba wizyt</th>
                        <th>Średnia wieku pacjentów</th>
                        <th>Liczba osób powyżej 50 lat</th>
                        <th>Liczba mężczyzn</th>
                        <th>Liczba kobiet</th>




                    </tr>
                    <tr>
                        <td><xsl:value-of select="//przychodnia/ilosc_pacjentow"/></td>
                        <td><xsl:value-of select="//przychodnia/ilosc_wizyt_pacjentow"/></td>
                        <td><xsl:value-of select="//przychodnia/srednia_ilosc_wizyt"/></td>
                        <td><xsl:value-of select="//przychodnia/srednia_wieku"/></td>
                        <td><xsl:value-of select="//przychodnia/powyzej_50"/></td>
                        <td><xsl:value-of select="//przychodnia/ile_mężczyzn"/></td>
                        <td><xsl:value-of select="//przychodnia/ile_kobiet"/></td>
                    </tr>
                </table>

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>





























