# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=1.4.4-1
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="CLI and GUI application to program your Flirc device"
arch=('i686' 'x86_64')
url="http://flirc.tv"
license=('unknown')
depends=('qt4' 'libusb')
provides=('flirc')
replaces=('flirc')
source_i686+=("http://apt.flirc.tv/arch/i386/binary/${_pkgname}_${_pkgver}_i386.deb")
source_x86_64+=("http://apt.flirc.tv/arch/x86_64/binary/${_pkgname}_${_pkgver}_amd64.deb")
md5sums_i686=('8c76190fe27c3dfdf4147d2fbc3019be')
md5sums_x86_64=('0e855cdcfd40498368647f48939d8980')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
}
