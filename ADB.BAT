
:: & 
:: chcp 65001 //РУССКИЙ ЯЗЫК

@echo off
title ADB-PRO V 1.1.4
chcp 65001
CLS
echo СЛИДИТЕ ЗА ОБНОВЛЕНИЯМИ В GITHUB И 4PDA BАША ВЕРСИЯ 1.1.4!
timeout /t 5 >NUL
color 1
ECHO ░█████████  ░█████████    ░██████   ░███████   ░██     ░██   ░██████  ░██████████░██████  ░██████   ░███    ░██       
ECHO ░██     ░██ ░██     ░██  ░██   ░██  ░██   ░██  ░██     ░██  ░██   ░██     ░██      ░██   ░██   ░██  ░████   ░██       
ECHO ░██     ░██ ░██     ░██ ░██     ░██ ░██    ░██ ░██     ░██ ░██            ░██      ░██  ░██     ░██ ░██░██  ░██       
ECHO ░█████████  ░█████████  ░██     ░██ ░██    ░██ ░██     ░██ ░██            ░██      ░██  ░██     ░██ ░██ ░██ ░██       
ECHO ░██         ░██   ░██   ░██     ░██ ░██    ░██ ░██     ░██ ░██            ░██      ░██  ░██     ░██ ░██  ░██░██       
ECHO ░██         ░██    ░██   ░██   ░██  ░██   ░██   ░██   ░██   ░██   ░██     ░██      ░██   ░██   ░██  ░██   ░████       
ECHO ░██         ░██     ░██   ░██████   ░███████     ░██████     ░██████      ░██    ░██████  ░██████   ░██    ░███       
                                                                                                                      
                                                                                                                      
ECHO.                                                                                                                       
ECHO   ░██████   ░█████████        ░██████████░██     ░██ ░█████████  ░█████████  ░██     ░██                              
ECHO  ░██   ░██  ░██     ░██       ░██        ░██     ░██ ░██     ░██ ░██     ░██  ░██   ░██                               
ECHO ░██     ░██ ░██     ░██       ░██        ░██     ░██ ░██     ░██ ░██     ░██   ░██ ░██                                
ECHO ░██     ░██ ░█████████        ░█████████ ░██     ░██ ░█████████  ░█████████     ░████                                 
ECHO ░██     ░██ ░██   ░██         ░██        ░██     ░██ ░██   ░██   ░██   ░██       ░██                                  
ECHO  ░██   ░██  ░██    ░██        ░██         ░██   ░██  ░██    ░██  ░██    ░██      ░██                                  
ECHO   ░██████   ░██     ░██       ░██          ░██████   ░██     ░██ ░██     ░██     ░██     LIKE                             
ECHO ( Дмитрий Гинкель VK: @dmitry_ginkel )                                                                                              
timeout /t 5 >NUL

:XXX
cls
COLOR B
adb devices
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                КАК ВЫ ХОТИТЕ ПОДКЛЮЧИТЬ УСТРОЙСТРО                     ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║             1  =  Подключиться по Wi-Fi                                ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║             2  =  ОБЫЧНО                                               ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║             3  =  Перезапустить ADB в режиме TCP/IP (USB ON VI-FI)     ║
echo ╚════════════════════════════════════════════════════════════════════════╝

SET /P XXX=ВЫБОР:

IF %XXX%==1 (GOTO adb0connect0)
IF %XXX%==2 (goto menu)
IF %XXX%==3 (GOTO TCP)
GOTO XXX

:adb0connect0
CLS
SET /P adb0connect=ВВИДЕТЕ IP И ПОРТ (IP:PORT):
adb connect %adb0connect% & goto menu
GOTO adb0connect0

:TCP
CLS
ECHO (ВНИМАНИЕ ДЛЯ ВКЛЮЧЕНИЯ УДАЛЕННОГО ДОСТУПА ТРЕБУЕСТЯ ПОДКЛЮЧЕНИЕ ПО USB И ОБШЕЙ СЕТИ VI-FI)
for /F "delims=" %%a in ('adb shell ip route') do set IP=%%a>NUL
echo IP: %IP%
adb tcpip 5555
ECHO (ОТКЛЮЧИТЕ УСТРОЙСТВО ОТ USB И НАЖМИТЕ ЛЮБУЮ КЛАВИШУ)
PAUSE
ECHO ВВИДЕТЕ ПОЛУЧЕНЫЙ IP
SET /P TPCC=
adb connect %TPCC%:5555
adb devices
echo НАЖМИТЕ ЛЮБОЮ КЛАВИШУ ДЛЯ ПЕРЕХОДА В МЕНЮ & PAUSE
goto menu

