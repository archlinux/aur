pkgname=sekiro-launcher-iced-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A Sekiro tool launcher for challenge runners"
arch=('x86_64')
url="https://github.com/danimroca/Sekiro-Tool-Manager"
license=('MIT')
provides=('sekiro-launcher-iced')
conflicts=('sekiro-launcher-iced')
source=("$pkgname-$pkgver.tar.gz::https://github.com/danimroca/Sekiro-Tool-Manager/releases/download/v${pkgver}/sekiro-launcher-iced-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
    install -Dm755 sekiro-launcher "$pkgdir/usr/bin/sekiro-launcher"
}
