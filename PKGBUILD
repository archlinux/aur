# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=3.9.7
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
source=(${_pkgname}_${_pkgver}_amd64.deb::https://packagecloud.io/Flirc/repo/packages/ubuntu/zesty/${_pkgname}_${_pkgver}_amd64.deb/download.deb)
md5sums=('4d76b6e51013539fcb5c0624cbf07708')

package() {
  tar -xf data.tar.gz -C "$pkgdir"
}
