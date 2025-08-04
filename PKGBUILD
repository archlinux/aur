# Maintainer: Mahmoud Almezali <mzmcsmzm@gmail.com>

pkgname=pkger-v
pkgver=0.1.38
pkgrel=7
pkgdesc="A Pro Package Manager with beautiful UI and local package support"
arch=('any')
url="https://github.com/almezali/pkger"
license=('MIT')
depends=('python' 'python-pyqt5' )
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/main.tar.gz"
)
sha256sums=('SKIP')

package() {
    cd "$srcdir/pkger-main"

    install -Dm755 "pkger.py" "$pkgdir/usr/bin/pkger"
    install -Dm644 "pkger.desktop" "$pkgdir/usr/share/applications/pkger.desktop"
    install -Dm644 "pkger.png" "$pkgdir/usr/share/icons/pkger.png"
}

