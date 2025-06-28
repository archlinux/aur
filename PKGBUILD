# Maintainer: Hanashiko <hlichisper@gmail.com>
pkgname=routekit
pkgver=0.1.0
pkgrel=2
pkgdesc="A tool for managing and visualizing network routes"
arch=('any')
url="https://github.com/Hanashiko/routekit"
license=('MIT')
depends=('python' 'iproute2')
makedepends=('git')
provides=('routekit')
conflicts=('routekit')
source=("routekit" "LICENSE" "README.md")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    install -Dm755 "$srcdir/routekit" "$pkgdir/usr/bin/routekit"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}