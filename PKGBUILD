pkgname=67
pkgver=1.0.0
pkgrel=1
pkgdesc="A curses terminal animation of 67 lol"
arch=('any')
url="https://github.com/CDatarET/67"
license=('MIT')
depends=('python')
source=("git+https://github.com/CDatarET/67.git")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/67/67.py" "$pkgdir/usr/bin/67"

    install -Dm644 "$srcdir/67/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
