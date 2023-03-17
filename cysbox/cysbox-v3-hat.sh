#!/bin/sh

# set -x
cysbox="cysbox-v3-hat"

read -p "Enter serial number (4 digits) : " SN
read -p "Program $cysbox with SN $SN ? (y/n) " RESP
if [ "$RESP" = "y" ]; then
	sed 's/___SN___/'$SN'/g' $cysbox.txt > $cysbox-sn.txt
	echo "Compiling "$cysbox
	eepmake $cysbox-sn.txt $cysbox-sn.eep
	echo "Erasing HAT Memory"
	eepflash.sh -w -f=blank.eep -t=24c32
	echo "Flashing "$cysbox
	eepflash.sh -w -f=$cysbox-sn.eep -t=24c32
fi


