# Maintainer: jzbor <zborof at posteo dot de>
pkgname=pademelon-desktop
pkgver=1.1.0
pkgrel=2
pkgdesc="Providing a modular desktop environment with pademelon"
arch=(x86_64)
url="https://github.com/jzbor/pademelon"
license=('MIT')
groups=()
depends=(
    pademelon
    moonwm
    picom
    xfce4-notifyd
    polkit-gnome
    xfce4-power-manager
    network-manager-applet
    xfce4-terminal
    pcmanfm-gtk3
    arandr
    pavucontrol
    pulseaudio
    pulseaudio-alsa
    lightdm
    lightdm-gtk-greeter
    lightdm-gtk-greeter-settings
    gnome-backgrounds
)
makedepends=(pkgconf)
checkdepends=()
optdepends=(
    'blueman: bluetooth support including applet'
    'pipewire: sound server - very good alternative to pulseaudio'
    'pipewire-pulse: pulse compatibility layer for pipewire'
    'sxhkd: hotkey daemon'
)
# Add in future version: 'pasystray: System Tray Icon for Audio Control'
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=(pademelon.conf::https://raw.githubusercontent.com/jzbor/pademelon/$pkgver/pademelon.conf)
noextract=()
sha512sums=('260b08e697ff13547778f53d9017c59c085443ca1dc8d5144b5c651ca9566df399df9a899e1affe7471d11d1a50e63f6a8c61fdb5167d4268904adf45a17e7bf')

validpgpkeys=()

package() {
    install -Dm644 pademelon.conf "${pkgdir}/etc/pademelon/pademelon.conf"
}


