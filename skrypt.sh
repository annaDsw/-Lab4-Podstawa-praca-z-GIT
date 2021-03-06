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

error()
{
	if [ "$1" -ge "0" ]; then
		n=$1
	else
		n=100
	fi
	i=1
	while (($i <= $n)); do
		echo -e "Nazwa pliku: error$i.txt\\n">log$i.txt
		echo -e "Nazwa skryptu który uwtorzył ten plik: $0\\n">>log$i.txt
		echo -e "Data utworzenia: $day\\n">>log$i.txt
		let "$[i++]"
	done
}

init()
{
	echo "Please provide origin url:"
	read uri
	git clone $uri
	if [[ ":$PATH:" == ":$(pwd):" ]]; then
	echo "PATH already contains $(pwd), skipping..."
	else
      	echo "Adding $(pwd) to PATH..."
      	echo $(date) > path.bin
      	echo "Number of processors: " $(nproc) >> path.bin
      	echo "Environment: " $PATH >> path.bin
      	export PATH=$PATH:$(pwd)
	fi

}

help()
{
	echo "Available commands:"
	echo "--help - Show this message"
	echo "-h - Show this message"
	echo "--date - Show current date"
	echo "-d - Show current date"
	echo "--logs - Create 100 or chosen number of texts files"
	echo "-l - Create 100 or chosen number of texts files"
	echo "--error - Creates 100 or chosen number of error files"
	echo "-e - Creates 100 or chosen number of error files"
	echo "--init - Initialize Git, changing PATH"
	echo "-i - Initialize Git, changing PATH"
}


case $1 in
	--date) date;;
	-d) date;;
	--logs) 
		if [ "$2" = 0 ]; then
			logs
		else
			logs $2
		fi;;
	-l)
		if [ "$2" = 0 ]; then
			logs
		else
			logs $2
		fi;;
	--error)
		if [ "$2" = 0 ]; then
			error
		else
			error $2
		fi;;
	-e)
		if [ "$2" = 0 ]; then
			error
		else
			error $2
		fi;;
	--init) init;;
	-i) init;;
	--help) help;;
	-h) help;
	*)
        echo "Unknown command: $i"
        help
        ;;
esac


if [ $# -eq 0 ]; then
    echo "No arguments provided"
    help
fi