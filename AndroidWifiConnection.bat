@echo on

adb kill-server

adb devices

adb tcpip 5555
::adb shell ip addr show wlan0

pause
@echo offf
adb shell ip route >temp 2>&1

set /p str= <temp

del temp

echo %str%

set n=0
:her
call set u=%%str:~%n%,1%%
if not "%u%"=="" (set /a n+=1
goto her
) else (echo length:%n%) 

echo %n%

set /a len=%n%-13

call set u=%%str:~%len%,12%%
echo %u%:5555
@echo on
adb connect %u%:5555

pause
