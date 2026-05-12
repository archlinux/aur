# Maintainer: Sourav <souravkumar18835@gmail.com>
pkgname=time-capsule
pkgver=1.0.0
pkgrel=1
pkgdesc="A tiny GTK stopwatch and timer capsule"
arch=('any')
url="https://github.com/sourav4243/time-capsule"
license=('MIT')
depends=('python' 'python-gobject' 'gtk3')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sourav4243/time-capsule/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/time-capsule-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/time-capsule"
}
