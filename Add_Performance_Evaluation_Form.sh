#Add Performance Evaluation Criteria Form
#!/bin/bash

function Return_Main_Menu(){
	read input
	if [ $input = "Q" ] || [ $input = "q" ]
	then
		clear
		sleep 1s
		./Performance_Evaluation_Management.sh
	else
	echo "Invalid input. Enter q to return."
	Return_Main_Menu
	fi
}


function choice_validation(){
echo "Add Another Criteria? (y)es or (q)uit:"
read choice

case "$choice" in
[yY])
	clear
	Add_Performance_Evaluation;;
[qQ])
	echo
	echo "Press q to return to Performance Evaluation Management Menu"
	Return_Main_Menu;;
*)
	echo -e "Invalid choice! Try again\a"
	echo
	choice_validation;;
esac
}


#Display Menu
function Add_Performance_Evaluation(){
echo "		Add New Performance Evaluation Criteria		"
echo " 		=======================================		"
echo

#get the code
read -p "PE Criteria Code	:" code
while ! [[ $code =~ ^[A-Z]{2}$ ]]
do
	echo "Code format is invalid. Please try again."
	read code
done

#get the criteria name
read -p "PE Criteria Name	:" criteria_name
while ! [[ $criteria_name =~ ^[a-zA-Z[:space:]?]+$ ]]
do
	echo "Criteria name is not correct. Try again please."
	read criteria_name
done

#get the criteria description
read -p "Description		:" desc
while ! [[ $desc =~ ^[a-zA-Z\.\,\&\'\[:space:]?]+$ ]]
do
	echo "Description cannot have numbers"
	read desc
done

echo "$code":"$criteria_name":"$desc" >> PEcriteria.txt
echo

choice_validation
}


#Start here
Add_Performance_Evaluation
