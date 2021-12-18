## Just some useful info here

For scripts and config files specific to a distribution check branches  

### Nice flatpaks:

```
flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub com.anydesk.Anydesk com.bitwarden.desktop org.telegram.desktop com.github.johnfactotum.Foliate io.dbeaver.DBeaverCommunity com.valvesoftware.Steam
```

### Nice snaps:

- lxd
- pdfmixtool
- serve #starts a simple temp static file server
- shotcut
- obs-studio
- xonotic

### GNOME extensions:

Backslide [release](https://extensions.gnome.org/extension/543/backslide/) or [latest version](https://bitbucket.org/LukasKnuth/backslide)  
[Dash-to-dock](https://extensions.gnome.org/extension/307/dash-to-dock/)  
[Dynamic Top Bar](https://github.com/omicron-b/GnomeShell_DynamicTopBar) or [Dynamic Panel Transparency](https://github.com/rockon999/dynamic-panel-transparency)

### Cleaning up Debian non-free LXDE

```
sudo apt purge unattended-upgrades accountsservice wicd wicd-daemon xiterm+thai \
  khme* fcitx* mozc* scim kasumi itweb* ibus uim mlterm xterm x11-apps \
  task-*-desktop eject installation-report modemmanager mobile-broadband* \
  dahdi-firmware-nonfree default-jre*  firmware-adi firmware-amd-graphics \
  firmware-b* firmware-c* firmware-intel* firmware-ipv* firmware-ivtv \
  firmware-liber* firmware-my* firmware-n* firmware-q* firmware-ralink \
  firmware-s* firmware-t* firmware-z* freepats gnome-orca ingerman
```

## Debian 9 XFCE non-free packages

```
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install neofetch networkmanager steam git htop rsync xserver-xorg \
  xinit xsane system-config-printer mythes-en-us hyphen-en-us sysfsutils \
  libusbhid-common plymouth plymouth-themes bdf2psf debian-reference-common \
  fbterm gimp-help-common psf-unifont ttf-unifont unifont xfonts-unifont
sudo systemctl enable NetworkManager
sudo systemctl disable wicd
sudo apt purge wicd*
sudo dpkg-reconfigure locales #enable en_us_UTF-8
sudo apt install xfce4-power-manager #lxde does not have any, this one works fine
# run xfce4-power-manager once via menu, reboot, run again and set it up, replace battery indicator with a new one.
# graphical update manager and package manager (probably not compatible with backports):
sudo apt install gnome-packagekit gnome-packagekit-data software-properties-gtk
echo "deb http://deb.debian.org/debian stretch-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian stretch-backports main contrib non-free" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt -t stretch-backports upgrade
# to enable backports by default
echo "Package: *
Pin: release a=stretch-backports
Pin-Priority: 500" | sudo tee -a /etc/apt/preferences.d/stretch-backports
```

### Cleaning up Debian free GNOME

```
sudo apt purge eject installation-report modemmanager \
  mobile-broadband-provider-info gnome-klotski gnome-sudoku gnome-chess \
  gnome-taquin gnome-games gnome-tetravex gnome-todo gnome-weather \
  gnome-documents gnome-getting-started-docs gnome-user-docs \
  gnome-accessibility-themes gnome-maps gnome-online-miners gnome-robots \
  hitori five-or-more swell-foop four-in-a-row tali quadrapassel gnome-mines \
  aisleriot gnome-mahjongg libreoffice-draw libreoffice-impress rhythmbox \
  unattended-upgrades
```

## Debian 10 GNOME packages

```
sudo apt install calc catimg cups firejail flameshot fonts-ubuntu fzf gamemode \
  gimp git gnome-authenticator gnome-shell-extension-remove-dropdown-arrows \
  gnome-shell-extensions gnome-sound-recorder gnome-tweaks htop hyphen-en-us \
  hyphen-ru libreoffice-help-ru libreoffice-lightproof-en \
  libreoffice-lightproof-ru-ru mythes-en-us mythes-ru neofetch neomutt \
  obs-studio pdftk peek qemu-system-x86 remmina resolvconf rsync screen \
  shadowsocks-libev shotcut shotwell simple-scan smartmontools stress telnet \
  tesseract-ocr tesseract-ocr-rus traceroute transmission-gtk xdotool \
  wireguard youtube-dl command-not-found
sudo apt-file update
sudo update-command-not-found
# optional
sudo apt install tlp firmware-iwlwifi firmware-misc-nonfree \
  firmware-realtek network-manager-l2tp-gnome dnsutils tree
```

## How-To

`tr -d "\n\r" < input.txt > output.txt` # remove all newlines from file, be it Unix, Windows or Mac; `tr` can also be used to replace text and to remove repeating characters, newlines included.  
`tr -d "\r" < input.txt > output.txt` or `tr -d "\015" < input.txt > output.txt` # convert text file from DOS format (carriage return + line feed) to Unix (line feed).  
`sudo apt install pkg=version` # downgrading a package  
`sudo apt-mark auto pkg` # marking package as auto-installed (allow auto-removal)  
`ffmpeg -i long_video.mkv -ss 00:00:10.0 -c copy -to 01:30:30.0 output.mkv` # ffmpeg - copy part of video starting from 10 sec to 1 h 30 min 30 sec  
`find ./ -name "*\.png" -type f -print` # find and list files by part of filename  
`find ./ -name "*\.png" -type f -delete` # find and delete the same files  
`CAMEL_DEBUG=imapx:io evolution` # run Evolution with IMAP debugging output. [More info here.](https://wiki.gnome.org/Apps/Evolution/Debugging)  
`gsettings set org.gnome.evolution.mail composer-reply-keep-signature true` # fix Evolution cutting off quoted email after first signature  
`gsettings set org.gnome.mutter check-alive-timeout 0` # disable Mutter check-alive timeout  
`echo "nameserver 9.9.9.9" > $PREFIX/etc/resolv.conf` # change DNS server for Termux (Android app)  
`sudo ufw allow in to <internal-ip> port 80 from <external-ip> comment "HTTP"` # UFW syntax for incoming connections  
`sudo ufw allow in on eth0 from <external-ip>/24 comment "this network is ours"` # UFW syntax to allow all connections on interface `eth0`  
`sudo snap set system snapshots.automatic.retention=no` # disable snap making snapshots on snap removal  
`echo  -n  "1" | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode` # limit battery charge level by 60% on Lenovo laptops, recommended when always plugged in  
`sudo needrestart` # check if a Debian server needs a restart  
`sudo setfacl --recursive --modify user:<username>:rwX,default:user:<username>:rwX /home/<another_user>/<some_folder>` # grant all access to some_folder to username  

## Data recovery in case of a failing storage device

1) If possible, try to keep the device cool or cold  
2) If the device can still be mounted, mount it and copy the most important data  
3) Unmount the device and use ddrescue to copy device or partition byte by byte to a good device or partition,
while keeping a mapfile outside both devices  
`ddrescue /dev/sdx /dev/sdy mapfile`
4) Retry bad sectors as much as needed  
`ddrescue -d -r3 /dev/sdx /dev/sdy mapfile`
5) Disconnect the bad storage device  
6) Use at least 2 different recovery tools on the good device to try and recover as much data as possible  
- photorec (remember to manually select needed types of files)  
- foremost  
`sudo foremost -t jpg,png,avi,mp4 -i /dev/sdx -o ~/recovered`
7) Use find to delete irrelevant files depending on size and then sort them, some examples:  
```
# move jpg files with size above 1MB to a separate folder
find . -name '*.jpg' -type f -size +1000000c -exec mv {} /media/user/rec/pics_1MB_plus/ \;
# delete png files with size less then 37KB
find . -name '*.png' -type f -size -37000c -exec rm -f {} \;
# count mp4 files with size above 100KB
find . -name '*.mp4' -type f -size +100000c | wc -l
```
8) chown the data from root to user and use fslint (needs Debian 10, but also available as a snap) to remove duplicates
first only among files recovered by photorec and foremost, next among files copied manually and unique recovered files  

