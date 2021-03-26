#!/bin/bash

addresses="66.249.95.225 99.77.38.1 69.52.67.1"
flop=""

for x in $addresses
do
	ping -c 2 $x | while read pong; do echo "$(date)--- $pong" ; done >> cronlog.log
	if [ $? -ne 0 ]; then
	if ["$flop" = ""]; then
	flop="$x"
	else flop="$flop, $x"
	fi
	fi
	done
if [ "$flop" != "" ]; then
	echo $flop | mail -s "connection flopped" kali@kali
fi

