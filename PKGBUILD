# Maintainer: Hsieh Chin Fan <typebrook@gmail.com>
pkgname=gist-lite
pkgver=0.2
pkgrel=1
pkgdesc="Bash script for gist management"
arch=(any)
gist_id=b0d2e7e67aa50298fdf8111ae7466b56
url="https://gist.github.com/$gist_id"
license=('GPL3')
depends=(git coreutils python)
source=(https://codeload.github.com/gist/$gist_id/tar.gz/$pkgver)
md5sums=('1c2e95fe7d7ce34bcf88b416dabacf2d')

package() {
  install -Dm0755 ${srcdir}/${gist_id}-${pkgver}/gist ${pkgdir}/usr/bin/gist
}
