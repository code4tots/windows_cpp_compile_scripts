@echo off

if [%USACOC_INITIALIZED%]==[] goto initialize

echo vcvars32.bat already called -- not going to be called again
goto after_initialize

:initialize
set USACOC_INITIALIZED=yes
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin\vcvars32.bat"

:after_initialize

if [%1]==[] goto very_end

cl %1 /nologo /EHsc

:very_end