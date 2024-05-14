#!/usr/bin/bash
#
# Utilisation de la commande lsof (ports et services)
# 
# Vérification si port ouvert
if lsof -t -i:22 >/dev/null
then
	# Arrêt du service sshd
	systemctl stop sshd 
	echo "Service sshd arreter"
else
	echo "Port non utilise"
fi
