#!/system/bin/sh
# Copyright (c) 2009, ZTE . All rights reserved.
#History:
#when       who         what, where, why
#--------   ----        ---------------------------------------------------
#2011-03-14 xumei     new file for bt test mode 
##########################################

echo 1 > /sys/class/rfkill/rfkill0/state

setprop ctl.start hciattach
sleep 2
hciconfig hci0 up      
hcitool cmd 0x06 0x0003  
hcitool cmd 0x03 0x0005 0x02 0x00 0x02
hcitool cmd 0x03 0x001A 0x03
hcitool cmd 0x03 0x0020 0x00
hcitool cmd 0x03 0x0022 0x00
