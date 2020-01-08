#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

DEVICE=$(df /testfolder | awk 'NR == 2 {print $1}')
OUT_FOLDER="/testfolder/fsinfo_out"
INSTANCE=${1:-unknown-instance}

mkdir -p $OUT_FOLDER
cat /proc/mounts > $OUT_FOLDER/mount.info
if mdadm --query --detail $DEVICE > /dev/null 2>&1 ; then
  mdadm --query --detail $DEVICE > $OUT_FOLDER/mdadm.info
fi
dumpe2fs -h $DEVICE > $OUT_FOLDER/dumpe2fs.info
nvme list  > $OUT_FOLDER/nvme_list.info
ioping -c 100 /testfolder > $OUT_FOLDER/ioping.info
fio job.fio --filename=/testfolder/fio.tmp --output-format=json > $OUT_FOLDER/fio.json
tar -czf $OUT_FOLDER/../$INSTANCE.ioperf.tar.gz -C $OUT_FOLDER .
rm -rf /testfolder/fio.tmp $OUT_FOLDER
echo "done"
