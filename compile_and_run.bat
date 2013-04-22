@echo off
call no_pause_compile.bat 1>nul 2>nul
if %errorlevel% equ 0 goto compile_succeeded
if %errorlevel% neq 0 goto compile_failed

:compile_succeeded
call no_pause_run
goto end

:compile_failed
echo Compile failed
goto end

:end
pause
