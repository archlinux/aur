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
source=(http://apt.flirc.tv/arch/x86_64/flirc.latest.x86_64.tar.gz)
md5sums=('87ac7fc7ad2d553fa2ba991e4bd5f5b0')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
}
