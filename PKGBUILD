# Maintainer: Rudy Rivera <rodolfo.rivera@gmail.com>
pkgname=pocketcli
pkgver=1.4.4
pkgrel=1
pkgdesc="Terminal UI client for Pocket Casts - stream podcasts and audiobooks from your terminal"
arch=('any')
url="https://github.com/foforivera/pocketcli"
license=('MIT')
depends=('python' 'mpv' 'python-httpx' 'python-rich' 'python-click')
source=("$pkgname-$pkgver.py::https://raw.githubusercontent.com/foforivera/pocketcli/main/pocketcli.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}
