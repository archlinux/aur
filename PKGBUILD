# Maintainer: Pham Phuc <phuclaplace@gmail.com>

pkgname=nautilus-open-in-blackbox
pkgver=1.0.0
pkgrel=1
pkgdesc="Open current directory in BlackBox from Nautilus context menu"
arch=('any')
url="https://github.com/ppvan/nautilus-open-in-blackbox"
license=('GPL3')
depends=('python-nautilus>=4.0')
makedepends=('git')

_commit=e69a0093311d6b89b25a55044d4f820d16de72c9
source=("git+https://github.com/ppvan/nautilus-open-in-blackbox#commit=$_commit")

sha256sums=('SKIP')

package() {
    cd "$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/nautilus-python/extensions" nautilus-open-in-blackbox.py
}