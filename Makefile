install:
	install -m 755 nvidia_smi_exporter /usr/local/bin/
	install -m 644 prometheus-nvidia.service /etc/systemd/system/
	systemctl restart prometheus-nvidia.service & systemctl enable prometheus-nvidia.service 
	
uninstall:
	systemctl stop prometheus-nvidia.service & systemctl disable prometheus-nvidia.service 
	rm -f /usr/local/bin/nvidia_smi_exporter
	rm -f /etc/systemd/system/prometheus-nvidia.service
