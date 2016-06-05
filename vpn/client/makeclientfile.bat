@echo off
setlocal
if not _%1_==__ goto skipPrompt

echo Enter name of the new client file (without .ovpn)
echo leave blank for just opening the XXX.ovpn file
set name=
set /p name=
goto afterPrompt

:skipPrompt
set name=%1

:afterPrompt

if "X%name%X"=="XX" (
call gvim -S clientgen.vim XXX.ovpn
) else (
call vim -S clientgen.vim -c "Cc %name%" -c q XXX.ovpn
)
