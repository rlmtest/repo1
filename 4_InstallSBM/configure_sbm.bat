@REM echo on

SET SCRIPT_ROOT=%~dp0
set sbm_install_dir=%~1
set config_snapshot_name=%~2
set sources=%~3

if "%sbm_install_dir%" == "" (
	set sbm_install_dir=C:\Program Files\Serena
)

if "%config_snapshot_name%" == "" (
	exit 1
	rem set config_snapshot_name=config.cnfsnp
)

if "%sources%" == "" (
	set sources=C:\Automation\Solutions.Test\AutoDeployRLM\4_InstallSBM
)

REM Run Configurator
cd "%sbm_install_dir%\SBM\ConfigUtility"
start /wait ConfigurationUtility.exe /t "%sources%\snapshots\%config_snapshot_name%" /silent

exit 0