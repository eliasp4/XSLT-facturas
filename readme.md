# Transformación XSLT de Facturas

Este proyecto demuestra cómo usar XSLT para transformar facturas XML en documentos HTML con diferentes estilos.

## Requisitos

- Java Runtime Environment (JRE)
- Saxon-HE (versión 12.5 o superior)
- Visual Studio Code
- Extensión XSLT/XPath para Visual Studio Code

## Configuración

1. Descarga Saxon-HE y xmlresolver de sus respectivos sitios web oficiales.
2. Coloca los archivos JAR en la carpeta `lib/`.
3. Instala la extensión XSLT/XPath en Visual Studio Code.
4. Configura el archivo `tasks.json` en la carpeta `.vscode/` con la tarea de transformación XSLT.

## Uso

1. Abre el proyecto en Visual Studio Code.
2. Coloca tus archivos XML de facturas en la carpeta `facturas/`.
3. Para ejecutar una transformación:
   - Abre la paleta de comandos (Ctrl+Shift+P)
   - Escribe "Tasks: Run Task"
   - Selecciona la tarea "XSLT Transform"
4. El resultado de la transformación se guardará como un archivo HTML en la carpeta del proyecto.

## Estilos Disponibles

- `factura.xsl`: Estilo básico de factura
- `factura_estilo2.xsl`: Estilo alternativo con diseño moderno

## Solución de Problemas

Si encuentras errores relacionados con clases no encontradas, asegúrate de que los archivos JAR de Saxon y xmlresolver estén correctamente referenciados en tu `tasks.json`.

## Contribuir

Siéntete libre de fork este repositorio y enviar pull requests con mejoras o nuevos estilos de factura.

## Estructura del Proyecto

```proyecto/
│
├── facturas/
│   └── factura_ejemplo.xml
│
├── estilos/
│   ├── factura.xsl
│   └── factura_estilo2.xsl
│
├── lib/
│   ├── saxon-he-12.5.jar
│   └── xmlresolver-5.1.1.jar
│
├── assets/
│   ├── fonts/
│   │   └── tu_fuente.ttf
│   └── images/
│       └── logo.png
│
└── .vscode/
    └── tasks.json
