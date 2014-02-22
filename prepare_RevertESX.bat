set areaname=RevertESXGeneric2
set jobname=%~1
if not "%jobname%"=="" set areaname=%jobname%
..\..\AutomationLauncher\Test-Launcher.exe -style -disablelog:screenshot -alternativeworkarealocation:"..\..\AutomationLauncher\%areaname%" -testslist:2_PrepareVM\_list_RevertESX.xml %~2 -parameters:common_params.xml