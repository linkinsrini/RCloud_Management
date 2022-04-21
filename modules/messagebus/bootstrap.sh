#!/bin/bash
# AC/MB Bootstrap Script

# Add in any necessary commands - this file will be run as part of the cloud-init for the VMs when they are first created.

# echo "start bootstrap"
# # Add Sumologic Collector for local logs.
# wget "https://collectors.us2.sumologic.com/rest/download/linux/64" -O SumoCollector.sh
# chmod +x SumoCollector.sh 
# sudo ./SumoCollector.sh -q -Vsumo.token_and_url=U1VNT0tibVpyMTlyQ3kzTlAxMGtreEg0Rlp3TzBKVzRodHRwczovL2NvbGxlY3RvcnMudXMyLnN1bW9sb2dpYy5jb20=

function hostname() {
    hostnamectl set-hostname "${CUSTOMER_NAME}-MB-${ENV_NAME}"
}
hostname