@echo off 
set work_path=./
D: 
cd %work_path% 
echo "start"
 
echo %cd% 


setlocal enabledelayedexpansion
 set /a aa=0 
for /D %%s in (*) do (  
rem cd  %%s
set /a aa+=1
set /a yu = aa%%3
echo !yu!
echo "%%s" 
echo %cd%
start /min cmd /c mvn -f %%s/pom.xml install -DskipTests
@ping -n 3 127.0>nul
if !yu! == 0   ( 
start /wait cmd /c mvn -f %%s/pom.xml install -DskipTests
echo sleep
@ping -n 10 127.0>nul
)
rem cd ../
) 
pause 