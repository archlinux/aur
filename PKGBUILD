# Maintainer: tominjishi <burvistoms@proton.me>
# Contributor: mj0727 <fun6680@naver.com>

_pkgname='Breeze-Plus'
pkgname=${_pkgname@L}
pkgver=6.19.0
pkgrel=1
pkgdesc="Breeze Styled extra icon theme"
arch=('any')
url="https://github.com/mjkim0727/breeze-plus"
license=('LGPL-2.1')
depends=('breeze')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/breeze-plus/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9001b847f7f7c407620c4fedbcd01bc32b26a0cb33f80bc7fdad26617ff78d17')

package() {
    install -d "$pkgdir/usr/share/icons"
    cp -r $srcdir/${pkgname}-${pkgver}/src/breeze-plus* "$pkgdir/usr/share/icons"
}
