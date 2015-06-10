# Maintainer: Jeremy Symon <jtsymon@gmail.com>
pkgname=key-logic-ext
pkgver=2.2
_pkgver_sub=.2
pkgrel=2
pkgdesc="Dependencies for key-logic"
arch=('any')
url="http://www.key-project.org"
license=('LGPL' 'IBM' 'BSD')
depends=()
makedepends=()
checkdepends=()
optdepends=()
source=("$url/download/releases/$pkgver$_pkgver_sub/KeYExtLib-${pkgver}.tgz")
sha256sums=('8348b8d3450eb876bf4d0823d2fbd56257b92475b6f9c52c4bdf80e7088f2a68')

package() {
    install -d $pkgdir/usr/share/java/$pkgname
    install -Dm644 KeYExtLib-$pkgver/* $pkgdir/usr/share/java/$pkgname/
}
