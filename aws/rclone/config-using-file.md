# Config rclone using its config file

A general way to set up a new remote apart from going interactive
is to directly modify the config file.

## Where is the config file?

```console
(puma) [hungtr@wentletrap tier-2-storage-management]$ rclone config file
Configuration file is stored at:
/home/u20/hungtr/.config/rclone/rclone.conf
```

- It usually is stored under `~/.config/rclone/rclone.conf`.

## How would this be helpful?

- Copy the configuration (containing the secrets) from one machine to another

- Sometimes setting up a remote requires a web browser (like [gdrive](./config-gdrive-remote.md)), but the computer is running headless, we can just copy an entry from one machine to another

