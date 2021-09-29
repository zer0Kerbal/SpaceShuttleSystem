@echo off
cls
setlocal

echo _buildJSON-v1.3.3.6 )CENTRAL( version
echo using _release.json SCHEMA 1.0.2.0
echo.

IF "%~1"=="-v" (
    ECHO %~dp0
    GOTO EOF
)

IF "%~1"=="-v" (
    GOTO EOF
)
rem Note the tilde character which causes any surrounding quotes to be removed from 
rem the value of %1; without a tilde you will get unexpected results if that value 
rem includes double quotes, including the possibility of syntax errors.

rem ECHO %~dp0
rem To get the path of the directory where the batch file was launched from 
rem (very useful!) you can use

rem EQU - Equal to
rem NEQ - Not equal to
rem LSS - Less than
rem LEQ - Less than or equal to
rem GTR - Greater than
rem GEQ - Greater than or equal to

rem Set variables here:
set GAMEDATA=GameData
set JSONDIR=json

rem to fix json formatting issue
set TAB=" "
rem remove "" if present
for /f "useback tokens=*" %%a in ('%TAB%') do set TAB=%%~a

rem set derived variables here:
set RELEASEFILE=%JSONDIR%\_release.json

rem set utilities locations
set JQ=C:\ProgramData\chocolatey\lib\jq\tools\jq.exe

rem fetch mod folder name from _release.json
%JQ% ".MODFOLDER" %RELEASEFILE% >tmpfile
set /P MODFOLDER=<tmpfile
for /f "useback tokens=*" %%a in ('%MODFOLDER%') do set MODFOLDER=%%~a

rem fetch mod name from _release.json
%JQ% ".MODNAME" %RELEASEFILE% >tmpfile
set /P MODNAME=<tmpfile

rem fetch mod license from _release.json
%JQ% ".URL.LICENSE" %RELEASEFILE% >tmpfile
set /P MODLICENSE=<tmpfile

rem fetch mod releasetype from _release.json
%JQ% ".RELEASETYPE" %RELEASEFILE% >tmpfile
set /P RELEASETYPE=<tmpfile
for /f "useback tokens=*" %%a in ('%RELEASETYPE%') do set RELEASETYPE=%%~a

rem **************************************
rem fetch mod code.dnet from _release.json
rem **************************************
%JQ% ".CODE.DNET" %RELEASEFILE% >tmpfile
set /P DNET=<tmpfile

rem remove "" if present
for /f "useback tokens=*" %%a in ('%DNET%') do set DNET=%%~a

rem fetch mod code.unit from _release.json
%JQ% ".CODE.UNIT" %RELEASEFILE% >tmpfile
set /P UNITY=<tmpfile

rem remove "" if present
for /f "useback tokens=*" %%a in ('%UNITY%') do set UNITY=%%~a

rem fetch mod code.lang from _release.json
%JQ% ".CODE.LANG" %RELEASEFILE% >tmpfile
set /P LANG=<tmpfile

rem remove "" if present
for /f "useback tokens=*" %%a in ('%LANG%') do set LANG=%%~a
IF EXIST tmpfile del /F tmpfile 

rem **************************************
rem only include code items that aren't "" ˫
rem set CODE="<%DNET%> <%UNITY%> <%LANG%>" «« ˂˃
rem ************************************** »»
IF "%DNET%" NEQ "" ( echo|set /p="˂˂%DNET%˃˃ " >>tmpfile )
IF "%UNITY%" NEQ "" ( echo|set /p="˂˂%UNITY%˃˃  " >>tmpfile )
IF "%LANG%" NEQ "" ( echo|set /p="˂˂%LANG%˃˃" >>tmpfile )
set /P CODE=<tmpfile

IF EXIST tmpfile del /F tmpfile 

rem GET info from .version ********************
rem Get Version info
set VERSIONFILE=%MODFOLDER%.version

rem The following requires the JQ program, available here: https://stedolan.github.io/jq/download/

rem ************************** MOD VERSION
rem extract mod version from .version file
rem **************************************
%JQ% ".VERSION.MAJOR" %VERSIONFILE% >tmpfile
set /P major=<tmpfile

%JQ% ".VERSION.MINOR" %VERSIONFILE% >tmpfile
set /P minor=<tmpfile

%JQ% ".VERSION.PATCH" %VERSIONFILE% >tmpfile
set /P patch=<tmpfile

%JQ% ".VERSION.BUILD"  %VERSIONFILE% >tmpfile
set /P build=<tmpfile

set VERSION=%major%.%minor%.%patch%.%build%

rem ************************** KSP VERSION
rem extract KSP version from .version file
rem **************************************
%JQ% ".KSP_VERSION.MAJOR" %VERSIONFILE% >tmpfile
set /P kspmajor=<tmpfile

%JQ% ".KSP_VERSION.MINOR" %VERSIONFILE% >tmpfile
set /P kspminor=<tmpfile

%JQ% ".KSP_VERSION.PATCH" %VERSIONFILE% >tmpfile
set /P ksppatch=<tmpfile

set KSPVERSION=%kspmajor%.%kspminor%.%ksppatch%

rem ******************* Clean up tmpfile
del tmpfile

rem ********************************
rem ENDLOCAL here to prevent errors
rem ********************************
rem ENDLOCAL

rem ******************* Update _releasefile
rem ***************************************
echo Updating json\_releasefile.json
%JQ% --arg VAR %KSPVERSION% ".KSPVERSION = $VAR" %RELEASEFILE% >json\tmp.json
move json\tmp.json %RELEASEFILE%

rem ********************* print info
rem ********************************
echo.
echo Version:  %VERSION%  %RELEASETYPE%
echo for KSP version: %KSPVERSION%
echo License: %MODLICENSE%
echo Code: %CODE%
echo.


rem *********************** mod.json
rem ********************************
set FILE="%JSONDIR%\mod.json"
IF EXIST %FILE% del /F %FILE%

echo {>>%FILE%
echo %TAB%"schemaVersion": 1,>>%FILE%
echo %TAB%"label": %MODNAME%,>>%FILE%
echo %TAB%"labelColor": "BADA55",>>%FILE%
echo %TAB%"message": "%VERSION%",>>%FILE%
echo %TAB%"color": "darkgreen",>>%FILE%
echo %TAB%"style": "plastic">>%FILE%
echo }>>%FILE%

rem *********************** ksp.json
rem ********************************
set FILE="%JSONDIR%\ksp.json"
IF EXIST %FILE% del /F %FILE%

echo {>>%FILE%
echo %TAB%"schemaVersion": 1,>>%FILE%
echo %TAB%"label": "KSP",>>%FILE%
echo %TAB%"labelColor": "darkblue",>>%FILE%
echo %TAB%"message": "%KSPVERSION%",>>%FILE%
echo %TAB%"color": "66ccff",>>%FILE%
echo %TAB%"style": "plastic">>%FILE%
echo }>>%FILE%

rem ******************* license.json
rem ********************************
IF %MODLICENSE:~1,3% == MIT (
    echo MIT: %MODLICENSE%
    set COLOR=red
    set LABELCOLOR=black
    set LOGOCOLOR=white
    rem SET LOGOSVG="base64,PHN2ZyAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgICB4bWxuczpjYz0iaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbnMjIiAgIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyIgICB4bWxuczpzdmc9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiAgIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgICB4bWxuczpzb2RpcG9kaT0iaHR0cDovL3NvZGlwb2RpLnNvdXJjZWZvcmdlLm5ldC9EVEQvc29kaXBvZGktMC5kdGQiICAgeG1sbnM6aW5rc2NhcGU9Imh0dHA6Ly93d3cuaW5rc2NhcGUub3JnL25hbWVzcGFjZXMvaW5rc2NhcGUiICAgd2lkdGg9IjI1NiIgICBoZWlnaHQ9IjI1NiIgICBpZD0ic3ZnMiIgICB2ZXJzaW9uPSIxLjEiICAgaW5rc2NhcGU6dmVyc2lvbj0iMC40NyByMjI1ODMiICAgc29kaXBvZGk6ZG9jbmFtZT0ibGljZW5zZXMtbWl0LnN2ZyI+ICA8ZGVmcyAgICAgaWQ9ImRlZnM0Ij4gICAgPGlua3NjYXBlOnBlcnNwZWN0aXZlICAgICAgIHNvZGlwb2RpOnR5cGU9Imlua3NjYXBlOnBlcnNwM2QiICAgICAgIGlua3NjYXBlOnZwX3g9IjAgOiA1MjYuMTgxMDkgOiAxIiAgICAgICBpbmtzY2FwZTp2cF95PSIwIDogMTAwMCA6IDAiICAgICAgIGlua3NjYXBlOnZwX3o9Ijc0NC4wOTQ0OCA6IDUyNi4xODEwOSA6IDEiICAgICAgIGlua3NjYXBlOnBlcnNwM2Qtb3JpZ2luPSIzNzIuMDQ3MjQgOiAzNTAuNzg3MzkgOiAxIiAgICAgICBpZD0icGVyc3BlY3RpdmUxMCIgLz4gICAgPGlua3NjYXBlOnBlcnNwZWN0aXZlICAgICAgIGlkPSJwZXJzcGVjdGl2ZTI4ODQiICAgICAgIGlua3NjYXBlOnBlcnNwM2Qtb3JpZ2luPSIwLjUgOiAwLjMzMzMzMzMzIDogMSIgICAgICAgaW5rc2NhcGU6dnBfej0iMSA6IDAuNSA6IDEiICAgICAgIGlua3NjYXBlOnZwX3k9IjAgOiAxMDAwIDogMCIgICAgICAgaW5rc2NhcGU6dnBfeD0iMCA6IDAuNSA6IDEiICAgICAgIHNvZGlwb2RpOnR5cGU9Imlua3NjYXBlOnBlcnNwM2QiIC8+ICA8L2RlZnM+ICA8c29kaXBvZGk6bmFtZWR2aWV3ICAgICBpZD0iYmFzZSIgICAgIHBhZ2Vjb2xvcj0iI2ZmZmZmZiIgICAgIGJvcmRlcmNvbG9yPSIjNjY2NjY2IiAgICAgYm9yZGVyb3BhY2l0eT0iMS4wIiAgICAgaW5rc2NhcGU6cGFnZW9wYWNpdHk9IjAuMCIgICAgIGlua3NjYXBlOnBhZ2VzaGFkb3c9IjIiICAgICBpbmtzY2FwZTp6b29tPSIwLjk4OTk0OTQ5IiAgICAgaW5rc2NhcGU6Y3g9IjEzMy40NzU2MSIgICAgIGlua3NjYXBlOmN5PSIxMTUuMDYyMTciICAgICBpbmtzY2FwZTpkb2N1bWVudC11bml0cz0icHgiICAgICBpbmtzY2FwZTpjdXJyZW50LWxheWVyPSJsYXllcjEiICAgICBzaG93Z3JpZD0iZmFsc2UiICAgICBpbmtzY2FwZTp3aW5kb3ctd2lkdGg9Ijg3NiIgICAgIGlua3NjYXBlOndpbmRvdy1oZWlnaHQ9IjY4NCIgICAgIGlua3NjYXBlOndpbmRvdy14PSI3IiAgICAgaW5rc2NhcGU6d2luZG93LXk9IjI5OSIgICAgIGlua3NjYXBlOndpbmRvdy1tYXhpbWl6ZWQ9IjAiIC8+ICA8bWV0YWRhdGEgICAgIGlkPSJtZXRhZGF0YTciPiAgICA8cmRmOlJERj4gICAgICA8Y2M6V29yayAgICAgICAgIHJkZjphYm91dD0iIj4gICAgICAgIDxkYzpmb3JtYXQ+aW1hZ2Uvc3ZnK3htbDwvZGM6Zm9ybWF0PiAgICAgICAgPGRjOnR5cGUgICAgICAgICAgIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiIC8+ICAgICAgICA8ZGM6dGl0bGU+PC9kYzp0aXRsZT4gICAgICA8L2NjOldvcms+ICAgIDwvcmRmOlJERj4gIDwvbWV0YWRhdGE+ICA8ZyAgICAgaW5rc2NhcGU6bGFiZWw9IkxheWVyIDEiICAgICBpbmtzY2FwZTpncm91cG1vZGU9ImxheWVyIiAgICAgaWQ9ImxheWVyMSIgICAgIHRyYW5zZm9ybT0idHJhbnNsYXRlKDAsLTc5Ni4zNjIxOCkiPiAgICA8cGF0aCAgICAgICBzb2RpcG9kaTp0eXBlPSJhcmMiICAgICAgIHN0eWxlPSJmaWxsOiNmZmZmZmY7ZmlsbC1vcGFjaXR5OjE7ZmlsbC1ydWxlOm5vbnplcm87c3Ryb2tlOiMwMDAwMDA7c3Ryb2tlLXdpZHRoOjE1LjM0OTE3MTY0O3N0cm9rZS1saW5lY2FwOnJvdW5kO3N0cm9rZS1taXRlcmxpbWl0OjQ7c3Ryb2tlLW9wYWNpdHk6MTtzdHJva2UtZGFzaGFycmF5Om5vbmUiICAgICAgIGlkPSJwYXRoMzY4NSIgICAgICAgc29kaXBvZGk6Y3g9IjEzMi4zMjk5OSIgICAgICAgc29kaXBvZGk6Y3k9IjEzNC43ODE2OSIgICAgICAgc29kaXBvZGk6cng9IjExMy4xMzcwOCIgICAgICAgc29kaXBvZGk6cnk9IjEwOS4wOTY0NyIgICAgICAgZD0ibSAyNDUuNDY3MDYsMTM0Ljc4MTY5IGEgMTEzLjEzNzA4LDEwOS4wOTY0NyAwIDEgMSAwLC0wLjAwMiIgICAgICAgdHJhbnNmb3JtPSJtYXRyaXgoMS4wNTcyMjg1LDAsMCwxLjA5MzAyMjcsLTEyLjA0MTI5MSw3NzcuNTQ3ODIpIiAgICAgICBzb2RpcG9kaTpzdGFydD0iMCIgICAgICAgc29kaXBvZGk6ZW5kPSI2LjI4MzE2NzkiICAgICAgIHNvZGlwb2RpOm9wZW49InRydWUiIC8+ICAgIDx0ZXh0ICAgICAgIHhtbDpzcGFjZT0icHJlc2VydmUiICAgICAgIHN0eWxlPSJmb250LXNpemU6Ni44OTQ2NjU3MnB4O2ZvbnQtc3R5bGU6bm9ybWFsO2ZvbnQtdmFyaWFudDpub3JtYWw7Zm9udC13ZWlnaHQ6bm9ybWFsO2ZvbnQtc3RyZXRjaDpub3JtYWw7bGluZS1oZWlnaHQ6MTI1JTtmaWxsOiMwMDAwMDA7ZmlsbC1vcGFjaXR5OjE7c3Ryb2tlOm5vbmU7Zm9udC1mYW1pbHk6QXJpYWw7LWlua3NjYXBlLWZvbnQtc3BlY2lmaWNhdGlvbjpBcmlhbCIgICAgICAgeD0iMzQuNDA5NzU2IiAgICAgICB5PSI4NjkuMDYxMDQiICAgICAgIGlkPSJ0ZXh0MzcxMCIgICAgICAgc29kaXBvZGk6bGluZXNwYWNpbmc9IjEyNSUiICAgICAgIHRyYW5zZm9ybT0ic2NhbGUoMC44OTA4MDUxLDEuMTIyNTgpIj48dHNwYW4gICAgICAgICBzb2RpcG9kaTpyb2xlPSJsaW5lIiAgICAgICAgIGlkPSJ0c3BhbjM3MTIiICAgICAgICAgeD0iMzQuNDA5NzU2IiAgICAgICAgIHk9Ijg2OS4wNjEwNCIgICAgICAgICBzdHlsZT0iZm9udC1zaXplOjEyNC4xMDM5NzMzOXB4O2ZvbnQtc3R5bGU6bm9ybWFsO2ZvbnQtdmFyaWFudDpub3JtYWw7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LXN0cmV0Y2g6bm9ybWFsO3RleHQtYWxpZ246c3RhcnQ7bGluZS1oZWlnaHQ6MTI1JTt3cml0aW5nLW1vZGU6bHItdGI7dGV4dC1hbmNob3I6c3RhcnQ7Zm9udC1mYW1pbHk6QXJpYWw7LWlua3NjYXBlLWZvbnQtc3BlY2lmaWNhdGlvbjpBcmlhbCBCb2xkIj5NSVQ8L3RzcGFuPjwvdGV4dD4gIDwvZz48L3N2Zz4="
    
    GOTO SVG
)
IF %MODLICENSE:~1,3% == Exp (
    Echo Exp: %MODLICENSE%
    set COLOR=red
    set LABELCOLOR=black
    GOTO SVG
)
IF %MODLICENSE:~1,3% == GPL (
    echo GPL: %MODLICENSE%
    set COLOR=A42E2B
    set LABELCOLOR=white
    set LOGOCOLOR=A42E2B
    SET LOGO=gnu
    goto NAMED
)
IF %MODLICENSE:~1,3% == LGP (
    echo LGP: %MODLICENSE%
    set COLOR=A42E2B
    set LABELCOLOR=white
    set LOGOCOLOR=A42E2B
    SET LOGO=gnu
    goto NAMED
)
IF %MODLICENSE:~1,2% == CC (
    echo CC: %MODLICENSE%
    set COLOR=EF9421
    set LABELCOLOR=black
    set LOGOCOLOR=EF9421
    SET LOGO=creativecommons
    goto NAMED
)
IF %MODLICENSE:~1,3% == Sim (
    echo SimpleBSD: %MODLICENSE%
    set COLOR=ab2b28
    set LABELCOLOR=white
    set LOGOCOLOR=AB2B28
    set LOGO=FreeBSD
    goto NAMED
)
IF %MODLICENSE:~1,3% == BSD (
    echo SimpleBSD: %MODLICENSE%
    set COLOR=ab2b28
    set LABELCOLOR=white
    set LOGOCOLOR=AB2B28
    set LOGO=FreeBSD
    goto NAMED
)

rem  "schemaVersion": 1,
rem  "label": "ScrapYard",
rem  "labelColor": "darkgreen",
rem  "message": "2.2.0.0",
rem  "color": "#BADA55",
rem  "style": "plastic",
rem  "namedLogo": "gnu",
rem  "logoSvg": "base64,
rem  "logoColor": "yellow" only for named - use override for nonenamed


:LOGO
rem https://img.shields.io/badge/License-GPLv3-A42E2B?style=plastic&labelColor=white&logo=gnu&logoColor=A42E2B
echo  - labelColor: %LabelColor%
echo  - color: %COLOR%

set FILE="%JSONDIR%\license.json"
IF EXIST %FILE% del /F %FILE%

echo {>>%FILE%
echo %TAB%"schemaVersion": 1,>>%FILE%
echo %TAB%"label": "License",>>%FILE%
echo %TAB%"labelColor": "%LABELCOLOR%",>>%FILE%
echo %TAB%"message": %MODLICENSE%,>>%FILE%
echo %TAB%"color": "%COLOR%",>>%FILE%
echo %TAB%"logoColor": "%LOGOCOLOR%",>>%FILE%
echo %TAB%"namedLogo": "%LOGO%",>>%FILE%
echo %TAB%"style": "plastic">> %FILE%
echo }>>%FILE%
GOTO CODEJSON

:SVG

rem https://img.shields.io/badge/License-GPLv3-A42E2B?style=plastic&labelColor=white&logo=gnu&logoColor=A42E2B
echo  - labelColor: %LabelColor%
echo  - color: %COLOR%

set FILE="%JSONDIR%\license.json"
IF EXIST %FILE% del /F %FILE%

echo {>>%FILE%
echo %TAB%"schemaVersion": 1,>>%FILE%
echo %TAB%"label": "License",>>%FILE%
echo %TAB%"labelColor": "%LABELCOLOR%",>>%FILE%
echo %TAB%"message": %MODLICENSE%,>>%FILE%
echo %TAB%"color": "%COLOR%",>>%FILE%
echo %TAB%"style": "plastic">> %FILE%
echo }>>%FILE%




:CODEJSON

set COLOR=darkblue
set LABELCOLOR=66ccff
   
rem ********************** code.json
rem ********************************
rem IF %CODE% NEQ "" ( echo.No Code
rem     GOTO NOCODE
rem )

set FILE="%JSONDIR%\code.json"

rem for /f %%i in (%FILE%) do 

rem IF EXIST %FILE% del /F %FILE%
rem echo %FILE%
IF EXIST %FILE% (
    rem check for empty file and delete it
    rem for %%a in ('%FILE%') do ( set length=%%za )
    rem echo %length%
    rem setlocal
    FOR /F "usebackq" %%A IN ('%FILE%') DO set size=%%~zA 
    rem ENDLOCAL
    if size LSS 0 ( 
        echo empty code file, deleting
        del /F %FILE%
        GOTO NOCODE
       ) else (
         del /F %FILE%
         echo {>>%FILE%
         echo %TAB%"schemaVersion": 1,>>%FILE%
         echo %TAB%"label": "Code",>>%FILE%
         echo %TAB%"labelColor": "%LABELCOLOR%",>>%FILE%
         echo %TAB%"message": "%CODE%",>>%FILE%
         echo %TAB%"color": "%COLOR%",>>%FILE%
         echo %TAB%"style": "plastic">>%FILE%
         echo }>>%FILE%
          
         rem ******************* Update code file
         rem ***************************************
         rem echo Updating json\code.json
         rem %JQ% --arg VAR %KSPVERSION% ".KSPVERSION = $VAR" %RELEASEFILE% >json\tmp.json
         rem   %JQ% --arg VAR %CODE% "message = $VAR" %FILE% >json\tmp.json
         rem   move json\tmp.json %FILE%
             
          rem GOTO EOF
    )
) else (
    :NOCODE
    echo creating blank %FILE%
    echo {>>%FILE%
    echo %TAB%"schemaVersion": 1,>>%FILE%
    echo %TAB%"label": "Code",>>%FILE%
    echo %TAB%"labelColor": "%LABELCOLOR%",>>%FILE%
    echo %TAB%"message": "|none|",>>%FILE%
    echo %TAB%"color": "%COLOR%",>>%FILE%
    echo %TAB%"style": "plastic">>%FILE%
    echo }>>%FILE%
)

:EOF

pause

rem IF Not EXIST %FILE% (

rem ********************************************** SNIPPETS *******
rem echo JQ --arg VAR 1.12.2 ".KSPVERSION" |= VAR json\_release.json
rem echo JQ "map(.KSPVERSION" = 1.12.2)" json\_release.json
rem echo JQ '".KSPVERSION" = "1.12.2"' json\_release.json
rem jq '.eggs + 1' inventory.json

rem echo jq ".KSPVERSION = 1.15.1" json\_release.json
rem jq 'map(.shipping.local = "new place")'

rem %KSPVERSION%
rem %JQ% --arg variable "$KSPVERSION" '.KSPVERSION = $variable' %RELEASEFILE%
rem %JQ% ".KSPVERSION = "%KVERSION%"" %RELEASEFILE% >json\tmp.json