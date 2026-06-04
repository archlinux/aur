# Maintainer: xmlzitos154 <matheuz.ricardo@protonmail.com>
pkgname=jay-bin
pkgver=7.2.2
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
sha256sums=('d6196167b6dc458cbd7d7987104e5e902524e95b5de999adcf54efc3075f9b24')

package() {
    cd "jay-$pkgver"
    install -Dm755 main "$pkgdir/usr/bin/jay"
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
}
