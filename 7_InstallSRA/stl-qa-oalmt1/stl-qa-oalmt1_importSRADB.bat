rem start /wait exit | sqlplus -L -S system/manager@oalm @"C:\Automation\Solutions.Test\AutoDeployRLM\7_InstallSRA\stl-qa-oalmt1\drop_schema.sql"
rem pause
rem ping -n 5 -w 1000 127.0.0.1 > nul
impdp system/manager@oalm schemas=serena_ra directory=dmpdir dumpfile=SERENA_RA_STLQAOALMT1DB.DMP logfile=serena_ra_import.log
rem pause