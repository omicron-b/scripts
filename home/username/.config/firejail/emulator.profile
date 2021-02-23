# Firejail profile for Android Emulator
# Description: Android Emulator from Google

include disable-common.inc
include disable-passwdmgr.inc
include disable-programs-android.local

noblacklist ${HOME}/Android/
noblacklist ${HOME}/.android/
noblacklist ${HOME}/.config/Android Open Source Project
noblacklist ${HOME}/.localAndroid Open Source Project

whitelist ${HOME}/Android/
whitelist ${HOME}/.android/
whitelist ${HOME}/.config/Android Open Source Project
whitelist ${HOME}/.local/Android Open Source Project

caps.drop all
netfilter
nodvd
nogroups
nonewprivs
noroot
notv
protocol unix,inet,inet6
seccomp
shell none
tracelog

private-cache
private-tmp

noexec /tmp
