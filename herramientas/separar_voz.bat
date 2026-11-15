@echo off
chcp 65001 >nul
title Separar voz con IA - Cabina Júpiter
echo.
echo  ===  CABINA JUPITER - Separar voz con IA  ===
echo.
if "%~1"=="" (
  echo  Arrastra una o varias canciones ^(MP3, WAV, M4A^) encima de este archivo.
  echo.
  pause
  exit /b
)
where py >nul 2>nul && (set "PY=py -3.11") || (set "PY=python")
%PY% --version >nul 2>nul || (
  echo  No encontre Python 3.11. Instalalo desde python.org y marca "Add python.exe to PATH".
  pause
  exit /b
)
where ffmpeg >nul 2>nul || (
  echo  Falta FFmpeg. Abre "Simbolo del sistema" y escribe:  winget install Gyan.FFmpeg
  echo  Luego cierra y vuelve a abrir esta ventana.
  pause
  exit /b
)
%PY% -c "import demucs" >nul 2>nul || (
  echo  Instalando el separador por primera vez. Puede tardar varios minutos...
  %PY% -m pip install --upgrade pip
  %PY% -m pip install "torch==2.5.1" "torchaudio==2.5.1" "demucs==4.0.1" soundfile
)
set "SALIDA=%~dp1Cabina_sin_voz"
:siguiente
if "%~1"=="" goto fin
echo.
echo  Separando: %~nx1
%PY% -m demucs --two-stems=vocals -n htdemucs --mp3 --mp3-bitrate 256 -o "%SALIDA%" "%~1"
shift
goto siguiente
:fin
echo.
echo  Listo. Tus pistas estan en: %SALIDA%\htdemucs\
echo    no_vocals.mp3  = pista de karaoke (sin voz)
echo    vocals.mp3     = solo la voz
echo  Carga no_vocals.mp3 en la Cabina con "Cargar canciones o videos".
start "" "%SALIDA%\htdemucs"
pause
