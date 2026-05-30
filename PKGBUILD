# Maintainer: tominjishi <burvistoms@proton.me>
# Contributor: mj0727 <fun6680@naver.com>

_pkgname='Breeze-Plus'
pkgname=${_pkgname@L}
pkgver=6.26.0
pkgrel=1
pkgdesc="Breeze Styled extra icon theme"
arch=('any')
url="https://github.com/mjkim0727/breeze-plus"
license=('LGPL-2.1-only')
depends=('breeze')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/breeze-plus/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e212f851fba3adf1287e7325e775eafe7f886f04b39b6185d4b3e9bf4f41829e')

package() {
    install -d "$pkgdir/usr/share/icons"
    cp -r $srcdir/${pkgname}-${pkgver}/src/breeze-plus* "$pkgdir/usr/share/icons"
}
