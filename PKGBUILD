# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=3.27.9
_debrel=bullseye
_dirstr=ver_24auiw
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="CLI and GUI application to program your Flirc device"
arch=('x86_64')
url="http://flirc.tv"
license=('unknown')
depends=('libusb' 'hidapi' 'qt5-svg' 'qt5-xmlpatterns' 'readline7')
provides=('flirc')
conflicts=('flirc')
replaces=('flirc')
source=(https://apt.fury.io/flirc/files/${_dirstr}/flirc_${pkgver}_${_debrel}.deb)
md5sums=('da1a2c04eafef8bda564742a2a1bd7f8')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
}
