set workarea="C:\Automation\JenkinsSlave\AutoInstall"
set alt_workarea_path=%~1

if not "%alt_workarea_path%"=="" set workarea=%alt_workarea_path%
..\..\AutomationLauncher\Test-Launcher.exe -style -disablelog:screenshot -alternativeworkarealocation:%workarea% -testslist:3_InstallAndConfig\_listAll_clean.xml %~2 -parameters:common_params.xml
