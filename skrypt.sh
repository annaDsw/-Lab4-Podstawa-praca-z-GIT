#!bin/bash

day=$(date)

date()
{
	echo "Today is $day"
}

logs()
{
	if [ "$1" -ge "0" ]; then
		n=$1
	else
		n=100
	fi
	i=1
	while (($i <= $n)); do
		echo -e "Nazwa pliku: log$i.txt\\n">log$i.txt
		echo -e "Nazwa skryptu który uwtorzył ten plik: $0\\n">>log$i.txt
		echo -e "Data utworzenia: $day\\n">>log$i.txt
		let "$[i++]"
	done
}