# Maintainer: GustavoWidman <gustavowidman@gmail.com>

pkgname=nautilus-open-in-ptyxis
pkgver=1.0.0
pkgrel=1
pkgdesc="Open current directory in Ptyxis from Nautilus context menu (forked from nautilus-open-in-blackbox)"
arch=('any')
url="https://github.com/GustavoWidman/nautilus-open-in-ptyxis"
license=('GPL3')
depends=('python-nautilus>=4.0')
makedepends=('git')

source=("$pkgname-latest.tar.gz::https://github.com/GustavoWidman/nautilus-open-in-ptyxis/archive/refs/heads/main.tar.gz")

sha256sums=('SKIP')

package() {
    cd "$pkgname-main"
    install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions" nautilus-open-in-ptyxis.py
}
