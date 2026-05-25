@echo off
title EXTREME OPTIMIZER
color 0C
mode con: cols=120 lines=40
chcp 65001 >nul

:: =========================================
:: ADMIN
:: =========================================
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo EXECUTE COMO ADMINISTRADOR!
    pause
    exit
)

:menu
cls

echo.
echo  ██████╗ ██████╗ ████████╗██╗███╗   ███╗██╗███████╗███████╗██████╗
echo ██╔═══██╗██╔══██╗╚══██╔══╝██║████╗ ████║██║╚══███╔╝██╔════╝██╔══██╗
echo ██║   ██║██████╔╝   ██║   ██║██╔████╔██║██║  ███╔╝ █████╗  ██████╔╝
echo ██║   ██║██╔═══╝    ██║   ██║██║╚██╔╝██║██║ ███╔╝  ██╔══╝  ██╔══██╗
echo ╚██████╔╝██║        ██║   ██║██║ ╚═╝ ██║██║███████╗███████╗██║  ██║
echo  ╚═════╝ ╚═╝        ╚═╝   ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝
echo.
echo ==========================================================================================
echo.
echo   [1] Limpeza Completa               [2] Turbo FPS
echo   [3] Otimizar Internet              [4] Liberar RAM
echo   [5] Reparar Windows                [6] Desativar Servicos Pesados
echo   [7] Alto Desempenho                [8] Limpar Prefetch
echo   [9] Desligar Efeitos Visuais       [10] Reset DNS
echo   [11] Resetar Rede                  [12] Ultimate Performance
echo   [13] Limpar Cache Store            [14] Limpar Lixeira
echo   [15] Desativar Background Apps     [16] Acelerar Desligamento
echo   [17] Ativar Game Mode              [18] Restaurar Rede
echo   [19] Limpar Logs Windows           [20] Otimizacao EXTREMA
echo.
echo   [0] SAIR
echo.
echo ==========================================================================================
echo.

set /p op=Escolha: 

if "%op%"=="1" goto limpeza
if "%op%"=="2" goto fps
if "%op%"=="3" goto net
if "%op%"=="4" goto ram
if "%op%"=="5" goto reparar
if "%op%"=="6" goto servicos
if "%op%"=="7" goto desempenho
if "%op%"=="8" goto prefetch
if "%op%"=="9" goto visual
if "%op%"=="10" goto dns2
if "%op%"=="11" goto resetnet
if "%op%"=="12" goto ultimate
if "%op%"=="13" goto store
if "%op%"=="14" goto lixo
if "%op%"=="15" goto bgapps
if "%op%"=="16" goto desligar
if "%op%"=="17" goto gamer
if "%op%"=="18" goto restaurarnet
if "%op%"=="19" goto logs
if "%op%"=="20" goto extremo
if "%op%"=="0" exit

goto menu

:: =========================================
:limpeza
cls
echo LIMPANDO SISTEMA...

del /f /s /q %temp%\*.* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp% >nul 2>&1

del /f /s /q C:\Windows\Temp\*.* >nul 2>&1
cleanmgr /verylowdisk

echo.
echo LIMPEZA CONCLUIDA!
pause
goto menu

:: =========================================
:fps
cls
echo OTIMIZANDO FPS...

powercfg -setactive SCHEME_MIN

reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f >nul

echo.
echo FPS OTIMIZADO!
pause
goto menu

:: =========================================
:net
cls
echo OTIMIZANDO INTERNET...

ipconfig /flushdns
netsh winsock reset
netsh int ip reset
netsh int tcp set global autotuninglevel=normal

echo.
echo INTERNET OTIMIZADA!
pause
goto menu

:: =========================================
:ram
cls
echo LIBERANDO RAM...

taskkill /f /im OneDrive.exe >nul 2>&1
taskkill /f /im SearchApp.exe >nul 2>&1
taskkill /f /im YourPhone.exe >nul 2>&1

echo.
echo RAM LIBERADA!
pause
goto menu

:: =========================================
:reparar
cls
echo REPARANDO WINDOWS...

sfc /scannow

pause
goto menu

:: =========================================
:servicos
cls
echo DESATIVANDO SERVICOS...

sc stop SysMain >nul 2>&1
sc config SysMain start=disabled >nul 2>&1

sc stop DiagTrack >nul 2>&1
sc config DiagTrack start=disabled >nul 2>&1

echo.
echo SERVICOS DESATIVADOS!
pause
goto menu

:: =========================================
:desempenho
cls
powercfg /setactive SCHEME_MIN
echo.
echo ALTO DESEMPENHO ATIVADO!
pause
goto menu

:: =========================================
:prefetch
cls
del /f /s /q C:\Windows\Prefetch\*.* >nul 2>&1
echo PREFETCH LIMPO!
pause
goto menu

:: =========================================
:visual
cls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul
echo.
echo EFEITOS VISUAIS DESATIVADOS!
pause
goto menu

:: =========================================
:dns2
cls
ipconfig /flushdns
ipconfig /registerdns
ipconfig /release
ipconfig /renew
echo.
echo DNS RESETADO!
pause
goto menu

:: =========================================
:resetnet
cls
netsh winsock reset
netsh int ip reset
netsh advfirewall reset
echo.
echo REDE RESETADA!
pause
goto menu

:: =========================================
:ultimate
cls
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
echo.
echo ULTIMATE PERFORMANCE ATIVADO!
pause
goto menu

:: =========================================
:store
cls
wsreset.exe
echo.
echo CACHE STORE LIMPO!
pause
goto menu

:: =========================================
:lixo
cls
rd /s /q C:\$Recycle.Bin
echo.
echo LIXEIRA LIMPA!
pause
goto menu

:: =========================================
:bgapps
cls
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
echo.
echo BACKGROUND APPS DESATIVADOS!
pause
goto menu

:: =========================================
:desligar
cls
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f
echo.
echo DESLIGAMENTO ACELERADO!
pause
goto menu

:: =========================================
:gamer
cls
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
echo.
echo GAME MODE ATIVADO!
pause
goto menu

:: =========================================
:restaurarnet
cls
netcfg -d
echo.
echo REDE RESTAURADA!
pause
goto menu

:: =========================================
:logs
cls
del /f /q %SystemRoot%\Logs\*.*
echo.
echo LOGS LIMPOS!
pause
goto menu

:: =========================================
:extremo
cls
echo APLICANDO OTIMIZACAO EXTREMA...

powercfg -setactive SCHEME_MIN

ipconfig /flushdns

reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f >nul
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f >nul

sc stop SysMain >nul 2>&1
sc config SysMain start=disabled >nul 2>&1

taskkill /f /im OneDrive.exe >nul 2>&1

del /f /s /q %temp%\*.* >nul 2>&1

echo.
echo OTIMIZACAO EXTREMA FINALIZADA!
pause
goto menu