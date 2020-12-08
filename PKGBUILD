# Maintainer: Illia Shestakov <illia@ishestakov.com>

pkgname=sacd
pkgver=19.7.16.37
pkgrel=1
pkgdesc='Super Audio CD decoder.'
arch=("i686" "x86_64")
url='https://github.com/Sound-Linux-More/sacd'
license=('GPL3')
depends=()
source=(https://github.com/Sound-Linux-More/sacd/archive/${pkgver}.tar.gz)
md5sums=('3c29546256e722d378e111ac5a6bd3a5')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
