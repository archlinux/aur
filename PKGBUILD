# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=muso
pkgver=1.5.0
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
sha256sums=('be2570f19901342bfd0ba276d28ac923050e128c134ae34c266de0fc993b66b7')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/$pkgname"

    install "target/release/$pkgname" "$pkgdir/usr/bin/"
    cp "share/config.toml" "$pkgdir/usr/share/$pkgname/"
    cp "share/$pkgname.service" "$pkgdir/usr/share/$pkgname/"
}