## Fix permissions in any folder with just data

```
find /location -type d -print0 | xargs -0 chmod 0755
find /location -type f -print0 | xargs -0 chmod 0644
```
[source](https://stackoverflow.com/a/18817767)

## Improve fonts in Debian GNOME

GNOME Tweaks -> Fonts  
Hinting: Slight  
Antialiasing: Subpixel (for LCD screens)  

## Enable Better blocker in GNOME Web
[see this link](https://ar.al/2018/07/17/enabling-better-blocker-in-gnome-web/)

## Find and tweak any GNOME settings

In this example, setting recently opened files list in gedit to 10.
```
gsettings list-recursively | grep gedit | grep max`
gsettings set org.gnome.gedit.preferences.ui max-recents 'uint32 10'`
```

## Customize Grub background in Debian

Priority:  
- `GRUB_BACKGROUND` line in `/etc/default/grub`  
- first image found in `/boot/grub/`  
- image specified in `/usr/share/desktop-base/grub_background.sh`  
- `WALLPAPER` line in `/etc/grub.d/05_debian_theme`  

## Do not show user on GDM login screen

[source](https://askubuntu.com/a/545764)  
- change `SystemAccount=true` to `SystemAccount=false` in `/var/lib/AccountsService/users/<username>`  

## SSH Tunneling and Reverse SSH Tunneling

Direct (example is for RDP, so the tunnel is open for all local network on 192.168.10.10):  
1) `ssh -L 192.168.10.10:3389:<rdp_server_ip>:3389 <linux_server_ip> -l <server_user> -N`  
2) connect to RDP on `192.168.10.10:3389`  

Reverse (using alternate syntax for server_user here):  
1) `ssh -R <any_free_port>:localhost:22 <server_user>@<linux_server_ip>`  
2) `top` to keep connection alive  
3) on server: `ssh localhost -p <free_port_used_above>`  

