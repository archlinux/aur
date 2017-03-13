# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=2.3.3-1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="CLI and GUI application to program your Flirc device"
arch=('i686' 'x86_64')
url="http://flirc.tv"
license=('unknown')
depends=('qt4' 'libusb' 'hidapi')
provides=('flirc')
conflicts=('flirc')
replaces=('flirc')
source_i686+=("http://apt.flirc.tv/arch/i386/binary/${_pkgname}_${_pkgver}_i386.deb")
source_x86_64+=("http://apt.flirc.tv/arch/x86_64/binary/${_pkgname}_${_pkgver}_amd64.deb")
md5sums_i686=('7f4c63f68e660f5badccd48857891ff7')
md5sums_x86_64=('5beb079e7d66ab0fa75744ca8beb1649')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
}
