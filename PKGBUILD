# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=genuki
pkgver=0.1.0
pkgrel=1
pkgdesc="genuki: generate unified kernel images"
arch=('any')
url=https://github.com/quebin31/genuki
license=('GPL3')
depends=()
optdepends=()
conflicts=()
options=()
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/quebin31/${pkgname}/releases/download/${pkgver}/release.tar.gz")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"

    install "target/release/$pkgname" "$pkgdir/usr/bin/"
    cp "share/config.yaml" "$pkgdir/usr/share/doc/$pkgname/"
}
