@echo off
setlocal enabledelayedexpansion
chcp 437 >nul
title FFlow Installer for DaVinci Resolve

echo.
echo ============================================
echo   FFlow Installer for DaVinci Resolve
echo ============================================
echo.
:: ── 1. Verify Resolve scripts folder ───────────────────────────────

echo [1/3] Verifying Resolve scripts folder...
echo.
set "RESOLVE_BASE=Blackmagic Design\DaVinci Resolve\Support\Fusion\Scripts\Utility"
set "RESOLVE_PATH=%APPDATA%\!RESOLVE_BASE!"

if not exist "%RESOLVE_PATH%" goto :resolve_fallback
echo [OK] Scripts folder:
echo      %RESOLVE_PATH%
echo.
goto :buscar_fflow

:resolve_fallback
echo [ERROR] Scripts folder not found in the default location:
echo         %RESOLVE_PATH%
echo.
echo   Options:
echo.
echo   1. Search on another drive (e.g. if Resolve is on D:, E:, etc.)
echo   2. Try known alternative paths
echo   3. Enter path manually
echo   4. Cancel
echo.
set /p "RESOLVE_OPT=Option: "

if "!RESOLVE_OPT!"=="1" goto :buscar_disco
if "!RESOLVE_OPT!"=="2" goto :rutas_alt
if "!RESOLVE_OPT!"=="3" goto :resolve_manual
goto :error

:: -- Search on other drives ---------------------------------------------------
:buscar_disco
echo.
echo   Searching for available drives on the system...
echo.

set "DISCO_ENCONTRADO="

:: Detect available drive letters (A-Z) skipping C which was already checked
for %%L in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if not defined DISCO_ENCONTRADO (
        if exist "%%L:\" (
            echo   [INFO] Checking drive %%L: ...
            set "CANDIDATE=%%L:\Users\%USERNAME%\AppData\Roaming\!RESOLVE_BASE!"
            if exist "!CANDIDATE!" (
                set "RESOLVE_PATH=!CANDIDATE!"
                set "DISCO_ENCONTRADO=1"
            )
        )
    )
)

if defined DISCO_ENCONTRADO (
    echo.
    echo   [OK] Folder found on another drive:
    echo        !RESOLVE_PATH!
    echo.
    goto :buscar_fflow
)

:: Not found on any drive — offer manual
echo.
echo   [WARNING] Resolve folder not found on any drive.
echo.
echo   Possible causes:
echo   - DaVinci Resolve was never opened (the folder is created on first startup)
echo   - The installation uses a different user profile
echo.
echo   Enter the path manually or cancel:
echo   1. Enter path manually
echo   2. Cancel
echo.
set /p "DISCO_OPT=Option: "
if "!DISCO_OPT!"=="1" goto :resolve_manual
goto :error

:: -- Known alternative paths --------------------------------------------
:rutas_alt
set "ALT1=%APPDATA%\Blackmagic Design\DaVinci Resolve\Support\Fusion\Scripts"
set "ALT2=%APPDATA%\Blackmagic Design\DaVinci Resolve\Support\Developer\Scripting\Scripts"

echo.
if exist "%ALT1%" (
    set "RESOLVE_PATH=%ALT1%"
    echo   [OK] Using alternative path:
    echo        !RESOLVE_PATH!
    echo.
    goto :buscar_fflow
)
if exist "%ALT2%" (
    set "RESOLVE_PATH=%ALT2%"
    echo   [OK] Using alternative path:
    echo        !RESOLVE_PATH!
    echo.
    goto :buscar_fflow
)

echo   [ERROR] No alternative path found either.
echo.
echo   1. Enter path manually
echo   2. Cancel
echo.
set /p "ALT_OPT2=Option: "
if "!ALT_OPT2!"=="1" goto :resolve_manual
goto :error

:: -- Manual Resolve path --------------------------------------------------
:resolve_manual
echo.
echo   Drag the Resolve scripts folder to this window
echo   or type the full path:
echo   (it must be the folder where Resolve reads its .lua scripts)
echo.
set /p "RESOLVE_PATH=Path: "
set "RESOLVE_PATH=!RESOLVE_PATH:"=!"

if not exist "!RESOLVE_PATH!" (
    echo.
    echo   [ERROR] The entered path does not exist.
    goto :error
)
echo.
echo   [OK] Using manual path:
echo        !RESOLVE_PATH!
echo.

:: ── 2. Search for fflow_settings.json and verify FFlow.exe ──────────────────────

:buscar_fflow
echo [2/3] Searching for a valid FFlow installation...
echo.

