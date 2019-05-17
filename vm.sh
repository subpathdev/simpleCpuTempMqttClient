#!/usr/bin/env bash

help() {
	echo to start this programm you have to set the device id and the ip address of the MQTT-Brocker
	echo
	echo Example:
	echo \t./main.sh 1237892435286432-12579834 127.0.0.1
}

if [ $# -ne 2 ]; then
	help
	exit 1
fi

id=$1
ip=$2


mosquitto_pub -q 0 -h $ip -t "\$hw/events/device/$id/state/update" -m '{"state":"online"}'
while true
do
	#temp=$(sensors -Au | grep temp2_input | sed 's/temp2_input://' | sed 's/   //')
	temp=$RANDOM
	mes=$(echo '{"event_id":"","timestamp":0,"Twin":{"Temp":{"actual":{"value":"'$temp'"},"metadata":{"type":"Updated"}}}}')
	mosquitto_pub -q 0 -h $ip -t "\$hw/events/device/$id/twin/update" -m $mes
	sleep 10s
done
