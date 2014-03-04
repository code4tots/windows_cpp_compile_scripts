@echo off

REM Assume that the name of your current directory
REM is the name of the problem you are solving.
REM Your source code should be named the same way.
REM 
REM For instance, if your problem is ride,
REM your directory should be named "ride", your program
REM should be named "ride.c", your program will read
REM from "ride.in", and write to "ride.out"

REM Get the Visual Studio C compiler ready (I'm using VS2013)
REM but I guess it's under directory named "Microsoft Visual Studio 12.0"...
REM Depending on your environment, you may need to change this.
if [%USACOC_INITIALIZED%]==[] goto initialize

echo USACOC already ran before -- vcvars32.bat is NOT going to be called
goto after_initialize

:initialize
echo USACOC not yet initialize -- initializing now...
set USACOC_INITIALIZED=yes
call "C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin\vcvars32.bat"

:after_initialize


REM Get the folder name...
REM Weird... I found this on a stackoverflow post I think...
REM Not exactly sure how it works... 
REM but I guess I can worry about it later
for %%A in (".") do set "myFolder=%%~nxA"

if exist %myFolder%.in goto after_stdin

echo No %myFolder%.in file exists -- expecting content through stdin...

REM Read input from stdin.
REM Note that your input should be terminated by ^Z (i.e. Ctrl-Z) not by
REM ^C (i.e. Ctrl-C). If you ^C (i.e. "break"), then it will bring up an
REM annoying prompt asking if you want to exit.
more > %myFolder%.in

goto after_comment
:after_stdin
echo Using pre-existing %myFolder%.in file
:after_comment

REM Compile, execute, and print output
CL %myFolder%.cpp /nologo /EHsc && %myFolder%.exe >nul && type %myFolder%.out

REM Clean up
del /q %myFolder%.exe %myFolder%.obj %myFolder%.out

