# Maintainer: xmlzitos154 <matheuz.ricardo@protonmail.com>
pkgname=jay-bin
pkgver=7.2.3
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
sha256sums=('420a80e343eddb176a13314cfd816faf37140de7e6f9588e052898908f072025')

package() {
    cd "jay-$pkgver"
    install -Dm755 main "$pkgdir/usr/bin/jay"
    install -Dm644 README.md "$pkgdir/usr/share/doc/jay/README.md"
}
