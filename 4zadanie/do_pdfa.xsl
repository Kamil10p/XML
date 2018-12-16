<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
 <xsl:output method="xml" encoding="UTF-8"/>

 <xsl:template match="/">
	 <fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master page-height="279mm" page-width="216mm" margin-top="5mm"  margin-bottom="5mm" master-name="A4">
      <fo:region-body margin="15mm"/>
	  <fo:region-before region-name="xsl-region-before" extent="3in"/>
	  <fo:region-after region-name="xsl-region-after"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="A4">
<fo:static-content flow-name="xsl-region-before">
					<fo:block text-align="center">Autorzy: Dawid Pytka i Kamil Piatkowski</fo:block>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-after">
					<fo:block text-align="center">Strona: <fo:page-number/></fo:block>
				</fo:static-content>	
				<fo:flow flow-name="xsl-region-body">
				<fo:block text-indent="1em" font-family="sans-serif" font-weight="bold" text-align="center" font-size="28pt">Przychodnia</fo:block>
				<fo:block text-align="center" font-size="6pt" font-family="sans-serif">(przez twe oczy zielone oszalalem)</fo:block>
					<xsl:for-each select="przychodnia/karta_pacjenta">
					<fo:table border="solid 2pt black">
					
					
						<fo:table-header>
						
							<fo:table-row text-align="center" background-color="#29a3a3" border="solid 1px black">
								<fo:table-cell >
									<fo:block font-weight="bold">Id pacjenta</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Imie i nazwisko</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Wiek</fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block font-weight="bold">Ile wizyt</fo:block>
								</fo:table-cell>
							</fo:table-row >
						</fo:table-header>
						<fo:table-body>
							<fo:table-row text-align="center"  border="solid 1px black">
								<fo:table-cell >
									<fo:block><xsl:value-of select="@numer_id"/></fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block><xsl:value-of select="dane_personalne"/></fo:block>
								</fo:table-cell >
								<fo:table-cell >
									<fo:block><xsl:value-of select="wiek"/></fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block><xsl:value-of select="ile_wizyt"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					<fo:table border="solid 2pt black">
						<fo:table-header>
							<fo:table-row  background-color="#c2f0f0" >
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt" >
									<fo:block font-weight="bold">Data wizyty</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt" >
									<fo:block font-weight="bold">Objawy</fo:block>
								</fo:table-cell >
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt" >
									<fo:block font-weight="bold">Rozpoznanie</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt" >
									<fo:block font-weight="bold">Zalecenia</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<xsl:for-each select="wizyty/wizyta">
							<fo:table-row >
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block><xsl:value-of select="data_wizyty"/></fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block><xsl:value-of select="objawy"/></fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block><xsl:value-of select="rozpoznanie"/></fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block><xsl:value-of select="zalecenia"/></fo:block>
								</fo:table-cell>
								
							</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
					<fo:block space-before="10mm"/>
					
					</xsl:for-each>
					<fo:block text-indent="1em" font-style="italic" font-family="Times Roman" font-weight="bold" text-align="center" font-size="28pt">Podsumowanie</fo:block>
					<fo:table border="solid 2pt black">
					
					
						<fo:table-header>
							<fo:table-row font-family="Times Roman" background-color="#a4eb41" >
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block font-weight="bold">Liczba pacjentow</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block font-weight="bold">Laczna liczba wizyt</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block font-weight="bold">Srednia liczba wizyt</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block font-weight="bold">Srednia wieku pacjentow</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block font-weight="bold">Liczba osob powyzej 50 roku zycia</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block font-weight="bold">Liczba mezczyzn</fo:block>
								</fo:table-cell>
								<fo:table-cell text-align="center" border="solid 1px black" font-weight="bold" padding="4pt">
									<fo:block font-weight="bold">Liczba kobiet</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-header>
						<fo:table-body>
							<fo:table-row font-family="Times Roman" text-align="center" >
								<fo:table-cell>
									<fo:block><xsl:value-of select="przychodnia/ilosc_pacjentow"/></fo:block>
								</fo:table-cell>
								<fo:table-cell >
									<fo:block><xsl:value-of select="przychodnia/ilosc_wizyt_pacjentow"/></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block><xsl:value-of select="przychodnia/srednia_ilosc_wizyt"/></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block><xsl:value-of select="przychodnia/srednia_wieku"/></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block><xsl:value-of select="przychodnia/powyzej_50"/></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block><xsl:value-of select="przychodnia/ile_mezczyzn"/></fo:block>
								</fo:table-cell>
								<fo:table-cell>
									<fo:block><xsl:value-of select="przychodnia/ile_kobiet"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:flow>
			</fo:page-sequence>
		
		</fo:root>
 
 </xsl:template>
</xsl:stylesheet>
