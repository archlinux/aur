# Maintainer: David Fryer <dfryer1193@gmail.com>

pkgname=nscope
pkgver=0.8.1
pkgrel=1
pkgdesc="nScope software"
arch=('i686' 'x86_64')
provides=('nscope')

source_x86_64=("http://www.nscope.org/v081/linux/nscope_0.8.1_amd64.deb")
md5sums_x86_64=('f0d5dcb54cad1e07926499e5b9e90d0e')
depends_x86_64=('libpng12')

source_i686=("http://www.nscope.org/v081/linux/nscope_0.8.1_i386.deb")
md5sums_i686=('7aaa06e6feb2a9f363bb86cabf17a727')
depends_i686=('lib32-libpng12')

package() {
  cd "${srcdir}"
  tar -xf data.tar.gz -C "${pkgdir}"
  rm -rf "${pkgdir}/DEBIAN"
}
