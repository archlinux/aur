# Maintainer: Pham Phuc <phuclaplace@gmail.com>

pkgname=nautilus-open-in-blackbox
pkgver=0.1.1
pkgrel=1
pkgdesc="Open current directory in BlackBox from Nautilus context menu"
arch=('any')
url="https://github.com/ppvan/nautilus-open-in-blackbox"
license=('GPL3')
depends=('python-nautilus>=4.0')
makedepends=('git')

source=("$pkgname-$pkgver.tar.gz::https://github.com/ppvan/nautilus-open-in-blackbox/archive/refs/tags/$pkgver.tar.gz")

sha256sums=('SKIP')

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions" nautilus-open-in-blackbox.py
}