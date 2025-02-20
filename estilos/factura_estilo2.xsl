<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns="http://www.w3.org/1999/xhtml" 
    xmlns:fe="http://www.facturae.gob.es/formato/Versiones/Facturaev3_2_2.xml">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-system="about:legacy-compat"/>
    
    <xsl:template match="/">
        <html lang="es">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Factura - Estilo 2</title>
                <style>
                    body { font-family: Arial, sans-serif; background-color: #f0f0f0; margin: 0; padding: 20px; }
                    .invoice { max-width: 800px; margin: 0 auto; background-color: white; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
                    .header { background-color: #4a4a4a; color: white; padding: 20px; display: flex; justify-content: space-between; align-items: center; }
                    .header h1 { margin: 0; }
                    .parties { display: flex; justify-content: space-between; padding: 20px; }
                    .party { width: 45%; }
                    .party h2 { color: #4a4a4a; border-bottom: 2px solid #4a4a4a; padding-bottom: 5px; }
                    .details { background-color: #e9e9e9; padding: 20px; }
                    .items { width: 100%; border-collapse: collapse; margin-top: 20px; }
                    .items th { background-color: #4a4a4a; color: white; }
                    .items th, .items td { padding: 10px; text-align: left; border-bottom: 1px solid #ddd; }
                    .totals { background-color: #4a4a4a; color: white; padding: 20px; text-align: right; }
                </style>
            </head>
            <body>
                <div class="invoice">
                    <div class="header">
                        <h1>FACTURA</h1>
                        <div>
                            <p>Nº: <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceHeader/fe:InvoiceNumber"/></p>
                            <p>Fecha: <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceHeader/fe:InvoiceIssueDate"/></p>
                        </div>
                    </div>
                    
                    <div class="parties">
                        <div class="party">
                            <h2>Emisor</h2>
                            <p><xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:LegalEntity/fe:CorporateName"/></p>
                            <p>CIF: <xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:TaxIdentification/fe:TaxIdentificationNumber"/></p>
                            <p><xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:LegalEntity/fe:Address/fe:StreetName"/></p>
                            <p><xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:LegalEntity/fe:Address/fe:PostCode"/>, <xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:LegalEntity/fe:Address/fe:City"/></p>
                        </div>
                        <div class="party">
                            <h2>Receptor</h2>
                            <p><xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:LegalEntity/fe:CorporateName"/></p>
                            <p>CIF: <xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:TaxIdentification/fe:TaxIdentificationNumber"/></p>
                            <p><xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:LegalEntity/fe:Address/fe:StreetName"/></p>
                            <p><xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:LegalEntity/fe:Address/fe:PostCode"/>, <xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:LegalEntity/fe:Address/fe:City"/></p>
                        </div>
                    </div>
                    
                    <div class="details">
                        <h2>Detalles de la Factura</h2>
                        <table class="items">
                            <thead>
                                <tr>
                                    <th>Descripción</th>
                                    <th>Cantidad</th>
                                    <th>Precio Unitario</th>
                                    <th>Importe</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceBody/fe:InvoiceLine">
                                    <tr>
                                        <td><xsl:value-of select="fe:ItemDescription"/></td>
                                        <td><xsl:value-of select="fe:Quantity"/></td>
                                        <td><xsl:value-of select="fe:UnitPrice"/></td>
                                        <td><xsl:value-of select="fe:LineItemAmount"/></td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="totals">
                        <p>Total Bruto: <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceTotals/fe:TotalGrossAmount"/></p>
                        <p>Total IVA: <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceTotals/fe:TotalGeneralTax"/></p>
                        <p>Total Factura: <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceTotals/fe:TotalInvoiceAmount"/></p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
