@echo off
setlocal enabledelayedexpansion

rem Set the path to your directory
set "directoryPath=C:\Users"

rem Loop through all folders in the directory
for /D %%i in ("%directoryPath%\*") do (
    rem Get the folder name
    set "folderName=%%~nxi"

    rem Check if the folder name starts with a number
    set "firstChar=!folderName:~0,1!"
    if "!firstChar!" geq "0" if "!firstChar!" leq "9" (
        rem Remove the folder and its contents
        rmdir /s /q "%%i"
        echo Deleted: %%i
    )
)

echo Done.
pause
