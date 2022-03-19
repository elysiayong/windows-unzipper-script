@echo off
echo Close this window or press Ctrl+C to exit

:SCAN
if not exist "%cd%\original_files" mkdir %cd%\original_files
if not exist "%cd%\put_your_zips_in_here" mkdir %cd%\put_your_zips_in_here
if not exist "%cd%\extracted_files" mkdir %cd%\extracted_files

set original_files_fp=%cd%\original_files
set extracted_files_fp=%cd%\extracted_files

for /R %%f in (put_your_zips_in_here\*.zip put_your_zips_in_here\*.rar put_your_zips_in_here\*.7z) do (
    echo %%f | find /v "%cd%\original_files" 1>nul 2>nul && (
        echo %%f is extracting...
        if not exist "%%~dpf%%~nf" mkdir "%%~dpf%%~nf"
        tar -xf "%%f" -C "%%~dpf%%~nf" 
        move "%%~dpf%%~nf" "%extracted_files_fp%"
        move "%%f" "%original_files_fp%"
        echo Extraction complete!
    ) 
)

GOTO SCAN


