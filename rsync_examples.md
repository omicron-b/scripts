## rsync Examples

sync Firefox config with $HOME if it is installed as snap  

`rsync -aAXv --progress ~/snap/firefox/common/.mozilla ~ --delete`

or if it is installed as flatpak  

```
rsync -aAXv --progress ~/.var/app/org.mozilla.FirefoxNightly/.mozilla ~ \
--delete
```

##### simple home rsync

```
rsync -aHAXvn --exclude={"debian*",".steam",".local/share/Steam","dev",\
"Games",".gvfs",".cache",".tor-browser","tor-browser*",".config/enchant",\
".dbus",".mozilla/firefox/*/Cache",".mozilla/firefox/*/cache",\
".config/Code*/Cache*",".config/chromium",".config/google-chrome*",\
".config/libreoffice/*/cache",".config/rpcs3/RPCS3.log*",\
".local/share/flatpak/repo/tmp",".local/share/baloo",\
".local/share/TelegramDesktop",".local/share/Trash",".nv",".wine","snap",\
".var",".mysql_history",".cargo",".config/Keybase/Cache","grand-pics*"} \
--progress -e ssh ~ \
192.168.1.1:/opt/backups/home_backup_$(date +%Y-%m-%d) --delete
```

##### backing up only root partition:

```
sudo rsync -aHAXvn --exclude={"/proc/*","/var/log/*","/dev/*","/sys/*",\
"/mnt/*","/tmp/*","/run/*","/media/*","/home/*"} \
--progress / /mnt/Backup/root --delete
```

back up website on remote server to upload via git after that  
website.wordpress contains personal data backup (posts)  

```
rsync -aAXvn --exclude={".git",".gitignore","website.wordpress*"} --progress \
website.com/ website.com-back --delete
```

### Do not make $HOME backup as root. If some files/folders permissions are denied, this is meant to be, for example some links may lead to root filesystem.

`-aHAXv` - preserve files ownership, attributes, hard links + verbose  
`-n` - fake, won't do anything - good for testing  
`--delete` - removes old files from backup while syncing, should be the last
argument in some cases  
`--exclude={"PATTERN","PATTERN"}` - exclude specific files/folders. when
excluding folder do not use "/" in the end, otherwise it will still try to
create empty folder  
`--log-file=$HOME/rsync.log` - save log  

### Router specific instructions

for Keenetic Router opkg package needs to be installed:
https://forum.keenetic.net/topic/4299-entware/  
prepare hdd: either format without metadata_csum feature:
`sudo mke2fs /dev/sdX1 -O ^metadata_csum`  
or disable it for already formatted partition:
`sudo tune2fs -O ^metadata_csum /dev/sdX1`  
then mount and unmount the drive on your laptop\desktop  
create folder "install", put files mips-installer.tar.gz and
mipsel-installer.tar.gz, connect the drive  
router will automatically create Linux instance on drive, system log will show
"SSH available now". user root, default password 'keenetic', default port 22  
connect via ssh, change password: `passwd`  
opkg update && opkg install rsync  

using dropbear as ssh client is different from openssh
(credits to https://yorkspace.wordpress.com/2009/04/08/using-public-keys-with-dropbear-ssh-client/)
1) generate a key
`dropbearkey -t rsa -f .ssh/id_rsa`
2) grep openssh pubkey from dropbear key, copy it to hosts
`dropbearkey -y -f .ssh/id_rsa | grep "^ssh-rsa " > .ssh/dropbear_id_rsa.pub`
3) each time you run rsync or ssh you need to provide the key, e.g.
```
ssh 192.168.1.100 -i .ssh/id_rsa
rsync -aAXvn --delete --exclude={"dev",".gvfs",".cache",".tor-browser",\
"tor-browser*",".config/enchant",".dbus",".mozilla",".config/chromium",\
".local/share/flatpak/repo/tmp",".local/share/baloo",".nv"} \
--progress -e "ssh -i .ssh/id_rsa" \
myserver.com:/home/username/ /opt/backups/myserver-home
```
