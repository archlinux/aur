# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=2.5.2-1
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
md5sums_i686=('4659bf3f1f1931e1ece342f8d2015c3d')
md5sums_x86_64=('b437f9be7c2614416e3085b784ac5643')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
}
