@echo off
cd /d "%~dp0"

echo.
echo ==========================================
echo       DEPLOY BUNDASLOT.GITHUB.IO
echo ==========================================
echo.

echo Mengecek perubahan...
git add -A

git diff --cached --quiet
if %errorlevel%==0 (
    echo Tidak ada perubahan baru untuk di-commit.
    goto push
)

echo.
echo Membuat commit...
git commit -m "Update GitHub Pages"

if errorlevel 1 goto error

:push
echo.
echo Push ke GitHub...
git push origin main

if errorlevel 1 goto error

echo.
echo ==========================================
echo             DEPLOY SELESAI
echo ==========================================
echo.
echo Halaman:
echo https://bundaslot.github.io/the-square-ball-ososlot/
echo.
pause
exit /b 0

:error
echo.
echo ==========================================
echo             DEPLOY GAGAL
echo ==========================================
echo Cek pesan error Git di atas.
echo.
pause
exit /b 1