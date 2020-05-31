# Battery charge notify

### This script detects current battery charge and notifies user if it exceeds set persentage and battery is charging.
Some laptop manufacturers advice to keep your battery constantly charged at 55-60% if you are plugged in for a full day. We can not do this on Linux, but we can notify user if the charge exceeds some set limit.  

Installation:  
0) Check that your laptop has below files to read from:

    ```
    /sys/class/power_supply/BAT0/energy_full
    /sys/class/power_supply/BAT0/energy_now
    /sys/class/power_supply/BAT0/status
    ```
1) Install `mpv` and `calc` (`apcalc` in Ubuntu)  
2) Replace charge target percentage to notify of in script to your preference, default is 55  
3) Place the script where you prefer, e.g. `/usr/local/bin/`  
4) Optionally create log file and change log owner to user (see script comments for more info)  
5) Script contains crontab record example. Set up crontab for user, e.g. `crontab -e`  
