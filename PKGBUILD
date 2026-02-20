# Maintainer: Injamamul Islam Shimul <islamshimul27@gmail.com>
pkgname=nautilus-create-file
pkgver=1.0.0
pkgrel=1
pkgdesc="Nautilus extension to create new files via right-click context menu"
arch=('any')
url="https://github.com/ii-shimul/nautilus-create-file"
license=('MIT')
depends=('nautilus' 'python-nautilus' 'libadwaita')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 create-file.py "$pkgdir/usr/share/nautilus-python/extensions/create-file.py"
}
