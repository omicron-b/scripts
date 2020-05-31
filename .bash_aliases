### alias for upgrading nextcloud web server
alias next-upgrade="~/scripts/next_updater.sh"
###
### alias for https://github.com/jhspetersson/fselect
alias select='~/.cargo/bin/fselect'
###
### aliases for AWS Cli
alias get-instances='aws lightsail get-instances'
alias next-snapshot-now='aws lightsail create-instance-snapshot \
	--instance-snapshot-name $(date +%F-%H-%M-%S) --instance-name nextcloud-40'
alias next-delete-snapshot='aws lightsail \
	delete-instance-snapshot --instance-snapshot-name'
alias next-list-snapshots='aws lightsail get-instance-snapshots | \
	grep -E "name|state"'
### ~~~ ###
alias cld='ssh mycloud.example.com'
alias decrypt='gpg -d --no-symkey-cache encrypted.txt.asc | less'
alias ls="ls --color=auto"
alias sys='~/dev/sys_info/s_info'
alias status="cat ~/python-web-tools/error.log && \
	ls -Gn ~/python-web-tools/* | grep 'lockfile'"
alias fail2banlog='tail /var/log/fail2ban.log'
alias authlog='tail /var/log/auth.log'
alias authlog-grep='grep -r "Invalid user" /var/log/auth* | sort'
alias syslog='tail /var/log/syslog'
alias server-state='systemctl status danted fail2ban nginx php7.2-fpm \
	mariadb | grep -B 3 'Active.*''
alias quit-skyrim='pkill -fi --signal 9 tesv'
alias saves-backup='cd "$(cat ~/skyrim_path)" && cp -prv Saves/ ~ && cd'
# next one runs a VM without any window, detached from terminal, available via ssh on port 10022
alias arch='qemu-system-x86_64 -cpu host -smp 4 -machine type=pc,accel=kvm \
	-boot order=d -drive file=dev/arch,format=qcow2 -m 500M -net \
	user,hostfwd=tcp::10022-:22 -net nic -daemonize -display none'
alias snapshot='sudo btrfs subvolume snapshot / /snapshots/$(date +%Y-%m-%d)'
alias grubmk='sudo grub-mkconfig -o /boot/grub/grub.cfg && \
	sudo sed "s/echo	/#echo	/" /boot/grub/grub.cfg > ~/grub.tmp && \
	sudo mv /boot/grub/grub.cfg /boot/grub/grub.cfg-backup && \
	sudo mv ~/grub.tmp /boot/grub/grub.cfg'
alias vs-update='rm -rf /opt/vscodium/* && \
	tar -xf ~/Downloads/VSCodium-linux-x64-*.tar.gz -C /opt/vscodium/ && \
	rm ~/Downloads/VSCodium-linux-x64-*.tar.gz'
alias t='/opt/timer'
alias dd='/opt/dd'
