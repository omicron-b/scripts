#!/bin/bash
# this will set the timeout for screensaver to 0 (thus disabling it) via X user pref utility
# in Xfce, Power manager may fail to disable screensaver,
# and it's settings will be ignored because screensaver kicks in earlier
xset s off
