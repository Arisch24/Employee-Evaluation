#Figure 2:Department Selections Menu
#!/bin/bash

#display menu
echo "Department Selection Menu"
echo "========================="
echo

echo "A--(AC) Accounting Department"
echo "P--(PD) Purchasing Department"
echo "M--(MD) Marketing Department"
echo "H--(HR) Human Resources Department"
echo "O--(OP) Operations Department"
echo "S--(SA) Sales Department"
echo

echo "Q--Quit (Return to Performance Evaluation Management Menu)"
echo


#validating user input
echo "Please select a choice:"
read choice2

error="t"
while [ "$error" == "t" ]
do
	if [ "$choice2" == "a" ] || [ "$choice2" == "A" ]
	then
		echo "Redirecting to Accounting Department..."
		sleep 2s
		clear
		error="f"
		./Add_New_Employee_Form.sh AC
	elif [ "$choice2" == "p" ] || [ "$choice2" == "P" ]
	then
		echo "Redirecting to Purchasing Department..."
		sleep 2s
		clear
		error="f"
		./Add_New_Employee_Form.sh PD
	elif [ "$choice2" == "m" ] || [ "$choice2" == "M" ]
	then
		echo "Redirecting to Marketing Department..."
		sleep 2s
		clear
		error="f"
		./Add_New_Employee_Form.sh MD
	elif [ "$choice2" == "h" ] || [ "$choice2" == "H" ]
	then
		echo "Redirecting to Human Resource Department..."
		sleep 2s
		clear
		error="f"
		./Add_New_Employee_Form.sh HR
	elif [ "$choice2" == "o" ] || [ "$choice2" == "O" ]
	then
		echo "Redirecting to Operations Department..."
		sleep 2s
		clear
		error="f"
		./Add_New_Employee_Form.sh OP
	elif [ "$choice2" == "s" ] || [ "$choice2" == "S" ]
	then
		echo "Redirecting to Sales Department..."
		sleep 2s
		clear
		error="f"
		./Add_New_Employee_Form.sh SA
	elif [ "$choice2" == "q" ] || [ "$choice2" == "Q" ]
	then
		echo "Returning to Performance Evaluation Management Menu"
		sleep 2s
		clear
		error="f"
		./Performance_Evaluation_Management.sh
	else
		echo "Your input is invalid. Please try again."
		read choice2
	fi
done
