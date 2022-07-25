REM 1 - git branch to setup
REM Sequence of these git commands is mandatory to cover various states of git repos.
REM If CI/CD build is broken, check this script is not in subject of change.

if "%1"=="" exit /b 1

git fetch -p
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

git clean -dfx
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

git submodule foreach --recursive git clean -xfd
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

git reset --hard
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

git submodule foreach --recursive git reset --hard
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

git checkout %1
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

git pull
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%

git submodule update --init --recursive
if %ERRORLEVEL% neq 0 exit /b %ERRORLEVEL%
