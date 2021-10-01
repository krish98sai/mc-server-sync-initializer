setlocal
call load_env.bat
SET PATH=%PATH%;%winscp_directory%
winscp.com /script=get_remote_version_sync.txt
set /p remote_sync_version=<remote_sync_version.txt
del remote_sync_version.txt
set /p local_sync_version=<server/sync_version.txt
if %local_sync_version% LEQ %remote_sync_version% goto pull_sync

:push_sync
winscp.com /script=push_sync.txt

:pull_sync
winscp.com /script=pull_sync.txt

set /p local_sync_version=<server\sync_version.txt
set /a local_sync_version += 1
echo | set /p="%local_sync_version%" > server\sync_version.txt

cd server
java -Xmx8192M -Xms8192M -jar server.jar
cd ..

winscp.com /script=push_sync.txt
