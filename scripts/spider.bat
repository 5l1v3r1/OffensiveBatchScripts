@echo off & setlocal

echo [+] Spidering files from (%CD%)

for /D /r %%D in ("*") do (
    pushd %%D
    echo %%D
    call :GenMkdirFTPCommand %%D
    echo "back"
    for %%F in ("*") do (
        call :GenPutFTPCommand %%D %%F
    )
    popd
)
goto End

:GenMkdirFTPCommand
set targetpath=%1
set targetpath=%targetpath:\=/%
echo jump loop
:loop
echo in loop %targetpath%
pause
for /f "tokens=1* delims=/" %%a in ("%targetpath%") do (
    echo looping
    set currentpath=%currentpath%%%a/
    echo %currentpath%
    if "%currentpath%" NEQ "" ( echo mkdir "%currentpath%" ) else ( echo nope "%currentpath%" )
    set targetpath=%%b
)
if defined targetpath goto :loop
goto :eof

:GenPutFTPCommand
set dir=%1
set file=%2
set dir=%dir:\=/%
echo put "%1\%2" "%dir%/%file%"
goto :eof

echo quit>> ftp.txt

echo [+] Press any key to start copy
pause
REM ftp.exe -s:ftp.txt -v
echo [+] All done!

:End
