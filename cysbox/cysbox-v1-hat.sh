#!/bin/sh

# set -x
cysbox="cysbox-v1-hat"

echo "Compiling "$cysbox
eepmake $cysbox.txt $cysbox.eep
echo "Erasing HAT Memory"
eepflash.sh -w -f=blank.eep -t=24c32
echo "Flashing "$cysbox
eepflash.sh -w -f=$cysbox.eep -t=24c32



