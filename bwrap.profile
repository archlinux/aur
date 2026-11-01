#include <tunables/global>

/usr/bin/bwrap flags=(complain,attach_disconnected) {
  #include <abstractions/base>

  change_profile -> "/usr/bin/bwrap//&makepkg-jail-build",
  userns,
  
  capability sys_admin,
  capability sys_chroot,
  capability setuid,
  capability setgid,
  capability net_admin,
  capability setpcap,
  capability sys_ptrace,
  
  @{PROC}/@{pid}/uid_map rw,
  @{PROC}/@{pid}/gid_map rw,
  @{PROC}/@{pid}/setgroups rw,
  
  /usr/bin/bwrap mr,
  /usr/lib/** mr,
  /** r,
  
  deny /usr/** w,
  deny /etc/** w,
  deny /boot/** w,
  deny /var/lib/** w,
  deny @{HOME}/.ssh/** rw,
  deny @{HOME}/.gnupg/private-keys-v1.d/** rw,
  deny @{HOME}/.config/gh/** rw,
  deny @{HOME}/.aws/** rw,
  deny @{HOME}/.cargo/credentials.toml rw,
  
  @{HOME}/.cache/paru/clone/** rw,
  @{HOME}/.cache/makepkg-jail/** rw,
  
  /usr/bin/makepkg ix,
  /usr/bin/** ix,
  /bin/** ix,
  /{usr/,}lib/** ix,
  /work/** mrix,
}
