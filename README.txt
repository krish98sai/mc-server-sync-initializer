Prerequisites
- Install Java to run server.jar (https://www.oracle.com/java/technologies/downloads/#jdk17-windows)
- Install WinSCP to synchronize (https://winscp.net/eng/download.php)

Procedure
1. Rename 'load_env.bat.tmpl' -> 'load_env.bat'
2. Edit 'load_env.bat', fill in missing fields including ftp_address
3. Run 'initial_sync.bat'
4. Go into the 'server' directory
5. Run 'start_server.bat'
6. Play...
7. Stop the server with the 'stop' command

###################################################

Initial pseudocode
1. local_version = sync_version file from local
2. remote_version = sync_version file from remote
3. If local_version > remote_version: Sync using remote as destination
4. Else: sync using local as destination
5. Increment local version
6. Start the server
7. Play...
8. Stop the server
9. Sync using remote as destination