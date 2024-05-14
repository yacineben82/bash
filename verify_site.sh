#!/usr/bin/bash
# Script qui lit à l'entrée standard un nom de site.
# Fait un < nslookup > sur ce site.
# Le script s'arrete que le mot < fin est introduit >
declare -l site
clear
while true
do
	read -p " Donnez un nom de site à vérifier ou < fin > pour quitter  :  " site
	if [ -z "$site" ]
	then
		echo "Donnez au moins un nom non vide ???? " | grep --color .
		read -p "Enter pour continuer ..."
		continue
	fi
	if [ "$site" == "fin" ]
	then
		break
	fi	
	nslookup $site
done
		
