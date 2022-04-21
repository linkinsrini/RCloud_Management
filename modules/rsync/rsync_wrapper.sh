#!/bin/bash
dat=`date -I`
cd /opt/rsync
./rsync.sh >> $dat.log