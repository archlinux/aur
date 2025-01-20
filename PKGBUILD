# Maintainer: mj0727 <fun6680@naver.com>

_pkgname='Breeze-Plus'
pkgname=${_pkgname@L}
pkgver=6.2.5
pkgrel=1
pkgdesc="Breeze Styled extra icon theme for KDE"
arch=('any')
url="https://github.com/mjkim0727/breeze-plus"
license=('LGPL-2.1')
depends=('breeze')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mjkim0727/breeze-plus/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('394de826f5d0edeb036d9947842229d45be928cf95e296850e6f4a47bbe392b7')

package() (
        cd "$pkgname-$pkgver"
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/${pkgname}-${pkgver}/src/breeze-plus* ${pkgdir}/usr/share/icons
)
