# Maintainer: Kevin Del Castillo R. <quebin31@gmail.com>

pkgname=muso
pkgver=0.1.0
pkgrel=1
pkgdesc="muso: music sorter"
arch=('any')
url=https://github.com/quebin31/muso
license=('GPL')
depends=()
optdepends=()
conflicts=()
options=()
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/quebin31/${pkgname}/releases/download/${pkgver}/release.tar.gz")
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir/usr/share/$pkgname"

    install $pkgname "$pkgdir/usr/bin/"
    cp "share/config.toml" "$pkgdir/usr/share/$pkgname/"
    cp "share/$pkgname.service" "$pkgdir/usr/share/$pkgname/"
}
