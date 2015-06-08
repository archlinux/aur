# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: cornholio <vigo.the.unholy.carpathian@gmail.com>
# Contributor: Michael Mansell <michael.mansell@gmail.com>

pkgname=flirc
_pkgver=1.3.6-1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="CLI and GUI application to program your Flirc device"
arch=('i686' 'x86_64')
url="http://flirc.tv"
license=('GPL3')
depends=('qt4' 'libusbx')
source_i686+=("http://apt.flirc.tv/arch/i386/binary/${pkgname}_${_pkgver}_i386.deb")
source_x86_64+=("http://apt.flirc.tv/arch/x86_64/binary/${pkgname}_${_pkgver}_amd64.deb")
md5sums_i686=('984567d3801d3db3d76d28cfc1fa61d4')
md5sums_x86_64=('0c67a865195c5e47964edd62cca12e23')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
}
