# Maintainer: David Fryer <dfryer1193@gmail.com>

pkgname=nscope
pkgver=0.8.2
pkgrel=1
pkgdesc="nScope software"
arch=('i686' 'x86_64')
provides=('nscope')

source_x86_64=("http://www.nscope.org/v0.8.2/linux/nscope_0.8.2_amd64.deb")
md5sums_x86_64=('6c1546cf3dc8d98cb52ea8d4539e2e49')
depends_x86_64=('libpng12')

source_i686=("http://www.nscope.org/v0.8.2/linux/nscope_0.8.2_i386.deb")
md5sums_i686=('7099d4b5e3d33a19a6b94493508c4851')
depends_i686=('lib32-libpng12')

package() {
  cd "${srcdir}"
  tar -xf data.tar.gz -C "${pkgdir}"
  rm -rf "${pkgdir}/DEBIAN"
}
