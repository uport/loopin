#! /bin/bash
sed -i 's/defaults/defaults,noatime,discard,compress=lzo/' /etc/fstab
