@echo off
REM Set context menu when a file is right clicked in file explorer. Doing this
REM will require setting the registry keys below in order to show this option

REM Make sure user has set their user directory before running script
set user_home=PLACEHOLDER
if "%user_home%"=="PLACEHOLDER" (
	echo "Must set user_home variable in script for the path to be correct"
	pause
	EXIT /B
)
REM Add NVIM to context menu on right click
REG ADD "HKCR\*\shell\NVIM" /t REG_EXPAND_SZ /d "Open in NVIM"
REG ADD "HKCR\*\shell\NVIM" /v icon /t REG_EXPAND_SZ /d C:\Users\%user_home%\AppData\Local\nvim\assets\icon.ico
REG ADD "HKCR\*\shell\NVIM\command" /t REG_EXPAND_SZ /d "\"C:\Program Files\Neovim\bin\nvim.exe\" \"%%1\""
