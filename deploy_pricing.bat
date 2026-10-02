@echo off
setlocal
rem Deploy Robust_Pricing notebooks to GitHub (https://github.com/CharleyFreshman/Robust-Pricing)

set "REPO_DIR=%~dp0"
set "REMOTE_URL=https://github.com/CharleyFreshman/Robust-Pricing.git"
set "GIT=git"
where git >nul 2>&1 || set "GIT=D:\Git\cmd\git.exe"

if not exist "%REPO_DIR%" (
    echo [ERROR] Robust_pricing dir not found: %REPO_DIR%
    pause & exit /b 1
)

cd /d "%REPO_DIR%"

"%GIT%" rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 "%GIT%" init -b main

"%GIT%" remote get-url origin >nul 2>&1
if errorlevel 1 ( "%GIT%" remote add origin "%REMOTE_URL%"
) else ( "%GIT%" remote set-url origin "%REMOTE_URL%" )

"%GIT%" add -A
"%GIT%" commit -m "Deploy robust pricing notebooks"

echo.
echo Pushing to %REMOTE_URL% ...
"%GIT%" push -u origin main
if errorlevel 1 (
    echo.
    echo [HINT] Push failed. Check the credential popup, or if the remote repo
    echo        is not empty run: git pull origin main --allow-unrelated-histories
)
pause
