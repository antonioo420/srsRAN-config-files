from scapy.all import *

def replace_ip_in_pcap(input_file, output_file, original_ip, new_ip):
    packets = rdpcap(input_file)
    modified_packets = []

    for packet in packets:
        if packet.haslayer(IP):
            if packet[IP].src == original_ip:
                packet[IP].src = new_ip
                del packet[IP].chksum  # Remove the checksum so Scapy recalculates it
            if packet[IP].dst == original_ip:
                packet[IP].dst = new_ip
                del packet[IP].chksum
            if packet.haslayer(TCP):
                del packet[TCP].chksum  # For TCP packets, remove the checksum for recalculation
            elif packet.haslayer(UDP):
                del packet[UDP].chksum  # For UDP packets, remove the checksum for recalculation
        modified_packets.append(packet)

    wrpcap(output_file, modified_packets)

# Example usage (original file, new file, original IP, new IP)
    
replace_ip_in_pcap("smallFlows.pcap", "editedsmallFlows.pcap", "192.168.3.131", "10.45.1.2")
