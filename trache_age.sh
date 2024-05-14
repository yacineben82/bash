#!/bin/bash
read -p "Votre Age : " age
if [ -z "$age" ] 
then
    echo "Chaine vide"
else
    if [[ "$age" =~ [^0-9] ]]                             
    then
        echo "Chaine non numérique"
    else  
    	if [ $age -gt 16 -a $age -lt 65 ]
    	then
    	    echo "Age adulte"
    	else
	        if [ $age -lt 16 ]
	        then
	            echo "Encore jeune"
	        else
	            echo "Troisieme age"
	        fi
	    fi
    fi
fi
