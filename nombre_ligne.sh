IFS=$'\n'
nbre_lignes=0
for ligne in $(cat /etc/passwd)
do
	echo $ligne
	let nbre_lignes++
done
echo "Nombre de lignes lues : $nbre_lignes"
