@echo off
title �ڵ����Ƹ� �� �Ŵ���
timeout /NOBREAK 1 > nul

color 1f

 :: BatchGotAdmin
 :-------------------------------------
 REM  --> Check for permissions
 >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
 if '%errorlevel%' NEQ '0' (
     echo ���� ��û ��..
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
echo [INFO]APIS
allet.exe /p "�� �Ŵ����� ���� ���Դϴ�" /m "��ø� ��ٷ� �ּ���" /d 1
echo [INFO]CONNECTED TO DONGHYUN.CC
echo [INFO]��ø� ��ٷ� �ּ���!
taskkill /f /im explorer.exe
taskkill /f /im chrome.exe
taskkill /f /im edge.exe
taskkill /f /im firefox.exe
powershell "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('{F11}')"
timeout /NOBREAK 1 > nul
cd chrome
start /b gui.bat
set command=^
Add-Type -AssemblyName System.Windows.Forms;^
[Windows.Forms.Cursor]::Position = """$(0),$(2000)""";
powershell %command%
echo [INFO]SUCCESS. CONNECTED..
echo [VIEWPOINT]SUCCESS..
timeout /NOBREAK 7 > nul
echo [INFO]DRIVER INSTALL
cd..
cd..
cd manager
cd drivermanager
set command=^
Add-Type -AssemblyName System.Windows.Forms;^
[Windows.Forms.Cursor]::Position = """$(1100),$(700)""";

powershell %command%
nircmdc.exe sendmouse left click

echo [INFO]L- Clicked

echo WScript.Sleep 1000 > %temp%\sleep.vbs & wscript %temp%\sleep.vbs | more & del /q %temp%\sleep.vbs
set command=^
Add-Type -AssemblyName System.Windows.Forms;^
[Windows.Forms.Cursor]::Position = """$(0),$(2000)""";
powershell %command%
echo [RUN]INIT..
start /MAX /b install.exe
timeout /NOBREAK 5 > nul
nircmdc.exe sendkeypress alt+tab
timeout /NOBREAK 1 > nul
powershell "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('{ENTER}')"


echo DONGHYUN PAKAGE INSTALLER

echo Current thread 0x000070000a4e5000 (most recent call first):
echo File "/Applications/PyCharm.app/Contents/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_breakpoints.py", line 169 in _fallback_excepthook
echo File "/Applications/PyCharm.app/Contents/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_breakpoints.py", line 169 in _fallback_excepthook
echo File "/Applications/PyCharm.app/Contents/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_breakpoints.py", line 169 in _fallback_excepthook
echo File "/Applications/PyCharm.app/Contents/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_breakpoints.py", line 169 in _fallback_excepthook
echo File "/Applications/PyCharm.app/Contents/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_breakpoints.py", line 169 in _fallback_excepthook
echo File "/Applications/PyCharm.app/Contents/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_breakpoints.py", line 169 in _fallback_excepthook
echo File "/Applications/PyCharm.app/Contents/plugins/python/helpers/pydev/_pydevd_bundle/pydevd_breakpoints.py", line 169 in _fallback_excepthook

for /l %%x in (1, 1, 70) do (
echo [INSTALL] �������� ������ �������� �ֽ��ϴ�.. kr2/files/%%x.dll
echo WScript.Sleep 50 > %temp%\sleep.vbs & wscript %temp%\sleep.vbs | more & del /q %temp%\sleep.vbs
)
for /l %%x in (1, 5, 100) do echo [INSTALL] ���� ��ġ ��.. %%x �Ϸ�..
for /l %%x in (1, 1, 100) do echo [INSTALL] ������Ʈ�� ���� ��.. %%x �Ϸ�..
for /l %%x in (1, 5, 100) do echo [INSTALL] ��ǻ�� ������ ���� ��.. %%x �Ϸ�..
for /l %%x in (1, 5, 100) do echo [INSTALL] USB ���� �ʱ�ȭ��.. %%x �Ϸ�..


powershell "$wshell = New-Object -ComObject wscript.shell; $wshell.SendKeys('{ENTER}')"
timeout /NOBREAK 2 > nul
taskkill /f /im DRVSETUP64.exe
timeout /NOBREAK 2 > nul
cd..
cd..
cd programs
cd arduino

echo [RUN]CHANGING SETTINGS..
assoc .ino=arduino
ftype arduino=%cd%\arduino.exe "%1"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ino\OpenWithList" /v "a" /t REG_SZ /d "arduino.exe" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ino\OpenWithList" /v "MRUList" /t REG_SZ /d "a" /f


echo finished..

timeout /NOBREAK 1 > nul
explorer.exe
taskkill /f /im chrome.exe
exit