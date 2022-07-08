@echo off
setlocal enableDelayedExpansion

set /p number=Key:
set /p message=Code:
set characters=0123456789abcdefghijklmnopqrstuvwxyz

for /L %%N in (10 1 36) do (

for /F %%C in ("!characters:~%%N,1!") do (
set /a encryption_key=%%N*%number%

for /F %%K in ("!encryption_key!") do (
set "message=!message:%%K=%%C!"
)
)
)

for /F %%K in ("!message!") do (
set "message=!message:-=!"
)

echo !message!
pause