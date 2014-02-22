rem set bits=_x64
rem set installer_source_root=C:\Automation\ALMInstaller
rem set installer_exe=SOIT50%bits%.exe

SET SCRIPT_ROOT=%~dp0 rem Current directory of this batch file
set INSTALLER_SOURCE_ROOT=%~1
set INSTALLER=%~2
set DESTINATION_PATH=%~3



if "%INSTALLER_SOURCE_ROOT%" == "" (
	set INSTALLER_SOURCE_ROOT=C:\Automation\ALMInstaller
)

if "%INSTALLER%" == "" (
	FOR %%F in ( %INSTALLER_SOURCE_ROOT%\*.exe ) do SET INSTALLER=%%~F 
)

if "%DESTINATION_PATH%" == "" (
	set DESTINATION_PATH=C:\Program Files\Serena
)

echo %INSTALLER_SOURCE_ROOT%\%INSTALLER%
echo %INSTALLER_SOURCE_ROOT%\%INSTALLER%.log
echo %DESTINATION_PATH%

start /wait %INSTALLER_SOURCE_ROOT%\%INSTALLER% /s /v"/qn INSTALLDIR=\"%DESTINATION_PATH%\" /l*v \"%INSTALLER_SOURCE_ROOT%\%INSTALLER%.log\" REBOOT=\"ReallySuppress\""

rem Then apply configuration snapshot
rem Then iisreset
rem Then JBOSS start