@echo off
chcp 65001 >nul
title AI Yerel GRK
cd /d "%~dp0"

echo.
echo  ========================================
echo    AI YEREL GRK baslatiliyor...
echo  ========================================
echo.

if not exist "venv" (
    echo [1/3] Sanal ortam olusturuluyor...
    python -m venv venv
)

call venv\Scripts\activate.bat

echo [2/3] Bagimliliklar kontrol...
pip install -r requirements.txt -q

echo [3/3] Sunucu + tarayici...
echo.
echo  Adres: http://127.0.0.1:5000
echo  Durdurmak: Ctrl+C  (Ollama da kapanir)
echo.

REM 2 sn sonra tarayiciyi ac (Flask ayaga kalksin diye)
start "" cmd /c "timeout /t 2 /nobreak >nul & start http://127.0.0.1:5000/"

python app.py

echo.
echo  Program kapandi. Ollama atexit ile durdurulmus olmali.
pause