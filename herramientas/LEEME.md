# Pistas sin voz con IA (para tu laptop con Windows)

`separar_voz.bat` usa **Demucs**, un modelo de inteligencia artificial que separa la voz de la música. Queda mucho más limpio que el botón KARAOKE de la Cabina.

## Preparar la laptop (una sola vez)

1. Instala **Python 3.11** desde python.org. En el instalador marca **Add python.exe to PATH**.
2. Instala **FFmpeg**: abre "Símbolo del sistema" y escribe `winget install Gyan.FFmpeg`. Cierra y vuelve a abrir la ventana.
3. Descarga `separar_voz.bat` (en GitHub: ábrelo y toca el botón de descargar) y guárdalo en tu Escritorio.

## Usarlo

1. Arrastra una o varias canciones encima de `separar_voz.bat`.
2. La primera vez instala el separador y descarga el modelo (unos 2 GB en total con sus librerías). Tarda varios minutos.
3. Cada canción tarda más o menos lo mismo que su duración, o un poco más, según tu laptop.
4. Al terminar se abre la carpeta `Cabina_sin_voz\htdemucs\` junto a tus canciones:
   - `no_vocals.mp3`: la pista de karaoke, sin voz.
   - `vocals.mp3`: solo la voz.
5. Pásale `no_vocals.mp3` al teléfono y cárgalo en la Cabina con **Cargar canciones o videos**.

## Si algo falla

- "No encontré Python": reinstala Python 3.11 marcando *Add python.exe to PATH*.
- "Falta FFmpeg": instala FFmpeg con el comando de arriba.
- Errores al instalar `torch`: confirma que es Python 3.11 (no 3.13), porque esas versiones fijas son las que funcionan juntas.

Úsalo solo con música que tengas derecho a usar.
