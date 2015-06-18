@echo off
IF [%1] == [] GOTO usage

rmdir /S /Q .git
rename nodeproject.* "%1.*"

start /WAIT /B fnr --cl --dir "%CD%" --find "nodeproject" --replace "%1" --fileMask "*.*" --excludeFileMask "renameproject.bat"
start /WAIT /B fnr --cl --dir "%CD%\bin" --find "nodeproject" --replace "%1" --fileMask "*.*" --excludeFileMask "renameproject.bat"
start /WAIT /B fnr --cl --dir "%CD%\src" --find "nodeproject" --replace "%1" --fileMask "*.*" --excludeFileMask "renameproject.bat"

choice /C:AB /D:A /T 1 >NUL
del fnr.exe
start /b "" cmd /c del "%~f0"&exit /b

GOTO end
:usage
echo Usage: renameproject.bat newname
:end
