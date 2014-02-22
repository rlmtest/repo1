@REM echo on

set sbm_install_dir=%~1

if "%sbm_install_dir%" == "" (
	set sbm_install_dir=C:\Program Files\Serena
)

REM Upgrade DB
"%sbm_install_dir%\SBM\Application Engine\bin\ttadmin.exe" /upgradeonly

exit 0