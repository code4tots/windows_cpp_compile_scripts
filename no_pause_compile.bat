call args.bat 1>nul 2>nul
call %vcvars_bat% 1>nul 2>nul
cl %source_name%
set errorlevel=%1
