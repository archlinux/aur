# Maintainer: Jack L. Frost <fbt@fleshless.org>
pkgname=xorg-noudev-conf
pkgver=0.1
pkgrel=1
pkgdesc="X.Org configuration for setups with no udev."
url="https://google.com"
arch=( 'any' )
license=( 'WTFPL' )
depends=( 'xorg-server' )
#optdepends=()
#makedepends=()
#conflicts=()
#replaces=()
#backup=()

#install='foo.install'
source=( '00-disable-hotplug.conf' '05-input.conf' )
md5sums=('6f18a3b0f6d23ada0476edcb375bd115'
         'dd3365d7218bc167ed99279acfb945ba')

build() {
  msg "No build required"
}

package() {
  install -Dm644 '00-disable-hotplug.conf' "$pkgdir/usr/share/X11/xorg.conf.d/00-disable-hotplug.conf"
  install -Dm644 '05-input.conf' "$pkgdir/usr/share/X11/xorg.conf.d/05-input.conf"
}

# vim:set ts=2 sw=2 et:
