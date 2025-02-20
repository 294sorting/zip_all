@echo off
setlocal enabledelayedexpansion

:: 設定要壓縮的目標資料夾
set "source_folder=C:\Users\***\Desktop\***"

:: 切換到目標資料夾
cd /d "%source_folder%"

:: 建立壓縮的輸出資料夾（如果不存在）
set "zip_folder=%source_folder%\Zipped"
if not exist "%zip_folder%" mkdir "%zip_folder%"

:: 遍歷目標資料夾內的所有檔案，並排除 zip_all.bat 和 .zip 檔案
for %%F in (*.*) do (
    set "filename=%%~nF"
    set "ext=%%~xF"

    :: 排除 zip_all.bat 和已存在的 .zip 檔案
    if /I not "%%F"=="zip_all.bat" if /I not "!ext!"==".zip" (
        set "zip_file=%zip_folder%\!filename!.zip"
        echo 正在壓縮：%%F -> !zip_file!
        
        :: 使用 PowerShell 進行壓縮
        powershell -Command "Compress-Archive -Path '%source_folder%\%%F' -DestinationPath '!zip_file!' -Force"
    )
)

echo 壓縮完成！
pause