set "FFLOW_PATH="
set "FFLOW_DIR="

:: Search first in Downloads without wait message
for /r "%USERPROFILE%\Downloads" %%S in (fflow_settings.json) do (
    if not defined FFLOW_PATH (
        if exist "%%~dpSFFlow.exe" (
            set "FFLOW_PATH=%%~dpSFFlow.exe"
            set "FFLOW_DIR=%%~dpS"
        )
    )
)
if defined FFLOW_PATH goto :fflow_found

:: Not found in Downloads — warn before broad search
echo [INFO] FFlow not found in Downloads.
echo.
echo   Will search in Desktop and AppData. This may take a few seconds...
echo.

for /r "%USERPROFILE%\Desktop" %%S in (fflow_settings.json) do (
    if not defined FFLOW_PATH (
        if exist "%%~dpSFFlow.exe" (
            set "FFLOW_PATH=%%~dpSFFlow.exe"
            set "FFLOW_DIR=%%~dpS"
        )
    )
)
if defined FFLOW_PATH goto :fflow_found

for /r "%LOCALAPPDATA%" %%S in (fflow_settings.json) do (
    if not defined FFLOW_PATH (
        if exist "%%~dpSFFlow.exe" (
            set "FFLOW_PATH=%%~dpSFFlow.exe"
            set "FFLOW_DIR=%%~dpS"
        )
    )
)
if defined FFLOW_PATH goto :fflow_found

:: Detect unextracted ZIP
set "ZIP_FOUND="
for /r "%USERPROFILE%\Downloads" %%Z in (FFlow*.zip FFLOW*.zip) do (
    if not defined ZIP_FOUND set "ZIP_FOUND=%%Z"
)

echo [WARNING] A valid FFlow installation was not found in any
echo           of the searched folders (Downloads, Desktop, AppData\Local).
echo.
if defined ZIP_FOUND (
    echo   This unextracted ZIP was detected:
    echo   !ZIP_FOUND!
    echo   Extract the ZIP and run this installer again.
    echo.
)
echo   Drag FFlow.exe to this window and press Enter,
echo   or type the full path:
echo.
set /p "FFLOW_PATH=Path: "
set "FFLOW_PATH=!FFLOW_PATH:"=!"

if not exist "!FFLOW_PATH!" (
    echo.
    echo [ERROR] The entered path does not exist.
    goto :error
)

for %%F in ("!FFLOW_PATH!") do set "FFLOW_DIR=%%~dpF"

if not exist "!FFLOW_DIR!fflow_settings.json" (
    echo.
    echo [WARNING] fflow_settings.json not found in that folder.
    echo           FFlow may not work correctly.
    echo.
    echo   1. Continue anyway ^(at your own risk^)
    echo   2. Cancel
    echo.
    set /p "RISK_OPT=Option: "
    if not "!RISK_OPT!"=="1" goto :error
    echo [WARNING] Continuing without validation.
    echo.
)

:fflow_found
set "FFLOW_SHORT=!FFLOW_PATH:%USERPROFILE%\=User\!"
echo [OK] FFlow found in: !FFLOW_SHORT!
echo.

:: ── 3. Generate and install the Lua ─────────────────────────────────────────────

echo [3/3] Installing Launch FFlow.lua...
echo.

set "LUA_FILE=%RESOLVE_PATH%\Launch FFlow.lua"

(
    echo -- Launch FFlow from DaVinci Resolve
    echo -- Generated by InstalarFFlow.bat
    echo -- Use from: Workspace ^> Scripts ^> Launch FFlow
    echo.
    echo local fflowPath = [[!FFLOW_PATH!]]
    echo.
    echo os.execute^('start "" "' .. fflowPath .. '"'^)
    echo.
    echo print^("FFlow launched successfully!"^)
) > "%LUA_FILE%"

if not exist "%LUA_FILE%" (
    echo [ERROR] Could not create the Lua file.
    echo         Destination: %LUA_FILE%
    goto :error
)

echo [OK] Lua installed successfully.
:: ── Summary ──────────────────────────────────────────────────────────────────

echo.
echo ============================================
echo   Installation completed successfully!
echo ============================================
echo.
echo   FFlow detected in : !FFLOW_SHORT!
echo   Lua installed in  : ...Fusion\Scripts\Utility\Launch FFlow.lua
echo.
echo   How to use it:
echo   Workspace ^> Scripts ^> Launch FFlow
echo.
echo   Make sure you are in Fusion before running it.
echo.
pause
exit /b 0

:error
echo.
echo ============================================
echo   The installation failed.
echo ============================================
echo.
pause
exit /b 1