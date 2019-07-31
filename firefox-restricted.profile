# Mozilla Firefox
whitelist ${HOME}/Downloads
whitelist ${HOME}/downloads

whitelist ${HOME}/.cache/gtk-3.0
whitelist ${HOME}/.cache/mozilla/firefox

whitelist ${HOME}/.config/fontconfig/fonts.conf
whitelist ${HOME}/.config/kdeglobals
whitelist ${HOME}/.config/pulse
whitelist ${HOME}/.config/user-dirs.dirs
whitelist ${HOME}/.config/user-dirs.locale

whitelist ${HOME}/.local/share/icons
whitelist ${HOME}/.local/share/mime
whitelist ${HOME}/.local/share/sounds

noblacklist ${HOME}/.mozilla
whitelist ${HOME}/.mozilla

whitelist ${HOME}/.nv
whitelist ${HOME}/.mime.types

noblacklist /run/dbus
noblacklist /run/firejail
noblacklist /run/systemd
noblacklist /run/udev
noblacklist /run/user
blacklist /run/.*
blacklist /run/*

blacklist /boot
blacklist /mnt
blacklist /opt
blacklist /root
blacklist /srv

caps.drop all
seccomp.drop @clock,@cpu-emulation,@debug,@module,@obsolete,@raw-io,@reboot,@resources,@swap,acct,add_key,bpf,fanotify_init,io_cancel,io_destroy,io_getevents,io_setup,io_submit,ioprio_set,kcmp,keyctl,mount,name_to_handle_at,nfsservctl,ni_syscall,open_by_handle_at,personality,pivot_root,process_vm_readv,ptrace,remap_file_pages,request_key,setdomainname,sethostname,syslog,umount,umount2,userfaultfd,vhangup,vmsplice
protocol unix,inet,inet6,netlink
netfilter
noroot

include /etc/firejail/whitelist-common.inc
include /etc/firejail/disable-devel.inc
