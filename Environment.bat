@echo off
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v %1
goto label_%ERRORLEVEL%

:label_0
echo This Key is already there
for /f "tokens=1,2*" %%R in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v %1') do set VALUE=%%~T
setx %1 "%VALUE%;%~2" -m
goto end

:label_1
echo This Key does not exist yet
setx %1 "%~2" -m
goto end

:end
