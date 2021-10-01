setlocal
call load_env.bat
SET PATH=%PATH%;%winscp_directory%

winscp.com /script=get_remote_sync_owner_lock.txt
set /p remote_sync_owner_lock=<remote_sync_owner_lock.txt
del remote_sync_owner_lock.txt
if "%remote_sync_owner_lock%" == "" goto pull_sync
if "%remote_sync_owner_lock%" == "%sync_owner_lock%" goto pull_sync

exit /b 1 The server is owned by %remote_sync_owner_lock%

:pull_sync
winscp.com /script=pull_sync.txt

echo | set /p=%sync_owner_lock% > server\sync_owner_lock.txt
winscp.com /script=push_sync.txt
set /p local_sync_version=<server\sync_version.txt
set /a local_sync_version += 1
echo | set /p="%local_sync_version%" > server\sync_version.txt

copy server\server.properties.tmpl server\server.properties
echo query.port=%query_port%>>server\server.properties

cd server
java -Xmx8192M -Xms8192M -jar server.jar
cd ..

del server\server.properties

break>server\sync_owner_lock.txt

winscp.com /script=push_sync.txt