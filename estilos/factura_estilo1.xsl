<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml" xmlns:fe="http://www.facturae.gob.es/formato/Versiones/Facturaev3_2_2.xml">
  <xsl:output method="xml" encoding="UTF-8" indent="yes" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Factura</title>
        <style type="text/css">
          body { font-family: sans-serif; }
          .invoice { width: 80%; margin: 20px auto; border: 1px solid #ccc; padding: 20px; }
          .header { text-align: center; margin-bottom: 20px; }
          .seller, .buyer { margin-bottom: 10px; }
          .items { width: 100%; border-collapse: collapse; }
          .items th, .items td { border: 1px solid #ccc; padding: 8px; text-align: left; }
          .totals { margin-top: 20px; text-align: right; }
        </style>
      </head>
      <body>
        <div class="invoice">
          <div class="header">
            <h1>Factura</h1>
          </div>
          <div class="seller">
            <h2>Emisor</h2>
            <p><strong>Nombre:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:LegalEntity/fe:CorporateName"/>
            </p>
            <p><strong>CIF:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:TaxIdentification/fe:TaxIdentificationNumber"/>
            </p>
            <p><strong>Dirección:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:LegalEntity/fe:Address/fe:StreetName"/>,
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:LegalEntity/fe:Address/fe:City"/>,
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:SellerParty/fe:LegalEntity/fe:Address/fe:PostCode"/>
            </p>
          </div>
          <div class="buyer">
            <h2>Receptor</h2>
            <p><strong>Nombre:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:LegalEntity/fe:CorporateName"/>
            </p>
            <p><strong>CIF:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:TaxIdentification/fe:TaxIdentificationNumber"/>
            </p>
            <p><strong>Dirección:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:LegalEntity/fe:Address/fe:StreetName"/>,
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:LegalEntity/fe:Address/fe:City"/>,
              <xsl:value-of select="//fe:Facturae/fe:Parties/fe:BuyerParty/fe:LegalEntity/fe:Address/fe:PostCode"/>
            </p>
          </div>
          <div class="details">
            <p>
              <strong>Número de Factura:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceHeader/fe:InvoiceNumber"/>
            </p>
            <p>
              <strong>Fecha de Emisión:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceHeader/fe:InvoiceIssueDate"/>
            </p>
          </div>
          <div>
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
                    <td>
                      <xsl:value-of select="fe:ItemDescription"/>
                    </td>
                    <td>
                      <xsl:value-of select="fe:Quantity"/>
                    </td>
                    <td>
                      <xsl:value-of select="fe:UnitPrice"/>
                    </td>
                    <td>
                      <xsl:value-of select="fe:LineItemAmount"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
          <div class="totals">
            <p>
              <strong>Total Bruto:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceTotals/fe:TotalGrossAmount"/>
            </p>
            <p>
              <strong>Total IVA:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceTotals/fe:TotalGeneralTax"/>
            </p>
            <p>
              <strong>Total Factura:</strong>
              <xsl:value-of select="//fe:Facturae/fe:Invoices/fe:Invoice/fe:InvoiceTotals/fe:TotalInvoiceAmount"/>
            </p>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
