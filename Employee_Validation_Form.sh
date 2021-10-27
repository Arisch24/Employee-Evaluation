#!/bin/bash

echo "		Employee Details Validation Form		"
echo "----------------------------------------------------------"
echo
echo


#get user input ID
function Display_Menu () {
read -p "Please enter the employee's ID Number:" ID
while ! [[ $ID =~ ^[0-9]{5}$ ]]
do
	echo "Employee ID is only 5 numbers long"
	read ID
done

#check for existing ID
exist="no"
if [ -r employee.txt ] && [ -s employee.txt ] && [ -f employee.txt ]
then
	while IFS=":" read -r dept dupID name ic phone address postcode email
	do
		if [[ "$ID" = "$dupID" ]]
		then
			exist="yes"
			#assign the values to new variables
			newDept=$dept
			newName=$name
		fi
	done < employee.txt
fi

if [ $exist = "no" ]
then
	echo "Employee does not exist! Wait for it we are redirecting now"
	sleep 3s
	clear
	Display_Menu
else
	echo
	echo "Employee Name:	$newName"
	echo
	echo "Department:	$newDept"
	echo
fi

error_check
}



function error_check () {
#to exit
echo
echo "Press (n) to continue to enter the employee's marks or (q) to quit from the prompt:"
read input

case "$input" in
[nN])
	clear
	./Employee_Rating_Form.sh "$ID" "$newName";;
[qQ])
	sleep 2s
	clear
	./Performance_Evaluation_Management.sh;;
*)
	echo "Input is invalid! Enter only (n) or (y)"
	sleep 2s
	clear
	error_check;;
esac

}
#start here
Display_Menu
