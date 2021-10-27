#!/bin/bash

#assign the id and name values from old file to new file
fromID=$1
fromName=$2

echo "			Employee PE Rating Form			"
echo "----------------------------------------------------------"
echo
echo


#get the PE criteria code
echo "Today's date is" `date "+%d-%m-%Y"`
checkDate=$(date "+%Y")
read -p "PE Assessment for Year (YYYY):" year
while ! [[ $year =~ ^[0-9]{4}$ ]]
do
	echo "Year is four digits!"
	read year
done

#check if the date is more than 2021
while ! [ "$year" -le "$checkDate" ]
do
	echo "Year must be before or equal to 2021"
	read year
done

#output the name and id to the text file first
echo "Employee ID	:$fromName							" >> "$fromID".PE."$year".txt
echo "Employee Name	:$fromID							" >> "$fromID".PE."$year".txt
echo "PE Assessment Year:$year								" >> "$fromID".PE."$year".txt
echo "==================================================================================" >> "$fromID".PE."$year".txt
printf "%-15s %-15s %-15s %-30s\n" "PE Criteria:" "Rate Obtained:" "Remarks:" "Comments:" >> "$fromID".PE."$year".txt
echo "==================================================================================" >> "$fromID".PE."$year".txt

#display this function to obtain the rate and the criteria code and comments and remarks
function Display_Rating () {
read -p "Please enter the PE criteria code:" code
while ! [[ $code =~ ^[A-Z]{2}$ ]]
do
	echo "Code is only 2 uppercase letters"
	read code
done

exist="no"
if [ -r PEcriteria.txt ] && [ -s PEcriteria.txt ] && [ -f PEcriteria.txt ]
then
	while IFS=":" read -r dupCode name desc
	do
		if [[ "$code" = "$dupCode" ]]
		then
			exist="yes"
			#assign new values to the variables
			codeName=$name
		fi
	done < PEcriteria.txt
fi

if [ "$exist" = "no" ]
then
	echo "Code does not exist. Try again."
	sleep 3s
	clear
	Display_Rating
fi
#get the rate and display the available rates
read -p "Please enter the rate obtained:	" rate
while [[ $rate -gt 10 || $rate -lt 0 ]]
do
	echo "Rating is only from 0 to 10"
	read rate
done

case "$rate" in
9|10)
	remark="Excellent";;
7|8)
	remark="Good";;
5|6)
	remark="Average";;
3|4)
	remark="Poor";;
[0-2])
	remark="Very Poor";;
esac

#sum the values of the rating
num1=$rate
sum=`expr $sum + $num1`

#find the average values of the rating
count=`expr $count + 1`

#get any comments from the user
read -p "Comments (if any):" comments
while ! [[ $comments =~ ^[a-zA-Z[:space:]?\-]+$ ]]
do
	echo "Comments can only contain letters, whitespaces and a dash(-)!"
	read comments
done

printf "%-15s %-15s %-15s %-30s\n" "$codeName" "$rate" "$remark" "$comments" >> "$fromID".PE."$year".txt
#ask if the user want to exit or stay
error_check
}

function error_check () {
echo "Press(y) to continue to enter the employee's marks again or (q) from the prompt:"
read ans

case "$ans" in
[yY])
	clear
	Display_Rating;;
[qQ])
	avg=`expr $sum / $count`
	echo >> "$fromID".PE."$year".txt
	echo "Total Rating Obtained:$sum" >> "$fromID".PE."$year".txt
	echo "Average Rating Obtained:$avg" >> "$fromID".PE."$year".txt
	echo >> "$fromID".PE."$year".txt
	echo "Redirecting to main menu"
	sleep 2s
	./Performance_Evaluation_Management.sh;;
*)
	echo "Enter only (y) or (q)!"
	sleep 3s
	error_check;;
esac
}

#invoke function
Display_Rating