## SSH port forwarding

Example for connecting to SQL in a qemu VM  
`ssh -N -L 3306:127.0.0.1:3306 <server_user>@<linux_server_ip> -p 10022`  

## Compare 2 directories` contents using md5sum

`find somedir -type f -exec md5sum {} \; | sort -k 2 | md5sum`  
author: [Warren Young](https://unix.stackexchange.com/users/138/warren-young), [source](https://unix.stackexchange.com/questions/35832/how-do-i-get-the-md5-sum-of-a-directorys-contents-as-one-sum/35834#35834)  

## How to shrink a qemu virtual drive (qcow2, but should also work for other types)

```
# 1) backup the image
cp debian debian-backup
# 2) convert the image from qcow2 to raw
qemu-img convert -f qcow2 -O raw debian debian.raw
# 3) boot from live iso mounted as cdrom and raw image mounted as drive
qemu-system-x86_64 -machine type=pc,accel=kvm -boot order=d -drive file=debian.raw,format=raw -cdrom ~/Downloads/debian-live-9.6.0-amd64-lxde.iso -m 2G
# 4) use gparted (GUI) to resize (shrink) root partition and remember the new size, also leave some (100MB) free space so the system can still boot, especially if there is a swap file and low memory.
# tips on installing gparted in Debian live iso
# echo "deb http://deb.debian.org/debian/ stretch main non-free contrib" | sudo tee -a /etc/apt/sources.list.d/base.list
# apt update && apt install gparted -y
# 5) check the filesystem and shut down the VM
# fsck -a
# 6) optional: check if the VM boots from raw image
qemu-system-x86_64 -machine type=pc,accel=kvm -boot order=d -drive file=debian.raw,format=raw -m 2G
# 7) shrink the raw image to new size + a little extra (+1MB is usually enough)
qemu-img resize debian.raw 3.3G
# 8) convert from raw back to qcow2
qemu-img convert -f raw -O qcow2 debian.raw debian
#
# 8.5) as an additional step, if you want to ensure VM stability and allocate more space to virtual drive, at this point you can resize qcow2 image virtual size and this will not cause the actual size to grow, then do steps 9-11.
qemu-img resize debian +1G
#
# 9) optional: boot from live iso mounted as cdrom and qcow2 image mounted as drive again to allocate extra space resulting in step 7 or step 8.5 back to root partition. This will not increase the actual image file size.
qemu-system-x86_64 -machine type=pc,accel=kvm -boot order=d -drive file=debian,format=qcow2 -cdrom ~/Downloads/debian-live-9.6.0-amd64-lxde.iso -m 2G
# 10) optional: use gparted (GUI) to resize root partition
# 11) optional: check the filesystem and shut down the VM
# fsck -a
#
# Done! Delete raw image. You can use the VM for some time, then delete backup created at step 1.
```

## Inception-like LXD containers inside Ubuntu server inside baremetal desktop (for testing and breaking)

```
# 1) install Ubuntu server in a VM
# 2) example below to forward guest ports 80 to host 10080 and 22 to 10022, additionally port 9980 to 19980, and to automatically ssh into guest as it boots
qemu-system-x86_64 -cpu host -smp 4 -machine type=pc,accel=kvm -boot order=d -drive file=ubuntu-server,format=qcow2 -m 1G -net nic -net user,hostfwd=tcp::10022-:22,hostfwd=tcp::10080-:80,hostfwd=tcp::19980-:9980 -daemonize -display none; sleep 14; ssh localhost -p 10022
# 3) in Ubuntu, create and start lxd container with a web app
sudo apt install lxd
sudo lxd init
lxc launch ubuntu:18.04 container-name
# execute any command like
lxc exec container-name -- apt update
lxc exec container-name -- ls /etc/nginx/
# or access root shell
lxc exec container-name -- /bin/bash
# 4) on Ubuntu server set up port forwarding for port 80 into container
sudo iptables -t nat -A PREROUTING -p tcp -i ens3 --dport 80 -j DNAT --to-destination 10.135.149.200:80
# replace ens3 with your Ubuntu server network interface and 10.135.149.200 with container ip
# 5) save iptables config
sudo apt install iptables-persistent
sudo netfilter-persistent save
# 6) access a web app from host system (or any in the same network) via http://host-ip:10080
# 7) adding Collabora Online into the soup
lxc launch ubuntu:18.04 collabora
lxc config set collabora security.nesting true
lxc restart collabora
# 8) log into collabora and start its docker image, apply a fix to work without ssl certificate
# 9) ensure Collabora Online is available on desktop network (see also port forwarding in #2)
sudo iptables -t nat -A PREROUTING -p tcp -i ens3 --dport 9980 -j DNAT --to-destination 10.135.149.112:9980
sudo netfilter-persistent save
# replace ens3 with your Ubuntu server network interface and 10.135.149.112 with container ip
#10) log into Nextcloud, install Collabora configuration app and put http://host-ip:19980 in settings. Disable encryption. Enjoy your testing setup.
```

## Build GNOME Web (Epiphany) on Ubuntu 19.04

```
sudo apt install meson ninja-build libcairo2-dev gir1.2-gcr-3 libgcr-3-dev gsettings-desktop-schemas-dev \ 
libhogweed4 nettle-dev libjson-glib-dev libdazzle-1.0 libhandy-0.0 libnotify-dev libsecret-1-dev libsoup2.4-dev \ 
webkit2gtk-4.0 appstream-util python3 python3-pip python3-libxml2
sudo pip3 install itstool
mkdir build && cd build
meson ..
ninja
sudo ninja install 
#sudo ninja uninstall #to uninstall
```

## Quick overview of LEMP server setup for Nextcloud

1) Install php7.2-fpm and relevant modules, nginx, mariadb-server, mariadb-client, certbot (see Let`s Encrypt).  
2) Set correct system timezone.  
3) Set up nginx (for http, port 80), php (set same timezone), database (`sudo mysql_secure_installation`)  
4) Check permissions on `html/`, `/var/lib/php/session/`  
5) Reboot server  
6) `sudo nginx -t` to test config files, then restart & enable all 3 services and check if it seems to work (Nextcloud page opens).  
7) Change DNS settings to point to new installation, or attach new instance to static IP. Wait for changes.  
8) `sudo certbot --nginx` to install security certificate, manually review changes in `/etc/nginx/sites-available/default` and see if it looks good.  
9) `sudo nginx -t` to test, restart nginx if all looks good.  
10) Finish setup via Nextcloud web interface, do not forget to check security recommendations in Settings -> Overview and check also via scan.nextcloud.com  

## Various fixes

### GNOME Web can't play gifs

`sudo apt install gstreamer1.0-libav`

### Screen flickering after wakeup on Intel integrated video

Add `i915.enable_psr=0` to `/etc/default/grub` on line `GRUB_CMDLINE_LINUX_DEFAULT`  
Generate `/boot/grub/grub.cfg`  

### Performance

```
 sudo pacman -S cpupower
 sudo systemctl start cpupower
 sudo systemctl enable cpupower
 cpupower frequency-info
 cpupower frequency-set -g performance
# next is for Ubuntu derivatives only
 sudo rm /etc/init.d/ondemand
 reboot
```

### Manual GRUB themes

```
 dir=$prefix/themes/starfield #theme is here
 set theme=$dir/theme.txt     #path to theme.txt
 insmod regexp
 loadfont $dir/*.pf2          #load all fonts from theme
 insmod png
 set gfxmode=auto             #skip if was already set
 set lang=en                  #maybe not needed, should check later
 insmod gfxterm
 insmod vbe
 terminal_output gfxterm      #enable graphics
```

### Intel BayTrail issue

[source](https://bbs.archlinux.org/viewtopic.php?id=220716)  
If you are experiencing freezing issues on a baytrail CPU you are probably affected by the problem described in this topic.  
The issue seems to be about energy management when the system is running idle.  

There are 3 ways to help you at the moment:  

Disable c6-state. If you have grub, edit /etc/default/grub and add the parameter intel_idle.max_cstate=1 to your GRUB_CMDLINE_LINUX_DEFAULT. Then run grub-mkconfig -o /boot/grub/grub.cfg as root.  

Patch the kernel with this: [bugzilla.kernel.org/attachment.cgi?id=254971](https://bugzilla.kernel.org/attachment.cgi?id=254971&action=edit) according to [bugzilla.kernel.org/show_bug.cgi?id=109051](https://bugzilla.kernel.org/show_bug.cgi?id=109051)  

Use the baytrail custom kernel from aur: [aur.archlinux.org/packages/?K=linux-baytrail](https://aur.archlinux.org/packages/?O=0&SeB=nd&K=linux-baytrail&outdated=&SB=n&SO=a&PP=50&do_Search=Go)  

It seems WiFi can cause issues. Try using only a wired connection (to do a pacman -Syu for example).  

### DKMS removing modules

Only works when stating full version, example below.  
- `sudo dkms remove rtl8821au/5.1.5.r59.gaf07b27 -k 4.17.10-1-ARCH`  

### Stop Ubuntu from updating Grub and UEFI entry (will break release upgrades)

```
sudo rm /etc/kernel/postinst.d/zz-update-grub
sudo chmod -x /etc/grub.d/*
sudo chmod -x /usr/sbin/update-grub
sudo chmod -x /usr/sbin/update-grub2
```

### Workaround for GNOME bug: audio muted on boot

- `sudo pacman -S alsa-utils`  
- set preferred default audio volume  
- `sudo alsactl store`  

### How to almost set up Bluetooth auto connect and auto switch (more GNOME bugs)

```
sudo usermod -a -G lp $USER
sudo usermod -a -G wheel $USER
sudo pacman -S pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils
sudo systemctl enable bluetooth
sudo nano /etc/pulse/default.pa
# add the following lines after "load-module module-switch-on-port-available"
# #automatically switch to newly-connected devices
# load-module module-switch-on-connect
#
# When using GDM, another instance of PulseAudio is started, which "captures" your bluetooth device connection. This can be prevented by masking the pulseaudio socket for the GDM user by doing the following:
sudo mkdir -p  /var/lib/gdm/.config/systemd/user
sudo ln -s /dev/null  /var/lib/gdm/.config/systemd/user/pulseaudio.socket
reboot
# use GNOME gui to pair the device
# on next boot, GNOME will autoconnect to device (if you login before the device is on) and will try to switch the audio, but fail. Switch back and forth to it manually, and it is done.
# the bug exists on Arch Linux (11-01-2019) and Ubuntu 18.04
```

### Fractional scaling with HiDPI in GNOME

Option 1: scale only text: `gsettings set org.gnome.desktop.interface text-scaling-factor 1.5`  
Option 2: real fractional scaling: [ArchWiki](https://wiki.archlinux.org/index.php/HiDPI#Fractional_Scaling)  
Option 3: Ubuntu 19.04 experimental feature: `gsettings set org.gnome.mutter experimental-features "['x11-randr-fractional-scaling']"`  

### When using GNOME and GnuPG, pinentry may use wrong frontend

This could be fixed with a [config file](https://wiki.archlinux.org/index.php/GnuPG#pinentry)  
Another option is to copy `/usr/bin/pinentry` to `/usr/local/bin/pinentry` (the later should be first in $PATH) and edit to specify correct backend:
```
#!/bin/sh
exec /usr/bin/pinentry-gnome3  "$@"
```

### Running qemu in Ubuntu 18.04

```
sudo usermod -a -G kvm $USER
sudo reboot
```

### Hang on poweroff or shutdown

Some processes or daemons may refuse to be shutdown and the timeout to kill them is 90 seconds by default.  
Edit `/etc/systemd/system.conf` to change that timeout.  
Start timeout could also be changed, otherwise the system may spend 90 second to try mounting a drive.  

### Enabling Wine esync on Arch Linux (used in SteamPlay's Proton)

[source](https://github.com/zfigura/wine/blob/esync/README.esync)  
For Arch Linux it is enough to edit `/etc/systemd/system.conf` and `/etc/systemd/user.conf`  
Set `DefaultLimitNOFILE=1048576`  
Reboot and use `ulimit -Hn` to check  
For Ubuntu based distributions changes are not needed.  

### Ubuntu 18.04 server MOTD says if failed to connect to https://changelogs.ubuntu.com/...
1) try cleaning cache: `sudo rm -rf /var/lib/ubuntu-release-upgrader/release-upgrade-available`
2) if this does not help, examine the following scripts to see which fails
```
/etc/update-motd.d/91-release-upgrade
/usr/lib/ubuntu-release-upgrader/release-upgrade-motd
/usr/lib/ubuntu-release-upgrader/check-new-release
```

### Fedora Server 29 throws errors about locales after being moved to specific cloud

Example:
```
$ locale
locale: Cannot set LC_CTYPE to default locale: No such file or directory
locale: Cannot set LC_MESSAGES to default locale: No such file or directory
locale: Cannot set LC_ALL to default locale: No such file or directory
```
Fix:
```
sudo dnf install glibc-locale-source
sudo localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
sudo localedef -v -c -i ru_RU -f UTF-8 ru_RU.UTF-8
```

### Some versions of systemd-journald consume too much RAM

Edit `/etc/systemd/journald.conf` to limit `SystemMaxFileSize` to 10MB

### Too much spam from Ubuntu cloud image

```
sudo chmod -x /etc/update-motd.d/10-help-text
sudo chmod -x /etc/update-motd.d/50-motd-news
sudo chmod -x /etc/update-motd.d/51-cloudguest
sudo chmod -x /etc/update-motd.d/80-livepatch
```

### Games

1) Torchlight II - can not launch from Steam, but can launch from game directory

- Edit launch options: `LD_PRELOAD=~/.local/share/Steam/ubuntu12_32/steam-runtime/amd64/usr/lib/x86_64-linux-gnu/libfontconfig.so.1 %command%`

2) System Shock 2 beta (wine wrapped) (not linux_beta) - can not launch from Steam

- Option 1: use Proton, [it is recommended by those who packaged the game](https://github.com/ValveSoftware/Proton/issues/3252#issuecomment-558772591).

- Option 2: the game looks for `Shock2.exe` in `~/.systemshock2/systemshock2/drive_c`. Copy the existing exe from `~/.systemshock2/systemshock2/drive_c/Program Files/SystemShock2/SS2.exe` or `~/.systemshock2/systemshock2/drive_c/Program Files/SystemShock2/Shock2.exe` or `<steam-library>/steamapps/common/SS2/support/systemshock2/drive_c/Program Files/SystemShock2/Shock2.exe` and to where it looks for.

3) Elder Scrolls III: Morrowind and Elders Scrolls IV: Oblivion needs mp3 support (as of 2019, Steam provides that).
- `sudo pacman -S lib32-mpg123` or `sudo apt install libmpg123-0:i386`

4) Elder Scrolls V: Skyrim Special Edition - no sound in dialogs, some scripts are broken.
- `sudo pacman -S faudio` or `sudo apt install libfaudio0`
- Edit launch options: `LD_PRELOAD=/usr/lib/libFAudio.so %command%` or `LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libFAudio.so.0 %command%`

5) Hexen II needs a [custom engine](https://sourceforge.net/projects/uhexen2/files/Hammer%20of%20Thyrion/).

6) F.E.A.R. Platinum (GOG.com) - no sound.
- `sudo pacman -S lib32-mpg123 lib32-libpulse` or `sudo apt install libmpg123-0:i386 libpulse0:i386`

7) Wine throws error about OpenAL.
- `sudo pacman -S lib32-openal` or `sudo apt install libopenal1:i386`

8) Some older games, like STAR WARS™ Jedi Knight ones from 2003, require `__GL_ExtensionStringVersion=17700` or Proton's alternative `PROTON_OLD_GL_STRING=1` variable to run.

9) Ziggurat won't start on Arch, Debian Testing.

- Use Steam Linux Runtime (select it in game properties).

10) Bioshock Infinite bad textures aka "texture popping".

- Either find XEngine.ini and increase pool size to 2000 or more depending on total VRAM
- or set `-DisableTexturePool` in launch options.

### Fixes for nginx and Wordpress

1) If server IP or URL has changed after initial WP installation, edit `wp-config.php`:
```
define('WP_HOME','http://new-ip-or-url/');
define('WP_SITEURL','http://new-ip-or-url/');
```

2) To install WP updates and themes without FTP access, edit `wp-config.php`:
```
define('FS_METHOD', 'direct');
```
and make sure user `www-data` owns `html` recursively.

3) Always create a separate Mariadb user and database for WP to avoid root unix socket authorization.

4) To solve nginx error 413 when uploading files, edit `/etc/nginx/sites-available/your-website`:
```
client_max_body_size 4m;
```

5) For consistency, edit `/etc/php/7.2/fpm/php.ini`:
```
upload_max_filesize = 4M
```

### Removing duplicate Debian menu entries

```
sudo rm -rf /var/lib/menu-xdg/*
```

### Installing KX-MB1500 printer and scanner driver

```
#Debian 10
sudo apt install cups
sudo ln -s /usr/lib/x86_64-linux-gnu/libgs.so.9 /usr/lib/libgs.so
sudo ln -s /usr/lib/x86_64-linux-gnu/sane /usr/lib/sane
sudo cp ./etc/udev/rules.d/55-panamfs-libsane.rules /etc/udev/rules.d/55-panamfs-libsane.rules
sudo ./install-driver #twice, for both printer and scanner
sudo reboot

#Arch Linux
sudo usermod -a -G sys $USER
sudo usermod -a -G lp $USER
sudo usermod -a -G cups $USER
sudo usermod -a -G scanner $USER
#log out and log in
sudo ./install-driver #twice, for both printer and scanner
#ignore /etc/init.d errors
sudo cp ./etc/udev/rules.d/55-panamfs-libsane.rules /etc/udev/rules.d/55-panamfs-libsane.rules
reboot
yay -S system-config-printer cups simple-scan
sudo systemctl enable --now org.cups.cupsd.socket
#run system-config-printer and add printer
yay -Rs system-config-printer
```

### pyodbc in Ubuntu 18.04 and Arch Linux to connect to MS SQL

#### Ubuntu

```
sudo apt install unixodbc unixodbc-dev freetds-dev tdsodbc python3-dev
pip3 install --user pyodbc
sudo cat >/etc/odbcinst.ini <<EOL
[ODBC]
Trace = Yes
TraceFile = /tmp/odbc.log
[FreeTDS]
Description = TDS driver (Sybase/MS SQL)
Driver = /usr/lib/x86_64-linux-gnu/odbc/libtdsodbc.so
Setup = /usr/lib/x86_64-linux-gnu/odbc/libtdsS.so
UsageCount = 1
EOL
#file ends
```

- Optional dns records and predefined servers

```
sudo cat >/etc/odbc.ini <<EOL
[srv1]
Description=srv1
Driver=FreeTDS
Servername=srv1
Driver=path_to_driver.so
[srv2]
Description=srv2
Driver=FreeTDS
Servername=srv2
Driver=path_to_driver.so
EOL
#file ends
sudo cat >/etc/freetds/freetds.conf <<EOL
[global]
tds version = 8.0
port = 1433
; timeout = 10
; connect timeout = 10
try server login = yes
try domain login = no
client charset = UTF-8
# If you get out-of-memory errors
text size = 64512
[srv1]
host = 192.168.0.1
port = 1433
tds version = 8.0
EOL
#file ends
```

#### Arch Linux

```
sudo pacman -S unixodbc freetds python-pyodbc
sudo cat >/etc/odbcinst.ini <<EOL
[ODBC]
Trace = Yes
TraceFile = /tmp/odbc.log
[FreeTDS]
Description = TDS driver (Sybase/MS SQL)
Driver = /usr/lib/libtdsodbc.so
UsageCount = 1
EOL
#file ends
```
