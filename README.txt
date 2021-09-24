Setup script
1. Copy path environment variable to a text file on the desktop
2. Append the proper path to allow winscp.com from the commandline
...

Actual script
1. local_version = sync_version file from local
1. remote_version = sync_version file from remote
1. If local_version > remote_version: Sync using remote as destination
1. Else: sync using local as destination
1. Increment local version
1. Start the server
1. Play...
1. Stop the server
1. Sync using remote as destination