:MMN
for /F "delims=" %%a in ('adb shell getprop ro.product.model') do set MODEL=%%a
for /F "delims=" %%a in ('adb shell getprop ro.product.brand') do set BRAND=%%a
for /F "delims=" %%a in ('adb shell getprop ro.product.device') do set DEVICE=%%a
CLS
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║           КАК ВЫ ХОТИТЕ ПОЛУЧИТЬ ИНОРИАЦИЮ ОБ УСТРОЙСТВЕ               ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║             1  =  ОСНОВНАЯ ИНФОРМАЦИЯ ОБ УСТРОЙСТВЕ                    ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║             2  =  ВСЯ ИНФОРМАЦИЯ ОБ УСТРОЙСТВЕ                         ║
echo ╚════════════════════════════════════════════════════════════════════════╝
SET /P MMN=ВЫБОР:

IF %MMN%==1 (goto INFO)
IF %MMN%==2 (goto 111)
GOTO INFO

:111
CLS
echo ВСЯ ИНФОРМАЦИЯ ОБ УСТРОЙСТВЕ
adb shell getprop
echo НАЖМИТЕ ЛЮБОЮ КЛАВИШУ ДЛЯ ПЕРЕХОДА В МЕНЮ & PAUSE
goto menu






:INFO
color 4
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                 ВЫПОЛНЯЕТСЯ ЗАПУСК И ПОИСК УСТРОЙСТВ                   ║
echo ╚════════════════════════════════════════════════════════════════════════╝

adb devices

for /F "delims=" %%a in ('adb devices') do set ADB0=%%a
for /F "delims=" %%a in ('adb shell getprop ro.product.device') do set DEVICE=%%a
for /F "delims=" %%a in ('adb shell getprop ro.product.model') do set MODEL=%%a
for /F "delims=" %%a in ('adb shell getprop ro.product.brand') do set BRAND=%%a
for /F "delims=" %%a in ('adb shell getprop ro.build.version.release') do set ANDROID=%%a
for /F "delims=" %%a in ('adb shell getprop ro.build.id') do set ID=%%a
for /F "delims=" %%a in ('adb shell getprop ro.build.version.security_patch') do set SECURITY=%%a
for /F "delims=" %%a in ('adb shell cat /proc/version') do set CERNEL=%%a
for /F "delims=" %%a in ('adb shell getprop ro.build.date') do set BLT=%%a
for /F "delims=" %%a in ('adb shell service call iphonesubinfo 1') do set IMEI=%%a 
for /F "delims=" %%a in ('adb shell getprop ro.product.manufacturer') do set MANU=%%a
for /F "delims=" %%a in ('adb shell getprop ro.build.version.sdk') do set SDK=%%a
for /F "delims=" %%a in ('adb shell getprop ro.serialno') do set SERIA=%%a
for /F "delims=" %%a in ('adb shell ip route') do set IP=%%a
for /F "delims=" %%a in ('adb shell getprop ro.product.cpu.abi') do set cpu=%%a
for /F "delims=" %%a in ('adb shell getprop ro.build.display.id') do set display=%%a
for /F "delims=" %%a in ('adb shell cat /sys/class/net/wlan0/address') do set MAC=%%a



CLS 
color 1
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                     ИНФОРМАЦИЯ О НАЙДЕНОМ УСТРОЙСТВЕ ADB               ║
echo ╚════════════════════════════════════════════════════════════════════════╝
echo.
echo ADB NAME:                      %ADB0%
echo IP:                            %IP%
echo УСТРОЙСТВО:                    %DEVICE%
echo МОДЕЛЬ:                        %MODEL%                   
echo БРЕНД:                         %BRAND%
echo АНДРОИД:                       %ANDROID%
echo ПРОШИФКА:                      %ID%
echo БЕЗОПАСНОСТЬ:                  %SECURITY%
echo дата сборки ядра:              %BLT%
echo IMEI:                          %IMEI%
echo ВЕРСИЯ ЯДРА:                   %CERNEL%
echo Производитель:                 %MANU%
echo API:                           %SDK%
echo Серийный номер:                %SERIA%
echo Архитектура:                   %cpu%
echo сборка:                        %display%
echo MAC:                           %MAC%
ECHO.

