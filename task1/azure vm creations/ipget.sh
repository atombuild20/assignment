#!/bin/bash
echo -e "\n ip of linux1:"
echo "$(az vm show -d -g ansibleresource -n linuxvm1 --query publicIps -o tsv)"
echo -e "\n ip of linux:"
echo "$(az vm show -d -g ansibleresource -n linuxvm2 --query publicIps -o tsv)"
