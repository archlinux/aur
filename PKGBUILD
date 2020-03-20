# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=muso
pkgver=1.4.0
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
sha256sums=('d364e1cd9e751875ce9b52c96bc9fd8c1b0789ae56d895778a41a579e3feebdf')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/$pkgname"

    install "target/release/$pkgname" "$pkgdir/usr/bin/"
    cp "share/config.toml" "$pkgdir/usr/share/$pkgname/"
    cp "share/$pkgname.service" "$pkgdir/usr/share/$pkgname/"
}
