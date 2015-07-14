# Contributor: Bernardo Barros <mail-*-AT-*-bbarros.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Truls Becken <becken@stud.ntnu.no>
# Contributor: whompus

# Based on xdm-archlinux

pkgname=xdm-minimalist
pkgver=0.1
pkgrel=1
pkgdesc="a minimalist xdm setup."
arch=(any)
license=('GPL')
url="http://xorg.freedesktop.org"
depends=('xorg-xdm' 'bash' 'xorg-xmessage' 'xorg-xclock' 
  'xorg-xsetroot' 'xorg-xwininfo' 'xorg-xkill' 'terminus-font')
backup=(etc/X11/xdm/minimalist/Xsetup
	etc/X11/xdm/minimalist/Xresources)
install=xdm-minimalist.install
source=(xdm-config
	Xsetup
	Xstartup
	Xresources
	buttons)
md5sums=('e420ef106f97ba5b866164feb031bb14'
         'd3637c5aca0e787b54db2b78fe99621d'
         '1628c6cf77d5da2528265dbaf2eaacf4'
         '9c63f8eec798fc13ff7caeb2e628c2a2'
         'e145d6eee0bbdb5cb674944bc3a09a88')

build() {
  mkdir -p $pkgdir/etc/X11/xdm/minimalist
  cp * $pkgdir/etc/X11/xdm/minimalist
}
