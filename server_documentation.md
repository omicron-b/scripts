# Lightsail server 1

### Changes to default config

- dpkg-reconfigure tzdata
- renamed user id 1000, added to group sudo, set password
- purge unattended-upgrades
- purge snapd
- limit journald log size
- open ports 22,80,443
- ~~enable swap with minimal swappiness (1)~~
- use OpenDNS in etc/systemd/resolved.conf
- [secure the access: add at least one more key, back it up, and disable web ssh](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-securing-linux-unix-amazon-ec2-instances)

### Tasks

- Nextcloud, Linuxgaming (php7.2-fpm.service, nginx.service, mariadb.service)
- `reminder.py` (crontab)
- `stat-check.py` (crontab)
- `api-check.py` (crontab)
- `rss-mailer.py` (crontab)
- `usr/bin/ffmpeg` (crontab) to get some info from camera
- fail2ban

### Backups

- selected files from `etc` (manually to omicron-b/scripts.git)
- Nextcloud user data (manually (rsync) to btrfs partition from server (see .bash_aliases))
- Linuxgaming except user data, cache and config (manually to somewhere private)
- `$HOME` (manually (rsync) to btrfs partition)

# Lightsail server 2

### Changes to default config

- dpkg-reconfigure tzdata
- renamed user id 1000, added to group sudo, set password
- purge unattended-upgrades
- purge snapd
- open ports 80,443,53,853 for limited IPs
- open port for Project Z, Project S
- [secure the access: add at least one more key, back it up, and disable web ssh](https://lightsail.aws.amazon.com/ls/docs/en_us/articles/amazon-lightsail-securing-linux-unix-amazon-ec2-instances)

### Tasks

- Project Z
- Project S
- fail2ban
- Core DNS

### Backups

- none
