@echo off & setlocal

call :GenMkdirFTPCommand C:\Users\dev\Desktop\OffensiveBatchScripts

:GenMkdirFTPCommand
echo [debug] in GenMkdirFTPCommand
set targetpath=%1
set targetpath=%targetpath:\= %
:loop
echo [debug] in :loop %targetpath%
for %%A in ("%targetpath%") do (
    echo [debug] in for: %currentpath% == %%A
    set currentpath=%currentpath%%%A/
    echo 1
    if "%currentpath%" NEQ "" echo mkdir "%currentpath%"
    echo 2
    set targetpath=%%B
)
if defined targetpath AND "%targetpath%" NEQ "" goto :loop
goto :eof
