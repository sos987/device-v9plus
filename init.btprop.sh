#!/system/bin/sh
# Copyright (c) 2009, ZTE . All rights reserved.
#History:
#when       who         what, where, why
#--------   ----      ---------------------------------------------------
#2011-05-12 xumei     new file for bt prop 
##########################################

setprop bt.chip.type QTR8600
setprop bt.version Bluetooth:2.1+EDR
setprop bt.stack.type Bluez4.69
setprop bt.profiles.supported HFP1.5/HSP/SPP/OPP/PBAP/A2DP/AVRCP1.0
chmod 662 /dev/log/system
