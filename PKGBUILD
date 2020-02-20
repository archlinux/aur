# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=muso
pkgver=1.2.0
pkgrel=1
pkgdesc="muso: music sorter"
arch=('any')
url=https://github.com/quebin31/muso
license=('GPL3')
depends=()
optdepends=()
conflicts=()
options=()
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/quebin31/${pkgname}/releases/download/${pkgver}/release.tar.gz")
sha256sums=('0c9bc98ba0fb1dbedd424fc0de665fdd0cb323dc8458253f504086f004a614b6')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/$pkgname"

    install "target/release/$pkgname" "$pkgdir/usr/bin/"
    cp "share/config.toml" "$pkgdir/usr/share/$pkgname/"
    cp "share/$pkgname.service" "$pkgdir/usr/share/$pkgname/"
}