echo НАЖМИТЕ ЛЮБОЮ КЛАВИШУ ДЛЯ ПЕРЕХОДА В МЕНЮ & PAUSE
goto menu

:: ГЛАВНОЕ MENU 

:menu
for /F "delims=" %%a in ('adb shell getprop ro.product.model') do set MODEL=%%a
for /F "delims=" %%a in ('adb shell getprop ro.product.brand') do set BRAND=%%a
for /F "delims=" %%a in ('adb shell getprop ro.product.device') do set DEVICE=%%a
color 5
cls			
echo %BRAND% %MODEL%
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                              МЕНЮ                                      ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║    1   =   КОНСОЛЬ                                                     ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    2   =   ИНФОРМАЦИЯ ОБ УСТРОЙСТВЕ                                    ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    3   =   УСТАНОВИТЬ ДРАЙВЕРА                                         ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    4   =   Отправить файл на устройство                                ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    5   =   УДАЛЕНИЕ ПРИЛОЖЕНИЙ                                         ║ 
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    6   =   УСТАНОВКА APK                                               ║ 
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    7   =   КОМАНДЫ ADB/FASTBOOT/SHELL                                  ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    8  =    РЕЗЕРВНАЯ КОПИЯ                                             ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    9  =    ПРОВЕРИТЬ ОБНОВЛЕНИЕ СБОРКИ                                 ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    10  =   СКРИНШОТ                                                    ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    11  =   ДОП МЕНЮ1                                                   ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    12  =   ВЫХОД                                                       ║
echo ╚════════════════════════════════════════════════════════════════════════╝ 
SET /P menunr=ВЫБОР:

