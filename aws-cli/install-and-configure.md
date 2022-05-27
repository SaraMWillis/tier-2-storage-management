# Install 

Information on installing: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

```console
[sarawillis@cpu23 sarawillis]$ mkdir aws-install-test
[sarawillis@cpu23 sarawillis]$ cd aws-install-test/
[sarawillis@cpu23 aws-install-test]$ curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 44.8M  100 44.8M    0     0  9380k      0  0:00:04  0:00:04 --:--:-- 9555k
[sarawillis@cpu23 aws-install-test]$ unzip awscliv2.zip
. . .
[sarawillis@cpu23 aws-install-test]$ cd aws
[sarawillis@cpu23 aws]$ ./install --install-dir $PWD # Can set to anywhere in your account
[sarawillis@cpu23 aws]$ ./install --install-dir $PWD --bin-dir $PWD/bin # Run "./install --help" for details
You can now run: /xdisk/sarawillis/aws-install-test/aws/bin/aws --version
[sarawillis@cpu23 aws]$ /xdisk/sarawillis/aws-install-test/aws/bin/aws --version
aws-cli/2.7.4 Python/3.9.11 Linux/3.10.0-1160.62.1.el7.x86_64 exe/x86_64.centos.7 prompt/off
[sarawillis@cpu23 aws]$ 
```

For my original install, I added the bin directory to my PATH in my bashrc:
```console
[sarawillis@cpu23 aws]$ cat ~/.bashrc | grep aws
export PATH=$PATH:$HOME/.local/bin:$HOME/bin:/home/u21/sarawillis/bin/aws-cli/v2/2.7.1/bin
```

# Configure

```console
[sarawillis@cpu23 aws]$ aws configure
AWS Access Key ID [None]: YOUR_ACCESS_KEY
AWS Secret Access Key [None]: YOUR_SECRET_ACCESS_KEY
Default region name [None]: us-west-2
Default output format [None]: json
```
