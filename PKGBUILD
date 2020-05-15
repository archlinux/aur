# Maintainer: Hsieh Chin Fan <typebrook@gmail.com>
pkgname=gist-lite
pkgver=0.5
pkgrel=1
pkgdesc="Bash script for gist management"
arch=(any)
gist_id=b0d2e7e67aa50298fdf8111ae7466b56
url="https://gist.github.com/$gist_id"
license=('GPL3')
depends=(git python)
source=(https://codeload.github.com/gist/$gist_id/tar.gz/v$pkgver)
md5sums=('4b0cc6fefa445f4e95e5741eb447f535')
install=msg.install

package() {
  install -Dm0755 ${srcdir}/${gist_id}-${pkgver}/gist ${pkgdir}/usr/bin/${pkgname}
}
