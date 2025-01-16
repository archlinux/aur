# Maintainer: Kaushik Kalesh <kaushikkalesh@gmail.com>

pkgname=alwo
pkgver=1.0.0
pkgrel=1
pkgdesc="An application launcher and workspace organizer"
arch=('any')
url="https://github.com/kaushik-kalesh/alwo-linux"
license=('MIT')
depends=('python' 'wmctrl')
makedepends=()
source=('alwo' 'config' 'LICENSE')
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/alwo" "$pkgdir/usr/bin/alwo"
    mkdir -p "$pkgdir/usr/share/alwo"
    install -Dm755 "$srcdir/config" "$pkgdir/usr/share/alwo/config"
    mkdir -p "$pkgdir/usr/share/licenses/alwo"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/alwo/LICENSE"
}