# Maintainer: David Fryer <dfryer1193@gmail.com>

pkgname=nscope
pkgver=0.7
pkgrel=1
pkgdesc="nScope software"
arch=('i686' 'x86_64')
provides=('nscope')

source_x86_64=("http://www.nscope.org/v07/linux/nScope_0.7-1_amd64.deb")
md5sums_x86_64=('995082dc8c9ae9c67c8e8086cd224fd8')
depends_x86_64=('libpng12')

source_i686=("http://www.nscope.org/v07/linux/nScope_0.7-1_i386.deb")
md5sums_i686=('018c81e6db3f2391ac631b3e2925d8d0')
depends_i686=('lib32-libpng12')

package() {
  cd "${srcdir}"
  tar -xf data.tar.xz -C "${pkgdir}"
}
