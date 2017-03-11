#!/bin/bash
#
# --------------------------------------------------------------------------------------------------------------------------
# This script capable to executed from cron, capturing camera image,
# copying localy and uploading that to a given FTP server
# --------------------------------------------------------------------------------------------------------------------------
#
# HUN: Idokep webkamera FTP feltoltes automatizalo script RaspberryPi
# szamitogephez, kozonseges fenykepezogep vezerlesere (Canon S5 IS
# geppel tesztelve)
#
# Before run install: sudo apt-get install gphoto2 usbmount

SUNRISE=`sunwait -p 47N 19E 2>&1 | grep 'Sun rises' | cut -d' ' -f 22`
SUNRISE=`echo $SUNRISE | cut -b1-2`:`echo $SUNRISE | cut -b3-4`:00
SUNSET=`sunwait -p 47N 19E 2>&1 | grep 'Sun rises' | cut -d' ' -f 25`
SUNSET=`echo $SUNSET | cut -b1-2`:`echo $SUNSET | cut -b3-4`:00
echo $SUNRISE
echo $SUNSET

DATENOW="$(date +%H:%M:%S)"
echo $DATENOW
#if [[ "$DATENOW" < "17:40:00" && "$DATENOW" > "06:30:00" ]]; then
if [[ "$DATENOW" < "$SUNSET" && "$DATENOW" > "$SUNRISE" ]]; then

    gphoto2 --set-config shootingmode=Auto # day time

else
    gphoto2 --set-config shootingmode=TV #night time

fi

cd /home/pi/
gphoto2 --capture-image-and-download &&
ncftpput -u USER -p PASSW ftp.server_here.com / /home/pi/*.JPG &&
/bin/rm -v -f /home/pi/*.JPG
