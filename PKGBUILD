# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=2.3.8-1
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
md5sums_i686=('ec5ab1cba85623579069e084d85d92a0')
md5sums_x86_64=('fb5b0cb718f11a591e62af5c91ef05e0')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
}
