#Figure 1
#!/bin/bash

clear
#display menu
echo "Performance Evaluation Management Menu"
echo "--------------------------------------"
echo
echo "A--Add New Employee"
echo "B--Search Employee Details"
echo "C--Add New Performance Evaluation"
echo "D--Search Performance Evaluation Details"
echo "E--Rate Employee"
echo
echo
echo "Q--Exit From Program"


error="yes"
while [ "$error" = "yes" ]
do
	#accept user input
	echo "Please select a choice:"
	read choice1

	if [ "$choice1" == "a" ] || [ "$choice1" == "A" ]
	then
		echo "Redirecting to Department Selections Menu..."
		error="no"
		sleep 3s
		clear
		./Department_Selections_Menu.sh
	elif [ "$choice1" == "b" ] || [ "$choice1" == "B" ]
	then
		echo "Redirecting to Search Employee Details..."
		error="no"
		sleep 3s
		clear
		./Search_Employee_Details_Form.sh
	elif [ "$choice1" == "c" ] || [ "$choice1" == "C" ]
	then
		echo "Redirecting to Add New Performance Evaluation..."
		error="no"
		sleep 3s
		clear
		./Add_Performance_Evaluation_Form.sh
	elif [ "$choice1" == "d" ] || [ "$choice1" == "D" ]
	then
		echo "Redirecting to Search Performance Evaluation Details"
		error="no"
		sleep 3s
		clear
		./Search_Criteria_Details_Form.sh
	elif [ "$choice1" == "e" ] || [ "$choice1" == "E" ]
	then
		echo "Redirecting to Rate Employee Menu"
		error="no"
		sleep 3s
		clear
		./Employee_Validation_Form.sh
	elif [ "$choice1" == "q" ] || [ "$choice1" == "Q" ]
	then
		echo "Thank You. Bye and come again."
		error="no"
		exit
	else
		echo "Your input is not valid. Please try again."
	fi
done
