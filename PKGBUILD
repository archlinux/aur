pkgname=autodarts-manager-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop-Verwaltung für Autodarts"
arch=('x86_64')
url="https://github.com/Silko10101986/autodarts-manager"
license=('custom')
depends=('curl' 'polkit' 'xdg-utils' 'xcb-util-cursor')
provides=('autodarts-manager')
conflicts=('autodarts-manager')
source=("https://github.com/Silko10101986/autodarts-manager/releases/download/v${pkgver}/autodarts-manager-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('a77b5cdcd7561098016517fa898716264b71b341e82dacfa693d76bc4f15bc19')

package() {
    install -Dm755 "$srcdir/autodarts-manager-${pkgver}/AutodartsManager" "$pkgdir/opt/autodarts-manager/AutodartsManager"
    install -Dm644 "$srcdir/autodarts-manager-${pkgver}/assets/autodarts-manager.svg" "$pkgdir/opt/autodarts-manager/assets/autodarts-manager.svg"
    install -Dm644 "$srcdir/autodarts-manager-${pkgver}/autodarts-manager.desktop" "$pkgdir/usr/share/applications/autodarts-manager.desktop"
}
