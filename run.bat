@echo off

SET FIND_APPOINTMENT_BEFORE="20240521"
:LOOP_START
    echo "------------------------------------------------------------------------------------------------------------"
    echo "Running process on: %DATE:~10,4%%DATE:~4,24%%DATE:~7,2%_%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2% "

    FOR /F "token=*" %%g IN ('python check_visa_appointment.py "%FIND_APPOINTMENT_BEFORE%"') do (SET OUTPUT_RUN=%%g)

    if "%OUTPUT_RUN:~0,5%"=="Opps." (
        echo "%OUTPUT_RUN%"

        echo "Sleeping for 30 seconds ..."
        echo "-------------------------------------------------------------------------------------------------------------------"
        timeout 30
        goto LOOP_START
    ) else (
        msg * "New Appointment Available on: %OUTPUT_RUN%"
        goto LOOP_END
    )

:LOOP_END