#Figure 3: Add New Employee Form
#/bin/bash

#return to function if invalid selection
function Main_Menu_Selection () {
echo "Press (q) to return to Performance Evaluation Management Menu"
read selection

if [ $selection == "q" ] || [ $selection == "Q" ]
then
	Return_Main_Menu
else
	echo "Your input is invalid."
	Main_Menu_Selection
fi
}


#function to return to main menu
function Return_Main_Menu () {
echo
echo "Redirecting to Main Menu..."
sleep 2s
clear
./Performance_Evaluation_Management.sh
}



#function to return to department menu
#function Return_Dept_Menu () {
#echo Redirecting to Performance Evaluation Management Menu"
#sleep 2s
#clear
#./Department_Selections_Menu.sh
#}



#asking user if they want to add another employee
#if invalid input then prompt to enter again
function Add_Employee_Input () {
echo "Add Another Employee? (y)es or (q)uit:"
read input

if [ "$input" == "y" ] || [ "$input" == "Y" ]
then
	clear
	Add_Employee_Menu
elif [ "$input" == "q" ] || [ "$input" == "Q" ]
then
	echo
	Main_Menu_Selection
else
	echo "Invalid input. Please try again."
	echo
	Add_Employee_Input
fi
}



#display the menu
function Add_Employee_Menu () {
echo "Add New Employee Form"
echo "====================="
echo "This is $value Department"
echo
echo

#get ID
read -p "Staff ID			:" ID
validID="^[0-9]{5}$"
while ! [[ $ID =~ $validID ]]
do
	echo "Invalid ID. Try again."
	read ID
done

#read name
read -p "Staff Full Name			:" fullName
validName="^[a-zA-Z[:space:]?]"
while ! [[ $fullName =~ $validName ]] 
do
	echo "Wrong format. Try again please."
	read fullName
done

#read IC
read -p "NRIC Number/Passport Number	:" ICNo
while ! [[ $ICNo =~ ^[0-9]{6}-[0-9]{2}-[0-9]{4}+$ ]]
do
	echo "IC format XXYYZZ-XX-ZZZZ. Enter again please."
	read ICNo
done

#get birthdate
read -p "Birth Date (DD-MM-YYYY)		:" birthDate
while ! [[ $birthDate =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]]
do
	echo "Invalid birthdate format. Enter again!"
	read birthDate
done

#get mobile number
read -p "Mobile Number			:" phoneNo
while ! [[ $phoneNo =~ ^[0-9]{3}-[0-9]{7,8}$ ]]
do
	echo "Number format is invalid. Try again."
	read phoneNo
done

#get mailing address
read -p "Mailing Address			:" address
while ! [[ $address =~ ^[a-zA-Z0-9\,\[:space:]?]+$ ]]
do
	echo "Address format is the house address!"
	read address
done

#get postcode
read -p "Postcode			:" postcode
while ! [[ $postcode =~ ^[0-9]{5}$ ]]
do
	echo "Postcode is only 5 digits. Enter again please."
	read postcode
done

#get state
read -p "State				:" state
while ! [[ $state =~ ^[a-zA-Z]+$ ]]
do
	echo "State not correct. Try again."
	read state
done

#get email address
read -p "Email Address			:" email
while ! [[ $email =~ ^[a-zA-Z0-9._%+-]?+@[a-zA-Z0-9.-]?+\.[a-zA-Z]{2,4}$ ]]
do
	echo "Email address example: ali123@gmail.com. Enter again"
	read email
done

echo "$value":"$ID":"$fullName":"$ICNo":"$birthDate":"$phoneNo":"$address":"$postcode":"$state":"$email" >> employee.txt

echo
echo
Add_Employee_Input
}



#THIS IS WHERE THE MENU STARTS
value=$1
Add_Employee_Menu $value
