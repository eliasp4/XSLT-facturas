<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fact="http://www.facturae.gob.es/formato/Versiones/Facturaev3_2_2.xml">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Factura Electrónica</title>
                <style>
                    @font-face {
                        font-family: 'Bebas Neue';
                        src: local('Bebas Neue'), url('BebasNeue-Regular.ttf') format('truetype');
                        font-weight: 400;
                    }
                    body {
                        font-family: 'Bebas Neue', sans-serif;
                        background-color: #FAF3E0;
                        color: #333;
                        margin: 0;
                        padding: 20px;
                        text-align: center;
                    }
                    .invoice-container {
                        max-width: 900px;
                        margin: auto;
                        background: #fff;
                        padding: 25px;
                        border-radius: 15px;
                        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                        border-left: 10px solid #FFA500;
                    }
                    .header {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        margin-bottom: 25px;
                    }
                    .header .title {
                        text-align: left;
                    }
                    .header img {
                        max-width: 150px;
                    }
                    .header h1 {
                        color: #FF8C00;
                        font-size: 32px;
                        margin: 0;
                    }
                    .header h2 {
                        color: #A0522D;
                        font-size: 22px;
                        margin: 0;
                    }
                    .section {
                        background: #F8F6F0;
                        margin-bottom: 20px;
                        padding: 15px;
                        border-radius: 10px;
                        border-left: 5px solid #FF8C00;
                    }
                    .section h3 {
                        color: #FF8C00;
                        font-size: 24px;
                        margin-bottom: 10px;
                    }
                    .info-table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 10px;
                    }
                    .info-table th, .info-table td {
                        border: 1px solid #DDD;
                        padding: 8px;
                        text-align: left;
                    }
                    .info-table th {
                        background-color: #F2ECE4;
                        color: #333;
                    }
                    .total {
                        font-size: 1.6em;
                        font-weight: bold;
                        color: #FF6347;
                        text-align: right;
                        margin-top: 20px;
                    }
                </style>
            </head>
            <body>
                <div class="invoice-container">
                    <div class="header">
                        <div class="title">
                            <h1>Factura Electrónica</h1>
                            <h2>FacturaE 3.2.2</h2>
                        </div>
                        <img src="descarga.jpg" alt="Logo Empresa"/>
                    </div>

                    <!-- Información del Encabezado -->
                    <div class="section">
                        <h3>Encabezado</h3>
                        <table class="info-table">
                            <tr><th>Versión</th><td><xsl:value-of select="fact:Facturae/fact:FileHeader/fact:SchemaVersion"/></td></tr>
                            <tr><th>Modalidad</th><td><xsl:value-of select="fact:Facturae/fact:FileHeader/fact:Modality"/></td></tr>
                            <tr><th>Tipo Emisor</th><td><xsl:value-of select="fact:Facturae/fact:FileHeader/fact:InvoiceIssuerType"/></td></tr>
                        </table>
                    </div>

                    <!-- Información de las Partes -->
                    <div class="section">
                        <h3>Datos del Emisor</h3>
                        <table class="info-table">
                            <tr><th>Nombre</th><td><xsl:value-of select="fact:Facturae/fact:Parties/fact:SellerParty/fact:LegalEntity/fact:CorporateName"/></td></tr>
                            <tr><th>NIF</th><td><xsl:value-of select="fact:Facturae/fact:Parties/fact:SellerParty/fact:TaxIdentification/fact:TaxIdentificationNumber"/></td></tr>
                        </table>
                    </div>
                    <div class="section">
                        <h3>Datos del Receptor</h3>
                        <table class="info-table">
                            <tr><th>Nombre</th><td><xsl:value-of select="fact:Facturae/fact:Parties/fact:BuyerParty/fact:LegalEntity/fact:CorporateName"/></td></tr>
                            <tr><th>NIF</th><td><xsl:value-of select="fact:Facturae/fact:Parties/fact:BuyerParty/fact:TaxIdentification/fact:TaxIdentificationNumber"/></td></tr>
                        </table>
                    </div>

                    <!-- Detalle de la Factura -->
                    <div class="section">
                        <h3>Detalle de la Factura</h3>
                        <table class="info-table">
                            <tr>
                                <th>Número</th>
                                <th>Fecha</th>
                                <th>Importe Total</th>
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
