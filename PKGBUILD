# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc-bin
_pkgname=flirc
_pkgver=2.0.4-1
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
md5sums_i686=('e595b2e4410f1537e52d4e823f5abea6')
md5sums_x86_64=('57a3de6040e3f5375dc15d45a2e82cba')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
}
