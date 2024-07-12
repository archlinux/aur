# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=3.27.15-1
_debrel=amd64
_dirstr=ver_1iqEqV
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="CLI and GUI application to program your Flirc device"
arch=('x86_64')
url="http://flirc.tv"
license=('unknown')
depends=('libusb' 'hidapi' 'qt5-svg' 'qt5-xmlpatterns')
provides=('flirc')
conflicts=('flirc')
replaces=('flirc')
source=(https://apt.fury.io/flirc/files/${_dirstr}/flirc_${_pkgver}_${_debrel}.deb)
md5sums=('ed02ab0177de259c8c5aeed392be6361')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
}
