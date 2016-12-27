# Maintainer: Yuexuan Gu <lastavengers@outlook.com>

pkgname=cinclude2dot
pkgver=1.1
pkgrel=2
pkgdesc="a perl script which analyses C/C++ code and produces a #include dependency graph."
url="https://www.flourish.org/cinclude2dot/"
arch=('any')
license=('GPL')
depends=('perl')
optdepends=('graphviz: convert dot file to png file.')
source=('https://www.flourish.org/cinclude2dot/cinclude2dot')
sha256sums=('78f2e60d49882c7d0969a2ac396238234d7b8d16eef83cc2910e6556fd6b990c')

package() {
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
