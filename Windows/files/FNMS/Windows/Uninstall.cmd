@ECHO off
REM Uninstall FNMS Agent
REM File: Uninstall.cmd
REM Date: 29.04.2019
REM Author: Elmar Grosse Holling

SET AGENTPATH=%~dp0Agent
SET LOGPATH=%~dp0Log

:EXEC
msiexec /x "%AGENTPATH%\FlexNet Inventory Agent.msi" /qb! /L*v "%LOGPATH%\FNMSAgentUninstall.log" REBOOT="ReallySuppress"

:END
TIMEOUT /T 30
EXIT