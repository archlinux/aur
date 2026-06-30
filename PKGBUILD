# Maintainer: xmlzitos154 <matheuz.ricardo@protonmail.com>
pkgname=jay-bin
pkgver=7.2.8
pkgrel=1
pkgdesc="A lightweight, semantic AUR helper wrapper for Arch Linux"
arch=('any')
url="https://github.com/xmlzitos154/jay"
license=('MIT')
depends=('bash')
optdepends=(
    'flatpak: hybrid AUR/Flatpak mode'
    'reflector: mirror optimization support'
    'expac: system statistics'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c7a106b6ed10e011a35f7a7c8e9ed3a501e6fed4db2b970db34dc4fca93c1018')

package() {
    cd "jay-$pkgver"
    install -Dm755 main "$pkgdir/usr/bin/jay"
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
}
