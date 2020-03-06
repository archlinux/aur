# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=muso
pkgver=1.3.0
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
sha256sums=('eed8d4f6019d0919798d820c5053fdbdac5b4152533beefb7de1d12597f586f4')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/$pkgname"

    install "target/release/$pkgname" "$pkgdir/usr/bin/"
    cp "share/config.toml" "$pkgdir/usr/share/$pkgname/"
    cp "share/$pkgname.service" "$pkgdir/usr/share/$pkgname/"
}
