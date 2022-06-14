# Configure Google Drive remote

## Generate Google Drive API

TODO. Consult rclone's [documentation](https://rclone.org/drive)

## rclone config

Configuring Google Drive requires a web browser. You could configure with `rclone config` on your local machine, or set up an interactive session to set up the config file.

You could create an "empty" client-id, but as the [documentation](https://rclone.org/drive/#making-your-own-client-id) says, we would want
our own client-id to prevent going above 10 transactions per second for best performance.

```console
$ rclone config
e/n/d/r/c/s/q> n
name> <name-for-remote: gdrive>
Storage>drive
client_id> YOUR_CLIENT_ID
client_secret> 
scope> 
root_folder_id> 
service_account_file> 
Edit advanced config? (y/n)
y/n> y
auth_owner_only> 
use_trash> 
skip_gdocs>
skip_checksum_gphotos>
shared_with_me> true
trashed_only>
export_formats>
import_formats>
allow_import_name_change>
use_created_date>
list_chunk>
impersonate>
alternate_export> true
upload_cutoff>
chunk_size>
acknowledge_abuse>
keep_revision_forever>
size_as_quota>
v2_download_min_size>
pacer_min_sleep>
pacer_burst>
server_side_across_configs> true
disable_http2>
Use auto config?
y/n> y
```

- The command line will then show the link to authorize rclone to allow access. The link should be in the following format: `http://127.0.0.1:xxxxx/auth?state=xxxx`
- Login with your google account.

## Resulting config

```console
$ rclone config show 
type = drive
shared_with_me = true
alternate_export = true
token = {"access_token":"XXXX","token_type":"Bearer","refresh_token":"XXXX","expiry":"2022-06-14T12:05:28.228658766-07:00"}
root_folder_id = 0ALGeHx5wl-0VUk9PVA
```