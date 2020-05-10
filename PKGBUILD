# Maintainer: typebrook <typebrook@gmail.com>
pkgname=gist-lite
pkgver=0.1
pkgrel=2
pkgdesc="Manage your gist like a pro"
arch=(any)
gist_id=b0d2e7e67aa50298fdf8111ae7466b56
url="https://gist.github.com/$gist_id"
license=('GPL3')
depends=(git coreutils python)
source=(https://codeload.github.com/gist/$gist_id/tar.gz/$pkgver)
md5sums=('ffab52c1c233f726642d1d8eabfb39a6')

package() {
  install -m0755 ${srcdir}/${gist_id}-${pkgver}/gist /usr/bin/gist
}
