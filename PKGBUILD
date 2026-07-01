# Maintainer: tominjishi <burvistoms@proton.me>
# Contributor: mj0727 <fun6680@naver.com>

_pkgname='Breeze-Plus'
pkgname=${_pkgname@L}
pkgver=6.28.0
pkgrel=1
pkgdesc="Breeze Styled extra icon theme"
arch=('any')
url="https://github.com/mjkim0727/breeze-plus"
license=('LGPL-2.1-only')
depends=('breeze')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/breeze-plus/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2462371450507e224aa04404666919e16dcebc4ef120b1349f21cef316d21a73')

package() {
    install -d "$pkgdir/usr/share/icons"
    cp -r $srcdir/${pkgname}-${pkgver}/src/breeze-plus* "$pkgdir/usr/share/icons"
}
