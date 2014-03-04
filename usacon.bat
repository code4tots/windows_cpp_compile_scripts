@echo off

if [%1] EQU [] goto :no_args

if exist %1 goto :directory_already_exist

mkdir %1
mkdir %1\%1

echo /*>%1.cpp
echo ID: use.cpp1>>%1.cpp
echo LANG C++11>>%1.cpp
echo PROB: %1>>%1.cpp
echo */>>%1.cpp
type "C:\Users\math4tots\Documents\programs\usacoutils\template.cpp" >> %1.cpp

goto success
:no_args
echo FAILURE: You must give argument specifying problem name
goto end

:directory_already_exist
echo FAILURE: Given directory already exists...
goto end

:success
echo USACO directory "%1" Successfully created
:end