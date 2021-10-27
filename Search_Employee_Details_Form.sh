#Figure 4: Search an Employee Details form
#!/bin/bash


#display search an employee details form
echo "			Search an Employee Details Form			"
echo "			-------------------------------			"
echo

check="no"
while [ "$check" = "no" ]
do

	read -p "Enter staff ID:" ID
	while ! [[ $ID =~ ^[0-9]{2} ]]
	do
		echo "Invalid ID format! Try again."
		read ID
	done

	dup="yes"
	if [ -r employee.txt ] && [ -s employee.txt ] && [ -f employee.txt ]
	then
		while IFS=":" read -r dept dupID dupName dupIC dupDOB dupPhone dupAdd dupPost dupState dupEmail
		do
			if [ "$ID" = "$dupID" ]
			then
				dup="no"
				name=$dupName
				phone=$dupPhone
				email=$dupEmail
			fi
		done < employee.txt
	fi

	if [ "$dup" = "yes" ]
	then
		echo "No employee with this ID available. Try again!"
	else
		echo
		echo "Employee Name : $name"
		echo
		echo "Mobile Number: $phone"
		echo
		echo "Email Address: $email"
		#come out from the loop
		check="yes"
	fi
	echo
	echo
	check="yes"
done

#return to main menu
function Return_Main_Menu () {
echo "Press (q) to return to Performance Evaluation Management Menu"
read enter

case "$enter" in
q )
	echo "Returning to Performance Evaluation Management Menu"
	sleep 2s
	clear
	./Performance_Evaluation_Management.sh;;
* )
	echo "Invalid input. Please try again."
	echo
	Return_Main_Menu;;
esac
}


err="yes"
while [ "$err" = "yes" ]
do
	#search another employee input
	echo "Search Another Employee? (y)es or (q)uit:"
	read input

	case "$input" in

		y | Y)
		err="no"
		clear
		./Search_Employee_Details_Form.sh;;

		q | Q)
		err="no"
		clear
		Return_Main_Menu;;

		*)
		echo "Invalid input.Please enter again."
		echo
	esac
done
