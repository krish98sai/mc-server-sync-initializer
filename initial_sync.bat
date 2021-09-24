call load_env.bat
IF EXIST %winscp_directory% SET PATH=%PATH%;%winscp_directory%
md server
winscp.com /script=initial_sync.txt
pause