# Maintainer: Shijo_Rei <fun6680@naver.com>

pkgname=breeze-extended
pkgver=1.13
pkgrel=1
pkgdesc="Breeze by the KDE VDG with many Desktop support"
arch=('any')
conflicts=('breeze-extended-all' 'breeze-extended-classic')
url="https://github.com/kuroehanako/breeze-extended"
license=('GPLv3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kuroehanako/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a80eae962203b77b34a644fbcab933035ae610a119708b3f72898bcdb6b45e2c')

package() (
        cd "$pkgname-$pkgver"
        install -d "$pkgdir/usr/share/icons"
        cp -r ${srcdir}/${pkgname}-${pkgver}/src/breeze-extended ${pkgdir}/usr/share/icons
        cp -r ${srcdir}/${pkgname}-${pkgver}/src/breeze-extended-dark ${pkgdir}/usr/share/icons
)
