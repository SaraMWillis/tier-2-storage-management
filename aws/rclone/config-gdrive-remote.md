# Configure Google Drive remote

## Generate Google Drive API


## rclone config
Configuring Google Drive requires a web browser. You could configure with `rclone config` on your local machine, or set up an interactive session to set up the config file.

You could create an "empty" client-id, but with private files, you will need an API key on an account that has access to the shared folders

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
