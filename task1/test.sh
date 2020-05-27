#!/bin/bash
mydisk()
{
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }'
sleep 5
clear
done
}

mycpu()
{
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo $CPU
sleep 5
done
}
mynet()
{
REQUIRED_PKG="bwm-ng"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get --yes install $REQUIRED_PKG 
fi
bwm-ng
}
clear
echo "--------------------------------"
echo "Welcome to Status Check "
echo "--------------------------------"
echo -e "[a]DISK\n[b]CPU\n[c]NETWORK\n[d]exit\n"
read -p "Enter your choice: " choice
case $choice in
   [aA])
	echo " DISK USAGE AND PRESS TO QUIT CTRL+Q"
        mydisk
        ;;
   [bB])
	echo " CPU USAGE AND PRESS TO QUIT CTRL+Q"
        mycpu
        ;;
   [cC])
	echo " NETWORK USAGE AND PRESS TO QUIT CTRL+Q "
        mynet
        ;;
   [dD])
        exit 1
        ;;
   *)
       echo "Wrong choice"
       ;;
esac


