@echo off
setlocal enabledelayedexpansion

:: Switch to script's directory
cd /d %~dp0

:: Check if Python 3.7 is installed and in the system's PATH
python --version 2>&1 | findstr /R /C:"Python 3.7.*">nul
if %errorlevel% neq 0 (
    echo Python 3.7 is not installed or not in the system's PATH.
    echo Please download Python 3.7 from the software center or ensure Python 3.7 is included within your computer's PATH setting.
    exit /b
)

echo.
echo === SICKO Web Application Setup ===
echo.

:: Check if necessary components exist
echo Checking necessary components...
for %%f in (app.py requirements.txt packages\* Input\* Output\* src\SickO.py) do (
    if not exist %%f (
        echo Missing component: %%f
        echo Please make sure all components of the SICKO folder are correctly placed.
        exit /b
    )
)

:: Create a virtual environment and activate it
echo Creating a virtual environment...
python -m venv virtualenv
call .\virtualenv\Scripts\activate.bat

:: Install the necessary packages from the local directory
echo Installing necessary packages...
pip install --no-index --find-links=packages -r requirements.txt

:: Run the Flask app
echo Running the Flask app...
set FLASK_APP=app.py
start cmd /k "flask run"

echo.
echo === SICKO Web Application Setup Complete ===
echo.

:: Display the link to access the webapp
echo You can access the web application by opening your web browser and navigating to http://localhost:5000

:: The script will keep running until the user closes it manually
pause
