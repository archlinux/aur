# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=ubuntu-device-flash-bin
pkgver=0.34
_pkgver=0.34-0ubuntu1 # hyphen is not allowed in pkgver
pkgrel=1
pkgdesc="Tools to work with Ubuntu Touch"
arch=('i686' 'x86_64')
url="https://launchpad.net/goget-ubuntu-touch"
license=('GPL3')
provides=("ubuntu-device-flash")
conflicts=("ubuntu-device-flash")
source_i686=("http://mirrors.kernel.org/ubuntu/pool/universe/g/goget-ubuntu-touch/ubuntu-device-flash_${_pkgver}_i386.deb")
source_x86_64=("http://mirrors.kernel.org/ubuntu/pool/universe/g/goget-ubuntu-touch/ubuntu-device-flash_${_pkgver}_amd64.deb")
md5sums_i686=('7f8805fa8143a8683d855c5f937b3186')
md5sums_x86_64=('2d0926595b8e67bf81d773517bf225b7')

package() {
  bsdtar xf data.tar.xz
  chmod -R g-w usr
  mv usr "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
