Solution
--------

```shell
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install --reinstall base-files=6.5ubuntu6.7+elementary8~ubuntu0.2.1
```

Error was related to /etc/os-release and /etc/lsb-release. The files looked like this before:

```shell
cat /etc/os-release
NAME="Ubuntu"
VERSION="12.04.5 LTS, Precise Pangolin"
ID=ubuntu
ID_LIKE=debian
PRETTY_NAME="Ubuntu precise (12.04.5 LTS)"
VERSION_ID="12.04"
```

```shell
cat /etc/lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=12.04
DISTRIB_CODENAME=precise
DISTRIB_DESCRIPTION="Ubuntu 12.04.5 LTS"
```

And they looked like this afterwards:

```shell
cat /etc/os-release
NAME="elementary OS"
VERSION="0.2.1 Luna"
ID="elementary OS"
ID_LIKE=ubuntu
PRETTY_NAME="elementary OS Luna"
VERSION_ID="0.2.1"
```

```shell
cat /etc/lsb-release
DISTRIB_ID="elementary OS"
DISTRIB_RELEASE=0.2.1
DISTRIB_CODENAME=luna
DISTRIB_DESCRIPTION="elementary OS Luna"
```