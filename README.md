setlocal enabledelayedexpansion
啟用延遲變數展開（Delayed Expansion），使得在迴圈中可以使用驚嘆號 !variable! 來讀取變數的最新值，而不是在解析時就固定下來。

for %%F in (*.*) do (
使用 for 迴圈遍歷當前資料夾中所有的檔案（*.* 表示所有檔案）。
%%F 為迴圈變數，每次迴圈代表一個檔案的完整檔名。

set "filename=%%~nF"
set "ext=%%~xF"
%%~nF 取出變數 %%F 的檔名部分（不含副檔名），並存入變數 filename。
%%~xF 取出 %%F 的副檔名部分（包含點號，例如 .txt），並存入變數 ext。

set "zip_file=%zip_folder%\!filename!.zip"
設定變數 zip_file 為最終要產生的壓縮檔完整路徑。這裡使用延遲展開的 !filename! 來獲取當前檔案名，並加上 .zip 副檔名，放在 zip_folder 資料夾中。

%變數名%	一般變數展開，在命令解析時 被展開（適用於 for 迴圈外部）。
!變數名!	延遲變數展開，在 for 迴圈內部才能正確取得變數值，需要 setlocal enabledelayedexpansion。
