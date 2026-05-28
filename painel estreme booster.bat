@echo off
title DESATIVAR OTIMIZACAO EXTREMA
color 0A
mode con: cols=70 lines=20

echo.
echo ==========================================
echo      RESTAURANDO WINDOWS PADRAO
echo ==========================================
echo.

echo Reativando servicos...
sc config SysMain start=auto >nul 2>&1
sc start SysMain >nul 2>&1

sc config DiagTrack start=auto >nul 2>&1

echo Restaurando efeitos visuais...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f >nul

echo Restaurando MenuShowDelay...
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 400 /f >nul

echo Restaurando plano de energia...
powercfg -setactive SCHEME_BALANCED

echo Restaurando Game Mode...
reg delete "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /f >nul 2>&1

echo.
echo ==========================================
echo      OTIMIZACAO DESATIVADA!
echo ==========================================
echo.

pausegoto menu
