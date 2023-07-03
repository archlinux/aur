# Maintainer: mj0727 <fun6680@naver.com>

_pkgname='Breeze-Plus'
pkgname=${_pkgname@L}
pkgver=5.107.0
pkgrel=1
pkgdesc="Breeze Styled extra icon theme for KDE"
arch=('any')
url="https://github.com/mjkim0727/breeze-plus"
license=('LGPL-2.1')
depends=('breeze')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/breeze-plus/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7e4e837c5efc63aa9efa9f266c4290d68bb3892d01404f253f99f21d6e3777cc')

package() (
        cd "$pkgname-$pkgver"
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/${pkgname}-${pkgver}/src/breeze-plus* ${pkgdir}/usr/share/icons
)
