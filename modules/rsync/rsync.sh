rsync -auv --timeout=4 -e "ssh -i /home/skrishnasamy/lbrands_prod -o StrictHostKeyChecking=no" --rsync-path="sudo rsync" varmour@172.27.251.78:/var/k8s/va-disk/logstores/* /s3logdrive/rsync/lbrands_prod-mb/
rsync -auv --timeout=4 -e "ssh -i /home/skrishnasamy/lbrands_dev -o StrictHostKeyChecking=no" --rsync-path="sudo rsync" /s3logdrive/rsync/lbrands_prod-mb/* varmour@192.168.111.241:/var/k8s/va-disk/logstores/


0,15,30,45 * * * * /bin/bash /opt/rsync/rsync_wrapper.sh

