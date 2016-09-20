# Maintainer: Vincent gatine <nurelin15@gmail.com>

pkgname=djboxsym
pkgver=1
pkgrel=1
pkgdesc="tool for quickly producing a gschem symbol from a minimal description"
arch=('any')
url="http://www.gedasymbols.org/user/dj_delorie/tools/djboxsym.html"
license=('GPL2')
depends=('perl')
makedepends=()
source=("http://www.gedasymbols.org/user/dj_delorie/tools/djboxsym")
md5sums=('3a2f74349d769f60933d2f25caeac029')

package() {
  install -D -m755 djboxsym "${pkgdir}/usr/bin/djboxsym"
}
