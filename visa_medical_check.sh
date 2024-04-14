#!/bin/bash

echo "Starting Test ..."

source venv/bin/activate

TST=true

FIND_APPOINTMENT_BEFORE_DATE="20240519"

while [ $TST == true ]
do

	echo "-----------------------------------------------------------------------------------------------"
	echo $(date)

	OUTPUT_RUN=$(python3 check_visa_appointment.py $FIND_APPOINTMENT_BEFORE_DATE)
	#OUTPUT_RUN="30/03/2021"
	echo $OUTPUT_RUN

	if [[ "$OUTPUT_RUN" =~ ^Opps.* ]]; then
		echo "No Luck till yet."
	else
		STRLENGTH=$(echo -n $OUTPUT_RUN | wc -m)
		
		if [[ $STRLENGTH -gt 10 ]]; then
			echo "Some Issue: $OUTPUT_RUN"
			
		else
			
			echo "Hurray ... Got Appintment for '$OUTPUT_RUN'..."
			notify-send "Visa Appointment Update" "Visa Medical check-up appointment available for $OUTPUT_RUN"
			zenity --error --text="Visa Medical check-up appointment available for $OUTPUT_RUN\!" --title="Warning\!"
		fi
		
		
	fi
	
	echo $(date)
	echo "-----------------------------------------------------------------------------------------------"
	sleep 30
	#TST=false

done

deactivate


echo "Done Test ..."

