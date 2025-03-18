@echo off
:: Automated Setup Script for C++ Development on Windows

:: Step 1: Install Chocolatey (Package Manager for Windows)
where choco >nul 2>nul
if %errorlevel% neq 0 (
    echo Installing Chocolatey...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr https://community.chocolatey.org/install.ps1 -UseBasicParsing | iex"
    echo Restart your terminal after installation.
    exit /b
)

:: Step 2: Install CMake, Git, and MinGW (if not installed)
echo Installing CMake, Git, and MinGW...
choco install cmake git mingw -y

:: Step 3: Install Boost Library
echo Installing Boost...
choco install boost-msvc-14.3 -y

:: Step 4: Install OpenSSL
echo Installing OpenSSL...
choco install openssl -y

:: Step 5: Add MinGW and OpenSSL to Path
echo Adding MinGW and OpenSSL to system PATH...
setx PATH "%PATH%;C:\Program Files\mingw-w64\mingw32\bin;C:\Program Files\OpenSSL-Win64\bin"

:: Step 6: Verify Installations
echo Verifying installations...
cmake --version
g++ --version
openssl version
git --version

:: Done
echo Setup complete! Restart your terminal and proceed with project setup.
pause
