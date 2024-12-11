#!/bin/bash

#Antes de iniciar srsUE

sudo ip netns add ue1
sudo /home/gitaca/Desktop/stopopen5gs.sh
sudo ifconfig ogstun down

#Después de iniciar srsUE

sudo ip ro add 10.45.0.0/16 via 10.53.1.2
sudo ip netns exec ue1 ip route add default via 10.45.1.1 dev tun_srsue
