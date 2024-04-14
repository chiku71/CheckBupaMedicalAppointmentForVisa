# CheckBupaMedicalCheckAppointmentForVisa
Check Bupa Medical Check Appointment for Visa 482

Steps:
- Install the required python packages.
- Set the "FIND_APPOINTMENT_BEFORE_DATE" value in "visa_medical_check.sh" file as required.  
- Run the "visa_medical_check.sh" file.

The script will run every 30 secs and will show notification when any appointment date is available before the provided date.

To fix issue with getting stuck after Launching browser:
$ pip3 install websockets -U
