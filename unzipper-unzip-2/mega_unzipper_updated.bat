@echo off
echo Close this window or press Ctrl+C to exit

:SCAN
if not exist "%cd%\original_zips" mkdir %cd%\original_zips
if not exist "%cd%\put_your_zips_in_here" mkdir %cd%\put_your_zips_in_here

set original_zips_fp=%cd%\original_zips

for /R put_your_zips_in_here %%f in (*.zip *.rar *.7z) do (
    echo %%f | find /v "%cd%\original_zips" 1>nul 2>nul && (
        echo %%f is extracting...
        if not exist "%%~dpf%%~nf" mkdir "%%~dpf%%~nf"
        tar -xf "%%f" -C "%%~dpf%%~nf" 
        move "%%f" "%original_zips_fp%"
        echo Extraction complete! Delete the zips located in original_zips!
    ) 
)

GOTO SCAN


