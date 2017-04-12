#!/bin/bash

pfctl -E
# create anchor in pf

/bin/cp /etc/pf.conf  /tmp/pf.conf.$$ 
echo "dummynet-anchor \"limit\"" >> /tmp/pf.conf.$$
echo "anchor \"limit\"" >> /tmp/pf.conf.$$
pfctl -f /tmp/pf.conf.$$

/bin/rm /tmp/pf.conf.$$

echo "dummynet in quick proto tcp from any to any port 8292 pipe 1" | pfctl -a limit -f -

dnctl pipe 1 config bw 5Mbit/s


#echo "dummynet in quick proto tcp from any to any port 8292 pipe 1" | sudo pfctl -a limit -f - 
