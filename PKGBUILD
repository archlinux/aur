# Maintainer: xmlzitos154 <matheuz.ricardo@protonmail.com>
pkgname=jay-bin
pkgver=7.4.0
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
sha256sums=('c5cdfdf294cc704a591ac59ddb556f6fcff9c871972ba7d034f8c981132f414f')

package() {
    cd "jay-$pkgver"
    install -Dm755 main "$pkgdir/usr/bin/jay"
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
    install -Dm644 languages/en.sh "$pkgdir/usr/share/jay/en.sh"
    install -Dm644 languages/pt.sh "$pkgdir/usr/share/jay/pt.sh"
    install -Dm644 languages/base.sh "$pkgdir/usr/share/jay/base.sh"
    install -Dm644 languages/logging.sh "$pkgdir/usr/share/jay/logging.sh"
    install -Dm644 languages/cache.sh "$pkgdir/usr/share/jay/cache.sh"
    install -Dm644 languages/flatpak.sh "$pkgdir/usr/share/jay/flatpak.sh"
    install -Dm644 languages/etc.sh "$pkgdir/usr/share/jay/etc.sh"
}
