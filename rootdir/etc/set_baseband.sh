#!/system/bin/sh

# grep the modem partition for baseband version and set it
setprop gsm.version.baseband `strings /dev/block/bootdevice/by-name/modem | grep "^MPSS.DPM" | head -1`
