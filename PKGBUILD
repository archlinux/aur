# Maintainer: Sergey Desyatkov <sergeidesyatkov@gmail.com>

pkgname=asciify
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple image to ASCII art converter"
arch=('any')
url="https://github.com/desyatkoff/asciify"
license=('GPL-3.0-or-later')
depends=('python' 'python-pillow')
makedepends=()
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fec96c72200ae34f9daf4ec4c28e9fb284d0dfb3fe43ccd0786e4a89d691fac')

build() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "main.py" "$pkgdir/usr/bin/asciify"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
