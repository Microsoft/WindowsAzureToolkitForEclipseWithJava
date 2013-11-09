@rem check if running in emulator , if yes then ignore session affinity settings silently
if "%EMULATED%"=="true" goto Exit

@rem Installing ARR
%ROLEROOT%\plugins\WebDeploy\WebpiCmd.exe /Install /accepteula /Products:ARR

@rem Settings W3SVC startup mode to auto
SC Config W3SVC Start= Auto

@rem calling session affinity agent 
set d=%~dp0
set d=%d:\=/%
start %d%\SessionAffinityAgent.exe %1 %2 %3 %4
%d%\SessionAffinityAgent.exe -blockstartup

:Exit
exit 0