set LOCAL=C:\Automation
set SBM_ROOT=C:\Program Files\Serena\SBM

rem Copy JDBC driver for Oracle to JBoss libraries location
cd %LOCAL%\Solutions.Test\AutoDeployRLM\7_InstallSRA\JDBC
xcopy /y /i "ojdbc6_g.jar" "%SBM_ROOT%\Common\jboss405\server\default\lib"
