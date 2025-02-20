<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fact="http://www.facturae.gob.es/formato/Versiones/Facturaev3_2_2.xml">
    <xsl:output method="html" indent="yes"/>

    <!-- Estilos CSS -->
    <xsl:template match="/">
        <html>
            <head>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        background-color: #f4f4f4;
                        color: #333;
                        margin: 0;
                        padding: 20px;
                    }
                    .invoice-container {
                        background-color: #fff;
                        border: 1px solid #ddd;
                        padding: 20px;
                        max-width: 800px;
                        margin: 0 auto;
                        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                    }
                    .header {
                        text-align: center;
                        margin-bottom: 20px;
                    }
                    .header h1 {
                        color: #4CAF50;
                        margin: 0;
                    }
                    .header h2 {
                        color: #555;
                        margin: 5px 0 0;
                    }
                    .section {
                        margin-bottom: 20px;
                    }
                    .section h3 {
                        background-color: #4CAF50;
                        color: #fff;
                        padding: 10px;
                        margin: 0 -20px 10px;
                    }
                    .section table {
                        width: 100%;
                        border-collapse: collapse;
                    }
                    .section table th, .section table td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: left;
                    }
                    .section table th {
                        background-color: #f4f4f4;
                    }
                    .total {
                        font-size: 1.2em;
                        font-weight: bold;
                        text-align: right;
                        margin-top: 20px;
                    }
                </style>
            </head>
            <body>
                <div class="invoice-container">
                    <div class="header">
                        <h1>Factura Electrónica</h1>
                        <h2>FacturaE 3.2.2</h2>
                    </div>

                    <!-- Información del Encabezado -->
                    <div class="section">
                        <h3>Información del Encabezado</h3>
                        <table>
                            <tr>
                                <th>Versión del Esquema</th>
                                <td><xsl:value-of select="fact:Facturae/fact:FileHeader/fact:SchemaVersion"/></td>
                            </tr>
                            <tr>
                                <th>Modalidad</th>
                                <td><xsl:value-of select="fact:Facturae/fact:FileHeader/fact:Modality"/></td>
                            </tr>
                            <tr>
                                <th>Tipo de Emisor</th>
                                <td><xsl:value-of select="fact:Facturae/fact:FileHeader/fact:InvoiceIssuerType"/></td>
                            </tr>
                            <tr>
                                <th>Número de Facturas</th>
                                <td><xsl:value-of select="fact:Facturae/fact:FileHeader/fact:Batch/fact:InvoicesCount"/></td>
                            </tr>
                            <tr>
                                <th>Total Facturas</th>
                                <td><xsl:value-of select="fact:Facturae/fact:FileHeader/fact:Batch/fact:TotalInvoicesAmount/fact:TotalAmount"/></td>
                            </tr>
                        </table>
                    </div>

                    <!-- Información de las Partes -->
                    <div class="section">
                        <h3>Información de las Partes</h3>
                        <table>
                            <tr>
                                <th>Emisor</th>
                                <td><xsl:value-of select="fact:Facturae/fact:Parties/fact:SellerParty/fact:TaxIdentification/fact:TaxIdentificationNumber"/></td>
                            </tr>
                            <tr>
                                <th>Receptor</th>
                                <td><xsl:value-of select="fact:Facturae/fact:Parties/fact:BuyerParty/fact:TaxIdentification/fact:TaxIdentificationNumber"/></td>
                            </tr>
                        </table>
                    </div>

                    <!-- Detalle de la Factura -->
                    <div class="section">
                        <h3>Detalle de la Factura</h3>
                        <table>
                            <tr>
                                <th>Número de Factura</th>
                                <th>Fecha de Emisión</th>
                                <th>Total</th>
                            </tr>
                            <xsl:for-each select="fact:Facturae/fact:Invoices/fact:Invoice">
                                <tr>
                                    <td><xsl:value-of select="fact:InvoiceHeader/fact:InvoiceNumber"/></td>
                                    <td><xsl:value-of select="fact:InvoiceIssueData/fact:IssueDate"/></td>
                                    <td><xsl:value-of select="fact:InvoiceTotals/fact:InvoiceTotal"/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </div>

                    <!-- Total de la Factura -->
                    <div class="total">
                        Total Factura: <xsl:value-of select="fact:Facturae/fact:Invoices/fact:Invoice/fact:InvoiceTotals/fact:InvoiceTotal"/>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>