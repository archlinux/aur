# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=3.25.3
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="CLI and GUI application to program your Flirc device"
arch=('x86_64')
url="http://flirc.tv"
license=('unknown')
depends=('libusb' 'hidapi' 'qt5-svg' 'qt5-xmlpatterns' 'readline6')
provides=('flirc')
conflicts=('flirc')
replaces=('flirc')
source=(https://apt.fury.io/flirc/files/ver_PtQm3/flirc_${pkgver}_amd64.deb)
md5sums=('5759c5894e2ff7d9c194f9330697194f')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
}
