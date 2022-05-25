# maintainer: libele <libele@disroot.org>

pkgname=tractorgen
pkgver=0.31.7
pkgrel=1
pkgdesc="Generates ASCII tractors"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'pentium4' 'x86_64')
url="https://vergenet.net/~conrad/software/tractorgen/"
license=('GPL2')
source=("https://vergenet.net/~conrad/software/${pkgname}/dl/${pkgname}-${pkgver}.tar.gz")

md5sums=('ba6b0483de7933ee9b733b781875bb7d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix="${pkgdir}"/usr
  make install
}
