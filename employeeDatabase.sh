#!/bin/bash
case $1 in
	write)
		echo "$2,$3,$4" >> employee.txt
		echo done
	
		;;
	read)
		case $2 in 
			eno)
				cat employee.txt | grep -w "$3"
				;;
			ename)
				cat employee.txt | grep -w "$3"
				;;
			esalary)
				cat employee.txt | grep -w "$3"
				
		esac
		;;
	update)
		pr=$(cat employee.txt | grep -w "$2")
		ch=$(echo $2,$3,$4)
		sed -i s/$pr/$ch/g employee.txt
		echo done
		;;
	delete)
		sed -i /^$2/d employee.txt
		echo done
		;;
	duplicate)
		echo $(uniq -d employee.txt)
		;;
	nthsalary)
		nh=$(cat employee.txt | cut -d "," -f 3 | sort -nr | uniq | head -n $2 | tail -n 1)
		for i in $(cat employee.txt | cut -d "," -f 3 | grep -nx $nh | cut -d ":" -f 1)
		do
			echo $(cat employee.txt | head -n $i | tail -n 1)
		done
		;;

esac
