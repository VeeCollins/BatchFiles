@echo off

set /p choice= "OBS Broadcast = 1, OBS record = 2, Traktor record = 3: " 


echo *******************************************************************

echo Advanced, Performance, Settings, Custom ** Turn everything off
echo Advanced ** Select background services
echo Virtual memory, change ** custom size 18GB (initial and maximum) 
echo Untick automatic manage paging

echo *******************************************************************

echo CHECK ADVANCED SETTINGS AS ABOVE
SystemPropertiesAdvanced
pause

echo *******************************************************************
echo CHECK POWER PLAN SETTINGS
powercfg.cpl 
pause

echo *******************************************************************
echo UPDATE AND PAUSE WINDOWS UPDATES
pause
start ms-settings:windowsupdate
pause

echo *******************************************************************
taskkill /f /im OneDrive.exe
echo ONEDRIVE TERMINATED         

pause

if %choice% == 3 echo *******************************************************************
if %choice% == 3 echo TURN OFF WIFI 
if %choice% == 3 pause

echo *******************************************************************
echo CHECK START UP 
pause        
start ms-settings:startupapps
pause

echo *******************************************************************
echo CLICK TO RUN REGEDIT, OBS AND TRAKTOR
pause

cd C:\Users\VK\Desktop
start "" "C:\Users\VK\Github\BatchFiles\BACKGROUND APPS OFF.reg"

timeout /t 10 /nobreak

if %choice% == 3 goto OpenTraktor

cd C:\Program Files\obs-studio\bin\64bit\
start "" /Realtime "C:\Program Files\obs-studio\bin\64bit\obs64.exe"

timeout /t 10 /nobreak

echo OBS RUNNING

:OpenTraktor
cd C:\Program Files\Native Instruments\Traktor Pro 2\
start "" /Realtime "C:\Program Files\Native Instruments\Traktor Pro 2\Traktor.exe"

echo TRAKTOR RUNNING
pause

echo *******************************************************************
if %choice% == 1 echo UPDATE TRAKTOR AND OBS
if %choice% == 2 echo UPDATE TRAKTOR AND OBS
if %choice% == 3 echo UPDATE TRAKTOR
pause

echo *******************************************************************
echo ANALYSE TRACKS IN TRAKTOR
pause

echo *******************************************************************
echo ANY KEY TO EXIT
timeout /t 60