IF %menunr%==1 (START CMD)
IF %menunr%==2 (goto MMN)
IF %menunr%==3 (START drvAnd\D.exe /s )
IF %menunr%==4 (goto COPU)
IF %menunr%==5 (START ADBAppControl.exe)
IF %menunr%==6 (goto INSTALL)
IF %menunr%==7 (ADB.TXT)
IF %menunr%==8 (GOTO BACKUP)
IF %menunr%==9 (START https://github.com/FURRY-LOVE/SUPER-ADB/blob/main/README.md )
IF %menunr%==10 (adb shell screencap -p /sdcard/screencap.png && adb pull /sdcard/screencap.png & screencap.png & goto menu)
IF %menunr%==11 (goto MENU2)
IF %menunr%==12 (goto EXIT)
goto menu

:MENU2
color 5
cls			
echo %BRAND% %MODEL%
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                      ДОПОЛНИТЕЛЬНОЕ МЕНЮ 1                             ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║    1   =   УПРАВЛЕНИЕ НАСТРОЙКАМИ СИСТЕМЫ                              ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    2   =   УПРОВЛЕНИЕ ЭКРАНОМ/ЭМУЛЯЦИЯ                                 ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    3   =   МЕНЮ ПЕРЕЗАГРУЗКИ УСТРОЙСТВA                                ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    4   =   ОЧИСТКА РАЗДЕЛОВ И ПРОШИФ                                   ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    5   =   СБРОС ПАРОЛЯ                                                ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    6   =   scrcpy                                                      ║ 
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    7   =   РЕДАКТОР APK                                                ║ 
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    8   =   ДЛЯ ANDROID 0-8                                             ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    9   =   TFT                                                         ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    10  =   ДОП МЕНЮ2                                                   ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    11  =   МЕНЮ                                                        ║
echo ╚════════════════════════════════════════════════════════════════════════╝ 
SET /P MENU2=ВЫБОР:

IF %MENU2%==1 (GOTO SETTTING)
IF %MENU2%==2 (GOTO ECRAN)
IF %MENU2%==3 (goto REBOOT)
IF %MENU2%==4 (GOTO WIPE)
IF %MENU2%==5 (goto PAROL)
IF %MENU2%==6 (scrcpy\scrcpy.bat)
IF %MENU2%==7 (jadx\jadx-gui-1.5.3.exe)
IF %MENU2%==8 (adb install "MyPhoneExplorer\DLL\mpeclient.apk" & START MyPhoneExplorer/portable.exe)
IF %MENU2%==9 (TFTUnlock\tft.bat)
IF %MENU2%==10 (GOTO MENU3)
IF %MENU2%==11 (GOTO MENU)
GOTO MENU

:SETTTING
color 5
cls			
echo %BRAND% %MODEL%
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                   УПРАВЛЕНИЕ НАСТРОЙКАМИ СИСТЕМЫ                       ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║    1   =   Включить Wi-Fi                                              ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    2   =   Выключить Wi-Fi                                             ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    3   =   Включить Мобильные данные                                   ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    4   =   Bыключить Мобильные данные                                  ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    5   =   УСТОНОВИТЬ МАКС Яркость экрана                              ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    6   =   УСТОНОВИТЬ МАКС Тайм-аут экрана                             ║ 
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    7   =   ОТКРЫТЬ НАСТРОЙКИ                                           ║ 
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    8   =   МЕНЮ                                                        ║ 
echo ╚════════════════════════════════════════════════════════════════════════╝ 
SET /P SETTTING=ВЫБОР:

IF %SETTTING%==1 (adb shell svc wifi enable)
IF %SETTTING%==2 (adb shell svc wifi disable)
IF %SETTTING%==3 (adb shell svc data enable)
IF %SETTTING%==4 (adb shell svc data disable)
IF %SETTTING%==5 (adb shell settings put system screen_brightness 255)
IF %SETTTING%==6 (adb shell settings put system screen_off_timeout 2147483647)
IF %SETTTING%==7 (adb shell am start -n com.android.settings/.Settings)
IF %SETTTING%==8 (goto menu)
goto SETTTING


:: MENU COPU

:COPU
cls
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                   ВЫБЕРИТЕ ФАИЛ ДЛЯ КОПИРОВАНИЯ                        ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="All Files (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"
echo.
echo.
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                           КОПИРОВАНИЕ                                  ║
echo ╚════════════════════════════════════════════════════════════════════════╝
adb push "%filename%" /sdcard/

echo НАЖМИТЕ ЛЮБОЮ КЛАВИШУ ЧТОБЫ ПРОДОЛЖИТЬ & PAUSE

:: Clean up

del "%temp%\chooser.exe" 2>NUL

goto MENU

:: MENU INSTALL

:INSTALL
cls
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║             Выберите APK-файл который вы хотите установить             ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="App (*.apk)|*.apk";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"
echo.
echo.
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                       УСТАНОВКА ПРИЛОЖЕНИЯ                             ║
echo ╚════════════════════════════════════════════════════════════════════════╝
adb install "%filename%"

echo НАЖМИТЕ ЛЮБОЮ КЛАВИШУ ЧТОБЫ ПРОДОЛЖИТЬ & PAUSE

:: Clean up

del "%temp%\chooser.exe" 2>NUL

goto MENU

:: MENU Reboot

:Reboot
COLOR B
cls
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║   1   =   ПЕРЕЗАПУСК (ADB)                                             ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   2   =   ПЕРЕЗАПУСК В Bootloader (ADB)                                ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   3   =   ПЕРЕЗАПУСК В СИСТЕМУ (FASTBOOT)                              ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   4   =   ПЕРЕЗАПУСК В RECOVERY (ADB)                                  ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   5   =   ПЕРЕЗАПУСК В Kernel                                          ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   6   =   ПЕРЕЗАПУСК В FASTBOOT (Bootloader)                           ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   7   =   ПЕРЕЗАПУСК В RECOVERY (Bootloader)                           ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   8   =   MENU                                                         ║
echo ╚════════════════════════════════════════════════════════════════════════╝

SET /P reboot=ВЫБОР:

IF %reboot%==1 ( adb reboot )
IF %reboot%==2 (adb reboot bootloader )
IF %reboot%==3 (fastboot reboot )
IF %reboot%==4 (adb reboot recovery )
IF %reboot%==5 (goto bobo)
IF %reboot%==6 (fastboot reboot-bootloader)
IF %reboot%==7 (fastboot reboot recovery)
IF %reboot%==8 (goto menu)
goto Reboot

:bobo
cls
color 0a
echo.
echo.
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║           Select the Kernel you want to boot from the Popup            ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="Image (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"
echo.
echo.
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                         Booting Kernel now...                          ║
echo ╚════════════════════════════════════════════════════════════════════════╝
fastboot boot "%filename%"
echo.
echo ДЛЯ ПРОЖОЛЖЕНИЯ НАЖМИТЕ ЛЮБУЮ КЛАВИШУ & PAUSE
goto Reboot

:PAROL
cls
COLOR B
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                            СБРОС ПАРОЛЯ                                ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   1   =   МЕТОД 1                                                      ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   2   =   МЕТОД 2                                                      ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   3   =   МЕТОД 3                                                      ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   4   =   МЕТОД 4  (ROOT)                                              ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   5   =   МЕНЮ                                                         ║
echo ╚════════════════════════════════════════════════════════════════════════╝

SET /P PAROL=ВЫБОР:

IF %PAROL%==1 (goto metod_1)
IF %PAROL%==2 (goto metod_2)
IF %PAROL%==3 (goto metod_3)
IF %PAROL%==4 (goto metod_4)
IF %PAROL%==5 (goto MENU)
goto PAROL

:metod_1
adb shell rm /data/system/gesture.key
adb reboot
goto PAROL

:metod_2
adb shell cd /data/data/com.android.providers.settings/databases
adb shell sqlite3 settings.db
goto PAROL

:metod_3
adb shell rm /data/system/*.key
adb shell rm /data/system/locksettings.db
adb shell rm /data/system/locksettings.db-shm
adb shell rm /data/system//locksettings.db-wal
adb reboot
goto PAROL

:metod_4
title Method 4
adb shell su -c "rm /data/system/*.key"
adb shell su -c "rm /data/system/locksettings.db"
adb shell su -c "rm /data/system/locksettings.db-shm"
adb shell su -c "rm /data/system//locksettings.db-wal"
adb reboot
goto PAROL

::BACKUP

:BACKUP
cls
COLOR B
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                           РЕЗЕРВНАЯ КОПИЯ                              ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   1   =   СОЗДАТЬ                                                      ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   2   =   ВОСТОНОВИТЬ                                                  ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   3   =   УДАЛИТЬ ВСЕ РЕЗЕРВНЫЕ КОПИИ                                  ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   4   =   МЕНЮ                                                         ║
echo ╚════════════════════════════════════════════════════════════════════════╝

SET /P BACKUP=ВЫБОР:

IF %BACKUP%==1 (goto BACKUP1)
IF %BACKUP%==2 (goto BACKUP2)
IF %BACKUP%==3 (del "Backup\*.ab" & goto BACKUP )
IF %BACKUP%==4 (goto MENU)

:BACKUP1
CLS
ECHO ПОДОЖДИТЕ ИДЕТ СОЗДАНИЕ РЕЗЕВНОЙ КОПИИ
adb backup -apk -all -shared -f Backup\%DEVICE%-%BRAND%-%MODEL%.ab
goto BACKUP

:BACKUP2
CLS
ECHO ПОДОЖДИТЕ ИДЕТ ВОСТОНОВЛЕНИЕ ИЗ РЕЗЕВНОЙ КОПИИ
adb restore Backup\%DEVICE%-%BRAND%-%MODEL%.ab
goto BACKUP

:: WIPE

:WIPE
cls
COLOR B
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║              УСТРОЙСТВО ЗАГРУЖЕНО В Вbootloader?                       ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║                          1  =  ДА                                      ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║                          2  =  НЕТ                                     ║
echo ╚════════════════════════════════════════════════════════════════════════╝

SET /P WIPE=ВЫБОР:

IF %WIPE%==1 (goto WIPE0)
IF %WIPE%==2 (adb reboot bootloader & goto WIPE0 )

:WIPE0
cls	
COLOR B
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                    ОЧИСТКА РАЗДЕЛОВ И ПРОШИB                           ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║    1   =  ОЧИСТКА system                                               ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    2   =  ОЧИСТКА userdata                                             ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    3   =  ОЧИСТКА recovery                                             ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    4   =  ОЧИСТКА boot                                                 ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    5   =  ОЧИСТКА cache                                                ║ 
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    6   =  ОЧИСТКА radio                                                ║ 
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    7   =  сброс                                                        ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    8   =  Прошив system                                                ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    9   =  Прошив userdata                                              ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    10  =  Прошив recovery                                              ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    11  =  Прошив boot                                                  ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    12  =  Прошив cache                                                 ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    13  =  Прошив radio                                                 ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    14  =  прошив в формате zip                                         ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    15  =  FLASH ALL                                                    ║
echo ║————————————————————————————————————————————————————————————————————————║
echo ║    16  =  MEHЮ                                                         ║
echo ╚════════════════════════════════════════════════════════════════════════╝ 

SET /P WIPE0=ВЫБОР:

IF %WIPE0%==1 (fastboot erase system & pause & goto WIPE0)
IF %WIPE0%==2 (fastboot erase userdata & pause & goto WIPE0)
IF %WIPE0%==3 (fastboot erase recovery & pause & goto WIPE0)
IF %WIPE0%==4 (fastboot erase boot & pause & goto WIPE0)
IF %WIPE0%==5 (fastboot erase cache & pause & goto WIPE0)
IF %WIPE0%==6 (fastboot erase radio & pause & goto WIPE0)
IF %WIPE0%==7 (fastboot -w & pause & goto WIPE0)
IF %WIPE0%==8 (GOTO system)
IF %WIPE0%==9 (GOTO userdata)
IF %WIPE0%==10 (GOTO recovery)
IF %WIPE0%==11 (GOTO boot)
IF %WIPE0%==12 (GOTO cache)
IF %WIPE0%==13 (GOTO radio)
IF %WIPE0%==14 (GOTO all)
IF %WIPE0%==15 (GOTO ALL2 )
IF %WIPE0%==16 (GOTO MENU)
GOTO WIPE0

:ALL2
cls
color 5
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                     ВЫБЕРИТЕ ФАИЛ (FLASHALL.CMD)                       ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="All Files (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"

echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                          ПРОШИВ ALL                                    ║
echo ╚════════════════════════════════════════════════════════════════════════╝
%filename%
echo ДЛЯ ПРОЖОЛЖЕНИЯ НАЖМИТЕ ЛЮБУЮ КЛАВИШУ & PAUSE
GOTO WIPE0

:system
cls
color 5
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                     ВЫБЕРИТЕ ФАИЛ ПРОШИВКИ system                      ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="All Files (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"

echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                          ПРОШИВ system                                 ║
echo ╚════════════════════════════════════════════════════════════════════════╝
fastboot flash system %filename%
echo ДЛЯ ПРОЖОЛЖЕНИЯ НАЖМИТЕ ЛЮБУЮ КЛАВИШУ & PAUSE
GOTO WIPE0

:userdata
cls
color 5
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                     ВЫБЕРИТЕ ФАИЛ ПРОШИВКИ userdata                    ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="All Files (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"

echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                          ПРОШИВ userdata                               ║
echo ╚════════════════════════════════════════════════════════════════════════╝
fastboot flash userdata %filename%
echo ДЛЯ ПРОЖОЛЖЕНИЯ НАЖМИТЕ ЛЮБУЮ КЛАВИШУ & PAUSE
GOTO WIPE0

:recovery
cls
color 5
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                     ВЫБЕРИТЕ ФАИЛ ПРОШИВКИ recovery                    ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="All Files (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"

echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                          ПРОШИВ recovery                               ║
echo ╚════════════════════════════════════════════════════════════════════════╝
fastboot flash recovery %filename%
echo ДЛЯ ПРОЖОЛЖЕНИЯ НАЖМИТЕ ЛЮБУЮ КЛАВИШУ & PAUSE
GOTO WIPE0

:boot
cls
color 5
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                     ВЫБЕРИТЕ ФАИЛ ПРОШИВКИ boot                        ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="All Files (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"

echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                          ПРОШИВ boot                                   ║
echo ╚════════════════════════════════════════════════════════════════════════╝
fastboot flash boot %filename%
echo ДЛЯ ПРОЖОЛЖЕНИЯ НАЖМИТЕ ЛЮБУЮ КЛАВИШУ & PAUSE
GOTO WIPE0

:cache
cls
color 5
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                     ВЫБЕРИТЕ ФАИЛ ПРОШИВКИ cache                       ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="All Files (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"

echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                          ПРОШИВ cache                                  ║
echo ╚════════════════════════════════════════════════════════════════════════╝
fastboot flash cache %filename%
echo ДЛЯ ПРОЖОЛЖЕНИЯ НАЖМИТЕ ЛЮБУЮ КЛАВИШУ & PAUSE
GOTO WIPE0

:radio
cls
color 5
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                     ВЫБЕРИТЕ ФАИЛ ПРОШИВКИ radio                       ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="All Files (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"

echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                          ПРОШИВ radio                                  ║
echo ╚════════════════════════════════════════════════════════════════════════╝
fastboot flash radio %filename%
echo ДЛЯ ПРОЖОЛЖЕНИЯ НАЖМИТЕ ЛЮБУЮ КЛАВИШУ & PAUSE
GOTO WIPE0

:all
cls
color 5
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                     ВЫБЕРИТЕ ФАИЛ ПРОШИВКИ update                      ║
echo ╚════════════════════════════════════════════════════════════════════════╝
setlocal enabledelayedexpansion
:: Does powershell.exe exist within %PATH%?
for %%I in (`powershell.exe`) do if "%%~$PATH:I" neq "" (
    set chooser=powershell "Add-Type -AssemblyName System.windows.forms|Out-Null;$f=New-Object System.Windows.Forms.OpenFileDialog;$f.InitialDirectory='%cd%';$f.Filter='All Files (*.*)|*.*';$f.showHelp=$true;$f.ShowDialog()|Out-Null;$f.FileName"
) else (
rem :: If not, compose and link C# application to open file browser dialog
    set chooser=%temp%\chooser.exe
    >"%temp%\c.cs" echo using System;using System.Windows.Forms;
    >>"%temp%\c.cs" echo class dummy{
    >>"%temp%\c.cs" echo public static void Main^(^){
    >>"%temp%\c.cs" echo OpenFileDialog f=new OpenFileDialog^(^);
    >>"%temp%\c.cs" echo f.InitialDirectory=Environment.CurrentDirectory;
    >>"%temp%\c.cs" echo f.Filter="All Files (*.*)|*.*";
    >>"%temp%\c.cs" echo f.ShowHelp=true;
    >>"%temp%\c.cs" echo f.ShowDialog^(^);
    >>"%temp%\c.cs" echo Console.Write^(f.FileName^);}}
    for /f "delims=" %%I in ('dir /b /s "%windir%\microsoft.net\*csc.exe"') do (
        if not exist "!chooser!" "%%I" /nologo /out:"!chooser!" "%temp%\c.cs" 2>NUL
    )
    del "%temp%\c.cs"
)

:: Capture choice to a variable
for /f "delims=" %%I in ('%chooser%') do set "filename=%%I"

echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                          ПРОШИВ update                                 ║
echo ╚════════════════════════════════════════════════════════════════════════╝
fastboot flash update %filename%
echo ДЛЯ ПРОЖОЛЖЕНИЯ НАЖМИТЕ ЛЮБУЮ КЛАВИШУ & PAUSE
GOTO WIPE0 

:ECRAN
cls
COLOR B
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                        УПРОВЛЕНИЕ ЭКРАНОМ                              ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   1   =   Изменить разрешение экрана                                   ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   2   =   Изменить плотность экрана                                    ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   3   =   Сбросить разрешение и плотность                              ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   4   =   Включить/ВЫКЛЮЧИТЬ экран                                     ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   5   =   ПОКАЗАТЬ ЭКРАН                                               ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   6   =   СИМУЛЯЦИЯ ВВОДА И ЖЕСТОВ                                     ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   7   =   МЕНЮ                                                         ║
echo ╚════════════════════════════════════════════════════════════════════════╝

SET /P ECRAN=ВЫБОР:

IF %ECRAN%==1 (goto ECRAN1)
IF %ECRAN%==2 (goto ECRAN2)
IF %ECRAN%==3 (adb shell wm size reset & adb shell wm density reset)
IF %ECRAN%==4 (adb shell input keyevent KEYCODE_POWER)
IF %ECRAN%==5 (start scrcpy.vbs)
IF %ECRAN%==6 (GOTO ZECT)
IF %ECRAN%==7 (goto MENU)
GOTO ECRAN

:ECRAN1
CLS
ECHO Изменить разрешение экрана  
for /F "delims=" %%a in ('adb shell wm size') do set ROSHECR=%%a>NUL
echo ТЕКУШЕЕ РАСШЕРЕНИЕ ЭКРАНА: %ROSHECR%
ECHO ВВИДЕТЕ РАСШЕРЕНИЕ ЭКРАНА
SET /P RASHECR=
adb shell wm size %RASHECR%
for /F "delims=" %%a in ('adb shell wm size') do set ROSHECR=%%a>NUL
echo ТЕКУШЕЕ РАСШЕРЕНИЕ ЭКРАНА: %ROSHECR%
ECHO.
echo НАЖМИТЕ ЛЮБОЮ КЛАВИШУ ДЛЯ ПЕРЕХОДА В МЕНЮ & PAUSE
GOTO ECRAN

:ECRAN2
CLS
ECHO Изменить плотность экрана
for /F "delims=" %%a in ('adb shell wm density') do set density=%%a>NUL
echo ТЕКУШЯЯ плотность экрана: %density%
ECHO ВВИДЕТЕ плотность экрана
SET /P density11=
adb shell wm density %density11%
for /F "delims=" %%a in ('adb shell wm density') do set density1=%%a>NUL
echo ТЕКУШЯЯ плотность экрана: %density1%
ECHO.
echo НАЖМИТЕ ЛЮБОЮ КЛАВИШУ ДЛЯ ПЕРЕХОДА В МЕНЮ & PAUSE
GOTO ECRAN

:ZECT
cls
COLOR B
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                   СИМУЛЯЦИЯ ВВОДА И ЖЕСТОВ                             ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   1   =   без экрана                                                   ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   2   =   Назад                                                        ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   3   =   Вверх                                                        ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   4   =   Вниз                                                         ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   5   =   Влево                                                        ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   6   =   Вправо                                                       ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   7   =   Tab                                                          ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   8   =   Enter                                                        ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   9   =   Ввод текста                                                  ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   10  =   ЭМУЛЯЦИЯ МЫШИ (OFF ADB)                                      ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   11  =  нажатие Delete                                                ║
echo ╚════════════════════════════════════════════════════════════════════════╝

SET /P ZECT=ВЫБОР:

IF %ZECT%==1 (start SIMULNOECR.CMD & GOTO MENU)
IF %ZECT%==2 (adb shell input keyevent KEYCODE_BACK)
IF %ZECT%==3 (adb shell input keyevent KEYCODE_DPAD_UP)
IF %ZECT%==4 (adb shell input keyevent KEYCODE_DPAD_DOWN)
IF %ZECT%==5 (adb shell input keyevent KEYCODE_DPAD_LEFT)
IF %ZECT%==6 (adb shell input keyevent KEYCODE_DPAD_RIGHT)
IF %ZECT%==7 (adb shell input keyevent KEYCODE_TAB)
IF %ZECT%==8 (adb shell input keyevent KEYCODE_ENTER)
IF %ZECT%==9 (GOTO TEXSTT)
IF %ZECT%==10 (scrcpy\scrcpy --mouse=aoa --otg)
IF %ZECT%==11 (adb shell input keyevent KEYCODE_DEL)
GOTO ZECT

:TEXSTT
CLS
ECHO (ВВЕДИТЕ ТЕКСТ (ТОЛЬКО ENGLISH БУКВЫ)
SET /P TEXSTT=
adb shell input text %TEXSTT%
GOTO ZECT

:MENU3
cls
COLOR B
echo ╔════════════════════════════════════════════════════════════════════════╗
echo ║                      ДОПОЛНИТЕЛЬНОЕ МЕНЮ 1                             ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   1   =   ResearchDownload                                             ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   2   =   SP FLASH TOOL                                                ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   3   =   XiaoMiFlash.exe                                              ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   4   =   MIK                                                          ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   5   =   MIT                                                          ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   6   =   TFT                                                          ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   7   =   SPFLASTOOL+Bypass                                            ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   8   =                                                           ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   9   =                                                     ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   10  =                                         ║
echo ║════════════════════════════════════════════════════════════════════════║
echo ║   11  = MENU                                                           ║
echo ╚════════════════════════════════════════════════════════════════════════╝

SET /P MENU3=ВЫБОР:

IF %MENU3%==1 (TFTUnlock\Data\bin\tft.bat)
IF %MENU3%==2 (TFTUnlock\Data\MTK\tft.bat)
IF %MENU3%==3 (MiFlash\XiaoMiFlash.exe)
IF %MENU3%==4 (MITK\mik\MIK.exe)
IF %MENU3%==5 (MITK\mit\MIT.exe)
IF %MENU3%==6 (TFTUnlock\tft.bat)
IF %MENU3%==7 (SP+Bypass\SP.bat)
IF %MENU3%==8 ()
IF %MENU3%==9 ()
IF %MENU3%==10 ()
IF %MENU3%==11 (GOTO menu)
GOTO MENU3






































::EXIT

:EXIT
TASKKILL /IM ADB.EXE /T /f & TASKKILL /IM fastboot.exe /T /f & EXIT /B
