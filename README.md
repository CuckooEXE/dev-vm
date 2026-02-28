# Dev Setup

This contains a Packer script that will create _my_ typical development/RE setup. Using the packer (`packer build debian.pkr.hcl`) script requires a QEMU instance, and will create a QCOW2 with Debian Trixie. Credentials are `user:password`.

The scripts are self-sufficient, however, and are organized into groups (i.e. `400-docker-install.sh` is required before `401-docker-pull.sh`, but not required for `900-misc-downloads.sh`). You can install this on a pre-existing Debian image using the below for-loop. Note you will need `sudo` and an internet-connection. Besides misc. `apt install` packages, everything is installed in `/opt/dev-setup/`.

```sh
for f in $(ls scripts/[0-9]*.sh | sort -V); do 
    echo "Executing: $f"; 
    time ./$f || { echo "Error in $f, stopping."; break; }; 
done
```
