@echo off
echo Close this window or press Ctrl+C to exit

:SCAN
if not exist "zipped_files" mkdir zipped_files
set curdir=%cd%\zipped_files

for /R %%f in (*.zip *.rar *.7z) do (
    echo %%f | find /v "zipped_files" 1>nul 2>nul && (
        echo %%f is extracting...
        if not exist "%%~dpf%%~nf" mkdir "%%~dpf%%~nf"
        tar -xf "%%f" -C "%%~dpf%%~nf" 
        move "%%f" "%curdir%"
        echo Extraction complete!
    ) 
)

GOTO SCAN


