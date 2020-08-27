#!/bin/sh
# chkconfig: 2345 99 01
# description: ShadowVPN

shadowvpn=""
shadowvpn_locations="/etc/shadowvpn/outline-ss-server"
for location in $shadowvpn_locations
do
  if [ -f "$location" ]
  then
    shadowvpn=$location
  fi
done

# Our working directory
work=/etc/shadowvpn/

killall outline-ss-server
rm -rf /root/nohup.out
sleep 3
nohup $shadowvpn -config $work/config.yml -metrics=127.0.0.1:70 &
exit
