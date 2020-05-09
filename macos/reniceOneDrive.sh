#!/bin/bash
### Setting the app OneDrive to use low priority of CPU
#
#  @dbuenosilva - 09 May 2020
#
#  renice defines the priority from low(20) to high (-20). Yes -20 the highest performance :)
#
for f in $(pgrep 'Backup and Sync'; pgrep 'OneDrive'); 
do renice +20 -p $f; 
echo "Set process PID " + $f + " to priority according to "
ps -fl -C $f
done
#
#  ALL Applications are defaulted to renice equals to 0
#  Then, in case the need to set back to normal, just renice 0 to the app
#
# for f in $(pgrep 'Backup and Sync'; pgrep 'OneDrive'); do renice 0 -p $f; done
#
# Checking current priority:
# ps -fl -C $PID
