#!/bin/bash
case $1 in
--patch-config)
unset patched
grep realmd-arch-helper.sh /usr/lib/realmd/realmd-distro.conf > /dev/null && patched=1
[ $patched ] && echo "realmd distro config already patched" && exit 0
sed -i '/commands/a sssd-enable-logins = /usr/lib/realmd/realmd-arch-helper.sh --enable-pam-nss' /usr/lib/realmd/realmd-distro.conf
sed -i '/commands/a sssd-disable-logins = /usr/lib/realmd/realmd-arch-helper.sh --disable-pam-nss' /usr/lib/realmd/realmd-distro.conf
sed -i '/commands/a sssd-enable-service = /usr/bin/systemctl enable sssd' /usr/lib/realmd/realmd-distro.conf
sed -i '/commands/a sssd-disable-service = /usr/bin/systemctl disable sssd' /usr/lib/realmd/realmd-distro.conf
echo "Patched realmd distro config, restarting sssd if installed"
if pacman -Q sssd &>/dev/null; then
    /usr/bin/systemctl restart sssd || echo "WARNING: failed to restart sssd"
fi
;;
--enable-pam-nss)
cat << EOF > /etc/pam.d/sssd-arch
auth sufficient pam_sss.so forward_pass
password sufficient pam_sss.so use_authtok
session required pam_mkhomedir.so skel=/etc/skel/ umask=0077
session optional pam_sss.so
EOF
unset pam
grep sssd-arch /etc/pam.d/system-auth > /dev/null && pam=1
[ $pam ] && echo "SSSD for PAM already enabled"
[ ! $pam ] && sed -i '2 i session include sssd-arch' /etc/pam.d/system-auth
[ ! $pam ] && sed -i '2 i password include sssd-arch' /etc/pam.d/system-auth
[ ! $pam ] && sed -i '2 i auth include sssd-arch' /etc/pam.d/system-auth
grep sssd-arch /etc/pam.d/system-auth > /dev/null && pam=1
[ $pam ] && echo "Enabled SSSD in PAM"

unset nss
grep sss /etc/nsswitch.conf > /dev/null && nss=1
[ $nss ] && echo "SSSD already enabled in NSS"
[ ! $nss ] && sed -i '/passwd:/s/$/ sss/' /etc/nsswitch.conf
[ ! $nss ] && sed -i '/group:/s/$/ sss/' /etc/nsswitch.conf
[ ! $nss ] && sed -i '/shadow:/s/$/ sss/' /etc/nsswitch.conf
grep sss /etc/nsswitch.conf > /dev/null && nss=1
[ $nss ] && echo "Enabled SSSD in NSS"

;;

--disable-pam-nss)
sed -i '/sssd-arch/d' /etc/pam.d/system-auth
sed -i 's/sss//g' /etc/nsswitch.conf
echo "Disabled SSSD in PAM and NSS"
;;

*)
cat << EOF
Script to prepare realmd and realmd-git AUR packages to succesfully join a domain.
Run with --patch-config before joining
Valid options:
--patch-config
--enable-pam-nss
--disable-pam-nss
EOF
;;
esac