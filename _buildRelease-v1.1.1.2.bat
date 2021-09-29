cls
@echo off

echo _buildRelease v1.1.1.2 [auto]

rem Put the following text into the Post-build event command line:
rem without the "rem":

rem start /D C:\KSP_DEV\Workspace\ODFCr\ /WAIT deploy.bat  $(TargetDir) $(TargetFileName)
rem
rem if $(ConfigurationName) == Release start /D C:\KSP_DEV\Workspace\ODFCr\ /WAIT buildRelease.bat $(TargetDir) $(TargetFileName)


rem Variables are pulled from json\_release.json

rem set directories
set GAMEDATA=GameData
set JSONDIR=json

rem set derived variables here:
set RELEASEFILE=%JSONDIR%\_release.json

rem set utilities locations
set ZIP="C:\Program Files\7-zip\7z.exe"
set PD=C:\ProgramData\chocolatey\bin\pandoc.exe
set JQ=C:\ProgramData\chocolatey\lib\jq\tools\jq.exe

rem fetch mod folder name from release.json
rem set MODFOLDER=TheGoldStandard
%JQ% ".MODFOLDER" %RELEASEFILE% >tmpfile
set /P MODFOLDER=<tmpfile

rem remove "" if present
for /f "useback tokens=*" %%a in ('%MODFOLDER%') do set MODFOLDER=%%~a

set VERSIONFILE=%MODFOLDER%.version

rem fetch mod name from release.json
rem set SUBDIR=""
%JQ% ".SUBFOLDER" %RELEASEFILE% >tmpfile
set /P SUBDIR=<tmpfile

rem remove "" if present
rem for /f "useback tokens=*" %%a in ('%SUBDIR%') do set SUBDIR=%%~a

rem fetch mod type from release.json
%JQ% ".MODTYPE" %RELEASEFILE% >tmpfile
set /P MODTYPE=<tmpfile

rem remove "" if present
for /f "useback tokens=*" %%a in ('%MODTYPE%') do set MODTYPE=%%~a

set RELEASEDIR=C:\KSPDEV\%MODTYPE%\Releases

rem fetch mod license from release.json
%JQ% ".LICENSE" %RELEASEFILE% >tmpfile
set /P MODLICENSE=<tmpfile

rem fetch RELEASETYPE from release.json
%JQ% ".RELEASETYPE" %RELEASEFILE% >tmpfile
set /P RELEASETYPE=<tmpfile

rem remove "" if present
for /f "useback tokens=*" %%a in ('%MODLICENSE%') do set MODLICENSE=%%~a

set LICENSETEXT=%MODLICENSE%.txt

rem set files
set CHANGELOG="Changelog.cfg*"
set README="Readme.htm"

rem Get Version info
copy %VERSIONFILE% tmp.version
set VERSIONFILE=tmp.version
rem The following requires the JQ program, available here: https://stedolan.github.io/jq/download/
%JQ% ".VERSION.MAJOR" %VERSIONFILE% >tmpfile
set /P major=<tmpfile

%JQ% ".VERSION.MINOR" %VERSIONFILE% >tmpfile
set /P minor=<tmpfile

%JQ% ".VERSION.PATCH" %VERSIONFILE% >tmpfile
set /P patch=<tmpfile

%JQ% ".VERSION.BUILD"  %VERSIONFILE% >tmpfile
set /P build=<tmpfile
del tmpfile
del tmp.version
set VERSION=%major%.%minor%.%patch%.%build%

echo Version:  %VERSION%
IF %SUBDIR% NEQ "" (
    set RNFILE=%GAMEDATA%\%SUBDIR%\%MODFOLDER%\%VERSION%.htm
) else (
    set RNFILE=%GAMEDATA%\%MODFOLDER%\%VERSION%.htm
)

rem create HTML5 version of VERSIONNOTES.md
pandoc -f gfm -t html5 _ReleaseNotes\%VERSION%.md -o _ReleaseNotes\%VERSION%.htm
rem %RNFILE%
rem _ReleaseNotes\%VERSION%.htm

rem create HTML5 version of Readme.md
pandoc -f gfm -t html5 Readme.md -o Readme.htm
rem echo %README%

rem Copy files to GameData locations
if %SUBDIR% NEQ "" (
    copy /Y "_ReleaseNotes\%VERSION%.htm"  %GAMEDATA%\%SUBDIR%\%MODFOLDER%
    copy /Y %MODFOLDER%.version %GAMEDATA%\%SUBDIR%\%MODFOLDER%
    copy /Y %CHANGELOG% %GAMEDATA%\%SUBDIR%\%MODFOLDER%
    
    if "%LICENSETEXT%" NEQ "" copy /y  %LICENSETEXT% %GAMEDATA%\%SUBDIR%\%MODFOLDER%
    if "%README%" NEQ "" copy /Y %README% %GAMEDATA%\%SUBDIR%\%MODFOLDER%    
) else (
    copy /Y "_ReleaseNotes\%VERSION%.htm"  %GAMEDATA%\%MODFOLDER%
    copy /Y %MODFOLDER%.version %GAMEDATA%\%MODFOLDER%
    copy /Y %CHANGELOG% %GAMEDATA%\%MODFOLDER%
    
    if "%LICENSETEXT%" NEQ "" copy /y  %LICENSETEXT% %GAMEDATA%\%MODFOLDER%
    if "%README%" NEQ "" copy /Y %README% %GAMEDATA%\%MODFOLDER%
)

rem Build the zip FILE
cd %GAMEDATA%\..

set FILE="%RELEASEDIR%\%MODFOLDER%-%VERSION%-%RELEASETYPE%.zip"
IF EXIST %FILE% del /F %FILE%
%ZIP% a -tzip %FILE% GameData

IF EXIST %RNFILE% del /F %RNFILE%
pause