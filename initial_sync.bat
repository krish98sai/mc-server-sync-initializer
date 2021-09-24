setlocal
call load_env.bat
SET PATH=%PATH%;%winscp_directory%
md server
winscp.com /script=initial_sync.txt
pause