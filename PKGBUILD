# Maintainer: rumyp <rumyp@example.com>
pkgname=revreader
pkgver=1.0
pkgrel=1
pkgdesc="Minimal Python EPUB reader (terminal + Qt GUI)"
arch=('x86_64')
url="https://github.com/Rumyp/revreader"
license=('MIT')
depends=('python' 'python-pyqt6')
source=("https://github.com/Rumyp/revreader/archive/refs/tags/v1.0.tar.gz")
sha256sums=('4dc86faaa35613461d82c4d2aecb66bf34a36b05eb2d657bdbdc84414f1b7930')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -m 755 revreader.py "$pkgdir/usr/bin/revreader"
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    install -m 644 README.md LICENSE "$pkgdir/usr/share/doc/$pkgname/"
}
