# Maintainer: Edmund Wu <fangkazuto@gmail.com>

pkgname=kcore-meta
pkgver=0.1.1
pkgrel=1
pkgdesc='Core packages'
arch=('x86_64')
url='https://gitlab.com/eadwu/pkgbuilds'
license=('unknown')
depends=('acpi'
         'alsa-utils'
         'bluez'
         'bluez-libs'
         'bluez-utils'
         'gnome-keyring'
         'networkmanager'
         'network-manager-applet'
         'ntp'
         'pulseaudio'
         'pulseaudio-alsa'
         'pulseaudio-bluetooth'
         'xf86-input-libinput'
         'xorg-server'
         'xorg-xhost'
         'xorg-xinit'
         'xorg-xprop'
         'xorg-xsetroot'
         'xorg-xwininfo'
         'yaourt'
)
source=('30-touchpad.conf')
sha256sums=('60bef201ab73c107c10bf7f556e28d66bc6f27e9b6455c6353777f806519e8e2')

package () {
  install -Dm 0644 "30-touchpad.conf" "${pkgdir}/etc/X11/xorg.conf.d/30-touchpad.conf"
}
