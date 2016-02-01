# Maintainer: David Fryer <dfryer1193@gmail.com>

pkgname=nscope
pkgver=0.6
pkgrel=1
pkgdesc="nScope software"
arch=('i686' 'x86_64')
provides=('nscope')

source_x86_64=("https://raw.githubusercontent.com/nLabs-nScope/nScope/master/linux/nScope_0.6-1_amd64.deb")
md5sums_x86_64=('bceb305f41645fc54ce9ca286ec8ed03')
depends_x86_64=('libpng12')

source_i686=("https://raw.githubusercontent.com/nLabs-nScope/nScope/master/linux/nScope_0.6-1_i386.deb")
md5sums_i686=('bfd3eef642afceabbb33f158db7b804e')
depends_i686=('lib32-libpng12')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"
}
