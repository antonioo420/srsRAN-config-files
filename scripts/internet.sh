### Enable IPv4/IPv6 Forwarding
sudo sysctl -w net.ipv4.ip_forward=1

### Add NAT Rule
sudo iptables -t nat -A POSTROUTING -s 10.45.0.0/16 ! -o ogstun -j MASQUERADE

#sudo iptables -A FORWARD -s 10.45.0.0/16 -j ACCEPT
#sudo iptables -A FORWARD -d 10.45.0.0/16 -j ACCEPT

sudo iptables -I FORWARD --in-interface enx00e04c360b28 --out-interface ogstun -j ACCEPT
sudo iptables -I FORWARD --in-interface ogstun --out-interface enx00e04c360b28 -j ACCEPT
