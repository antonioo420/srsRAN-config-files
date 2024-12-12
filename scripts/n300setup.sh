sudo ifconfig eno12399np0 192.168.10.1 netmask 255.255.255.0
sudo ifconfig eno12409np1 192.168.20.1 netmask 255.255.255.0

sudo ip route add 192.168.10.0/24 dev eno12399np0
sudo ip route add 192.168.20.0/24 dev eno12409np1

#Tamaño de buffers de recepción y transmisión
#sudo sysctl -w net.core.wmem_max=25000000
#sudo sysctl -w net.core.rmem_max=25000000
