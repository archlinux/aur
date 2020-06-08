# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: matoro <matoro@airmail.cc>
# Contributor: hashworks <mail@hashworks.net>

pkgname=i3blocks-contrib
pkgver=1.4.0
pkgrel=3
pkgdesc="Community-contributed blocklets for i3blocks"
arch=('any')
groups=('i3')
url="https://github.com/vivien/i3blocks-contrib"
license=('GPL3')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('84148bf8f514de3b3dcaedeb5621e9640f96423d06759b7072507a15d0b6337f')

# Please keep those ordered by script-name. Packages for more than 2 scripts go on top
optdepends=('coreutils: For some scripts'
            'python3: For some scripts'
            'perl: For some scripts'
            'ttf-font-awesome: For some scripts'
            'awk: For some scripts'
            'glibc: For some scripts'
            'iproute2: For some network scripts'
            'openafs: For afs script'
            'pacman-contrib: For arch-update script'
            'python-requests: For aur-update script'
            'libnotify: For aur-update script'
            'acpi: For battery scripts'
            'yad: For calendar script'
            'xdotool: For calendar script'
            'sysstat: For cpu_usage & disk-io script'
            'docker: For docker script'
            'python-keyring: For email script'
            'gnome-keyring: For email script'
            'wireless_tools: For essid script'
            'nvidia-settings: For gpu-load script'
            'xorg-setxkbmap: For key_layout script'
            'procps-ng: For keyindicator script'
            'kubectl: For kubernetes script'
            'spotify: For mediaplayer script'
            'vlc: For mediaplayer script'
            'audacious: For mediaplayer script'
            'xmms2: For mediaplayer script'
            'mplayer: For mediaplayer script'
            'mpc: For mediaplayer script'
            'cmus: For mediaplayer script'
            'rhythmbox: For mediaplayer script'
            'xorg-xrandr: For monitor_manager script'
            'arandr: For monitor_manager script'
            'networkmanager: For nm-vpn script'
            'openvpn: For openvpn script'
            'rofi: For rofi-calendar & shutdown_menu script'
            'util-linux: For rofi-calendar & usb script'
            'zenity: For shutdown_menu script'
            'systemd: For shutdown_menu script'
            'curl: For tahoe-lafs script'
            'jq: For tahoe-lafs script'
            'tahoe-lafs: For tahoe-lafs script'
            'lm_sensors: For temperature script'
            'pulseaudio: For pulseaudio & volume script'
            'alsa-utils: For pulseaudio & volume script'
            'iw: For wlan-dbm script'
            'mpv: For ytdl-mpv script'
            'xclip: For ytdl-mpv script'
            'youtube-dl: For ytdl-mpv script')

package() {
  install -Dm644 "${pkgname-$pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  install -dm755 "${pkgdir}/usr/lib/i3blocks/"
  mv "${pkgname}-$pkgver"/* "${pkgdir}/usr/lib/i3blocks/"
}
