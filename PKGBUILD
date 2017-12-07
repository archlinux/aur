# Maintainer: Radu Birzu <radu@webative.net>
pkgname=andrei-desktop
pkgver=r241.b85d070
pkgrel=1
pkgdesc="An openbox based desktop environment focused on productivity and speed"
arch=('any')
url="https://gitlab.com/webative-open-source/andrei-linux"
license=('GPL3')
depends=('acl' 'acpi' 'acpid' 'adapta-gtk-theme-git' 'adapta-backgrounds' 'albert' 'alsa-utils' 'ananicy-git' 'arch-install-scripts' 'audacious' 'avahi' 'bluez' 'blueman' 'bluez-libs' 'bluez-utils' 'brightside' 'compton' 'conky' 'crda' 'cronie' 'cups' 'cups-filters' 'dkms' 'dnsmasq' 'dunst' 'evince' 'ffmpegthumbnailer' 'file-roller' 'firefox' 'fish' 'fortune-mod' 'fuseiso' 'galculator' 'gconf-editor' 'git' 'gksu' 'gnome-icon-theme-extras' 'gnome-keyring' 'gnome-logs' 'gnome-screenshot' 'gnome-system-monitor' 'gparted' 'gpointing-device-settings' 'gptfdisk' 'gufw' 'gvfs-mtp' 'gvfs-smb' 'haveged' 'hdparm' 'htop' 'intel-ucode' 'inxi' 'leafpad' 'lib32-alsa-plugins' 'lib32-libpulse' 'libva-intel-driver' 'libva-mesa-driver' 'linux-zen' 'linux-zen-headers' 'lm_sensors' 'lshw' 'lsof' 'lxdm' 'lxdm-themes' 'lxappearance-obconf' 'lxinput' 'lxpolkit-git' 'lxrandr' 'mhash' 'mlocate' 'mobile-broadband-provider-info' 'modemmanager' 'most' 'mplayer' 'networkmanager' 'network-manager-applet' 'networkmanager-openvpn' 'networkmanager-pptp' 'nmap' 'nmon' 'nss-mdns' 'ntfs-3g' 'obconf' 'oblogout' 'obmenu' 'openbox' 'openssh' 'openvpn' 'osmo' 'p7zip' 'pamac-aur' 'paman' 'paper-icon-theme' 'paprefs' 'parcellite' 'pavucontrol' 'pavumeter' 'pcmanfm' 'pepper-flash' 'perl' 'php' 'pkgfile' 'plank' 'plank-theme-arc' 'powertop' 'pulseaudio' 'pulseaudio-alsa' 'pulseaudio-bluetooth' 'pulseaudio-ctl' 'python2-notify' 'python2-pyqt4' 'python2-xdg' 'redshift' 'rsync' 'sakura' 'samba' 'screen' 'seahorse' 'skippy-xd-git' 'sox' 'sshfs' 'systemd-ui' 'tint2' 'ttf-dejavu' 'ttf-freefont' 'ttf-ms-fonts' 'ttf-roboto' 'unrar' 'unzip' 'usb_modeswitch' 'viewnior' 'vim' 'vim-colorsamplerpack' 'vim-ctrlp' 'vim-fugitive' 'vim-supertab' 'vim-systemd' 'vim-vcscommand' 'volumeicon' 'wget' 'whois' 'wol' 'x11vnc' 'xautolock' 'xclip' 'xdg-user-dirs' 'xdotool' 'xlockmore' 'xorg-server' 'xorg-xbacklight' 'xsel' 'zenity' 'zip')
optdepends=('acetoneiso2: An all in one ISO tool'
	          'aisleriot: A collection of patience games'
	          'bleachbit: Deletes unneeded files to free disk space and maintain privacy'
	          'chromium: A web browser built for speed, simplicity, and security'
	          'filezilla: Fast and reliable FTP, FTPS and SFTP client'
	          'fortune-mod-all-en: Collections of quotes for fortune program'
	          'gimp: GNU Image Manipulation Program'
	          'inkscape: Professional vector graphics editor'
	          'keepassx: Password manager'
	          'libreoffice-fresh: Free office suite'
	          'meld: Compare files, directories and working copies'
	          'playonlinux: GUI for managing Windows programs under linux'
	          'redsocks: Transparent redirector for socksify'
	          'remmina: remote desktop client written in GTK+'
	          'safeeyes: A Free and Open Source tool for Linux users to reduce and prevent repetitive strain injury (RSI)'
	          'simple-scan: Simple scanning utility'
	          'synergy: Share a single mouse and keyboard between multiple computers'
	          'thunderbird: Standalone mail and news reader from mozilla.org'
	          'transmission-qt: Fast, easy, and free BitTorrent client'
	          'vlc: Multi-platform MPEG, VCD/DVD, and DivX player'
	          'zim: A WYSIWYG text editor for a desktop wiki')
makedepends=('tar' 'rsync')
install="${pkgname}.install"
source=('git+https://gitlab.com/webative-open-source/andrei-linux.git')
md5sums=('SKIP')

package() {
	cd "$srcdir/andrei-linux/"
	tar xf files.tar

	# copy files preserving timestamps
	rsync -a ./files/ "$pkgdir/"
}
