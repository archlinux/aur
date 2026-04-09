# Maintainer: Tsangares <Tsangares@gmail.com>
pkgname=awesome-stopwatch
_reponame=stopwatch
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimal GTK3 stopwatch with lap support"
arch=('any')
url="https://github.com/Tsangares/stopwatch"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tsangares/$_reponame/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c9447d345f6021633fe142a9cf18b9a714ffdd0c1da74b077d6335a002126c61')

package() {
    cd "$srcdir/$_reponame-$pkgver"
    install -Dm755 stopwatch.py "$pkgdir/usr/bin/$pkgname"
    install -Dm644 stopwatch.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
