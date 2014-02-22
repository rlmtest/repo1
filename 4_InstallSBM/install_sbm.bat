@REM echo on

SET SCRIPT_ROOT=%~dp0 rem Current directory of this batch file
rem set release_name=%~1
set components_list=%~1
set sbm_install_dir=%~2
set upgrade=%~3
set SOURCE_ROOT=%~4

rem SET SOURCE_ROOT=C:\SBM_Automated_Push  rem !!!!!!!!!!!

rem for log
rem if "%release_name%" == "" ( 
	rem set release_name=BM10_1_X
rem )

if "%components_list%" == "" (
	set components_list=AE,OE,SSO,MAN,CS,CU,NS,CT,SBM_Composer,Sample,JRE
	rem set components_list=AE,OE,SSO,MAN,CS,CU,NS,CT,Sample,JRE

)

if "%sbm_install_dir%" == "" (
	set sbm_install_dir="C:\Program Files\Serena"
)

if "%upgrade%" == "" (
	set upgrade=false
)

if "%SOURCE_ROOT%" == "" (
	set SOURCE_ROOT="C:\Automation\SBM"
)

rem FOR %%F in ( %SOURCE_ROOT%\%release_name%\*.exe ) do SET SETUP_FILE=%%~F 
FOR %%F in ( %SOURCE_ROOT%\*.exe ) do SET SETUP_FILE=%%~F 

REM Run installer
if "%upgrade%" == "false" (
	start /wait %SETUP_FILE% /s /v"/qn INSTALLDIR=\"%sbm_install_dir%\" /l*v %SOURCE_ROOT%\SBMInstallation.log ADDLOCAL=\"%components_list%\" REBOOT=\"ReallySuppress\""
)

if "%upgrade%" == "true" (
	start /wait %SETUP_FILE% /s /v"/qn /l*v %SOURCE_ROOT%\SBMInstallation.log REBOOT=\"ReallySuppress\""
	shutdown /r
)

exit 0
