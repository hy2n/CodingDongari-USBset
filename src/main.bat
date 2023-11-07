@echo off
title 코딩동아리 닷 매니저
timeout /NOBREAK 1 > nul

color 1f

 :: 관리자권한
 :-------------------------------------
 REM  --> Check for permissions
 >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
 if '%errorlevel%' NEQ '0' (
     echo 권한 요청 중..
     goto UACPrompt
 ) else ( goto gotAdmin )

:UACPrompt
     echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
     echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
     exit /B

:gotAdmin
     if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
     pushd "%CD%"
     CD /D "%~dp0"

echo [INFO]LOADING..
cd..
cd java
allet.exe /p "닷 매니저가 실행 중입니다" /m "잠시만 기다려 주세요" /d 1
echo [INFO] Killing Browser

::브라우저 종료
taskkill /f /im explorer.exe
taskkill /f /im chrome.exe
taskkill /f /im edge.exe
taskkill /f /im firefox.exe

echo [INFO] Starting Full Screen
::전체화면 진입
powershell "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('{F11}')"
timeout /NOBREAK 1 > nul

echo [INFO] Starting WebView
::웹뷰 시작
cd chrome
start /b gui.bat

echo [INFO] Install Driver
::드라이버설치

set command=^
Add-Type -AssemblyName System.Windows.Forms;^
[Windows.Forms.Cursor]::Position = """$(0),$(2000)""";
powershell %command%
echo [VIEWPOINT] 설치대기
timeout /NOBREAK 7 > nul

echo [INFO] 드라이버 실행
cd..
cd..
cd manager
cd drivermanager
set command=^
Add-Type -AssemblyName System.Windows.Forms;^
[Windows.Forms.Cursor]::Position = """$(1100),$(700)""";

powershell %command%
nircmdc.exe sendmouse left click

::드라이버설치
echo [INFO]L- Clicked

echo WScript.Sleep 1000 > %temp%\sleep.vbs & wscript %temp%\sleep.vbs | more & del /q %temp%\sleep.vbs
set command=^
Add-Type -AssemblyName System.Windows.Forms;^
[Windows.Forms.Cursor]::Position = """$(0),$(2000)""";
powershell %command%
echo [RUN]INIT..

echo [INFO] Install Driver 2
::드라이버 2 설치

start /MAX /b install.exe
timeout /NOBREAK 5 > nul
nircmdc.exe sendkeypress alt+tab
timeout /NOBREAK 1 > nul
powershell "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('{ENTER}')"

echo Current thread 0x000070000a4e5000 (most recent call first):
REN File "/Applications/PyCharm.app/Contents/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_breakpoints.py"

powershell "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('{ENTER}')"
timeout /NOBREAK 2 > nul
taskkill /f /im DRVSETUP64.exe
timeout /NOBREAK 2 > nul
cd..
cd..
cd programs
cd arduino

echo [INFO] 레지스트리 설정
::ASSOC ino파일 에디터 연결 설정

assoc .ino=arduino
ftype arduino=%cd%\arduino.exe "%1"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ino\OpenWithList" /v "a" /t REG_SZ /d "arduino.exe" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ino\OpenWithList" /v "MRUList" /t REG_SZ /d "a" /f


echo finished..

timeout /NOBREAK 1 > nul
explorer.exe
taskkill /f /im chrome.exe
exit
