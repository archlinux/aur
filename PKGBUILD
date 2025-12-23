pkgname=hub-rand
pkgver=1.0
pkgrel=1
pkgdesc="Open a random Pornhub video in mpv"
arch=('any')
depends=('bash' 'coreutils' 'curl' 'xdg-utils')
license=('MIT')
source=("hub-rand")
sha256sums=('SKIP')

package() {
    install -Dm755 hub-rand "$pkgdir/usr/bin/hub-rand"
}
