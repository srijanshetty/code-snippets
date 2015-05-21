We’re now going to clean up disk space on the VM so when we package it into a new Vagrant box, it’s as clean as possible. First, remove APT cache

```shell
$ sudo apt-get clean
```

Then, “zero out” the drive (this is for Ubuntu):

```shell
$ sudo dd if=/dev/zero of=/EMPTY bs=1M
$ sudo rm -f /EMPTY
```

Lastly, let’s clear the Bash History and exit the VM:

```shell
$ cat /dev/null > ~/.bash_history && history -c && exit
```

We’re now going to repackage the server we just created into a new Vagrant Base Box. It’s very easy with Vagrant:

```shell
$ vagrant package --output mynew.box
```