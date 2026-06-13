@echo off
REM set_eb_palettes_env_permanent.bat
REM 
REM DESCRIPTION
REM Permanently sets the EB_PALETTES_ROOT_DIR user or system environment 
REM variable to point to the /palettes subdirectory of the _ebPalettes 
REM repository. This variable is used my a variety of scripts to find 
REM .hexplt palettes from this repository.
REM 
REM This script modifies the Windows registry (HKCU\Environment) and requires
REM no administrator privileges. Changes take effect after restarting the
REM terminal (Command Prompt, PowerShell, or any new process). If run as 
REM Administrator or with Administrator rights, the changes are permanent.
REM 
REM USAGE
REM Run this script from the root of the _ebPalettes repository (where it is 
REM stored).
REM Run it once from an unelevated Command Prompt (right-click Command
REM prompt, restart the terminal and run:

REM    echo %EB_PALETTES_ROOT_DIR%

REM if it prints the path of the \palettes directory, it is working as
REM expected. Alternately, run it as an Administror to set
REM EB_PALETTES_ROOT_DIR as a system variable.

REM NOTES
REM - Run as a regular (non-admin) user, this script sets a USER environment variable, not a SYSTEM variable.
REM - If EB_PALETTES_ROOT_DIR already exists, it will be overwritten without warning.
REM - To remove the variable later, use: reg delete HKCU\Environment /v EB_PALETTES_ROOT_DIR

REM DEPENDENCIES
REM - Must be run from the _ebPalettes repository root (where the /palettes
REM   subdirectory exists).
REM - setx.exe (built into Windows Vista and later)


REM CODE
REM set_eb_palettes_env_permanent.bat
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
setx EB_PALETTES_ROOT_DIR "%SCRIPT_DIR%\palettes"
echo Environment variable set permanently. Restart your terminal to take effect.