# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=3.20.2
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="CLI and GUI application to program your Flirc device"
arch=('x86_64')
url="http://flirc.tv"
license=('unknown')
depends=('libusb' 'hidapi' 'qt5-svg' 'qt5-xmlpatterns')
provides=('flirc')
conflicts=('flirc')
replaces=('flirc')
source=(https://pkgbuild.com/~jsteel/flirc-bin/${_pkgname}_${_pkgver}_amd64.deb)
md5sums=('e938c83decdfaa876755fb9e83f614c6')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
}
