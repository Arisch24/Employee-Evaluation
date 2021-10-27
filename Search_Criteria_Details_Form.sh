#!/bin/bash
#Search PE Criteria Details Form

echo "-------------------------------"
echo "Search PE criteria Details Form"
echo "-------------------------------"

error="yes"
while [ "$error" = "yes" ]
do
	read -p "Enter PE criteria code:" code
	while ! [[ $code =~ ^[A-Z]{2}+$ ]]
	do
		echo "Code is only two Uppercase letters!"
		read code
	done


	existing="no"
	if [ -r PEcriteria.txt ] && [ -s PEcriteria.txt ] && [ -f PEcriteria.txt ]
	then
		while IFS=":" read -r code2 name desc
		do
			if [ "$code" = "$code2" ]
			then
				existing="yes"
				#insert the value to another variable
				name2=$name
				desc2=$desc
			fi
		done < PEcriteria.txt
	fi

	if [ "$existing" = "no" ]
	then
		echo "There are no existing codes!!! Try again."
		sleep 3s
		clear
	else
		echo
		echo "PE Criteria Name: $name2"
		echo
		echo "Description: $desc2"
		echo
		error="no"
	fi
done


#ask if user wants to search again
echo "Search Another PE Criteria? (y)es or (q)uit:"
read scan

check="yes"
while [ "$check" = "yes" ]
do
	case "$scan" in
	[yY])
		check="no"
		clear
		./Search_Criteria_Details_Form.sh;;
	[qQ])
		echo "Press (q) to return to Performance Evaluation Menu"
		check="no";;
	*)
		echo "Enter only (y) or (q)!"
		read scan;;
	esac
done


ans="yes"
while [ "$ans" = "yes" ]
do
	read msg
	while ! [[ $msg =~ ^[qQ]{1}$ ]]
	do
		echo "Enter (q) please, not others!"
		read msg
	done

	if [ "$msg" = "q" ]
	then
		sleep 2s
		clear
		./Performance_Evaluation_Management.sh
	fi
done

