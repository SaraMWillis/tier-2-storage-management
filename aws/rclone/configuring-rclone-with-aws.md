# Rclone configuration for AWS storage

The text between each rclone configuration selection is omitted for clarity. The region should be set to 3 (us-west-2), otherwise transfers will fail.

```console
[sarawillis@sdmz-dtn-4 ~]$ rclone config
e/n/d/r/c/s/q> n
name> AWS
Storage> s3
provider> 1
env_auth> 1
access_key_id> YOUR_KEY_ID_HERE
secret_access_key> YOUR_SECRET_ACCESS_KEY_HERE
region> 3
endpoint> 
location_constraint> 
acl> 
server_side_encryption> 
sse_kms_key_id> 
storage_class> 8
Edit advanced config? (y/n)
y) Yes
n) No
y/n> n
Remote config
--------------------
[AWS]
type = s3
provider = AWS
env_auth = false
access_key_id = YOUR_KEY_ID_HERE
secret_access_key = YOUR_SECRET_ACCESS_KEY_HERE
region = us-west-2
storage_class = INTELLIGENT_TIERING
--------------------
y) Yes this is OK
e) Edit this remote
d) Delete this remote
y/e/d> y
e/n/d/r/c/s/q> q
[sarawillis@sdmz-dtn-4 ~]$ rclone ls AWS:your-bucket-name
... ### your bucket contents ###
```

## Storage classes

```text
The storage class to use when storing new objects in S3.
Enter a string value. Press Enter for the default ("").
Choose a number from below, or type in your own value
 1 / Default
   \ ""
 2 / Standard storage class
   \ "STANDARD"
 3 / Reduced redundancy storage class
   \ "REDUCED_REDUNDANCY"
 4 / Standard Infrequent Access storage class
   \ "STANDARD_IA"
 5 / One Zone Infrequent Access storage class
   \ "ONEZONE_IA"
 6 / Glacier storage class
   \ "GLACIER"
 7 / Glacier Deep Archive storage class
   \ "DEEP_ARCHIVE"
 8 / Intelligent-Tiering storage class
   \ "INTELLIGENT_TIERING"
storage_class> 
```
