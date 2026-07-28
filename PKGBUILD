# Maintainer: zyvxi <zyvxi@archlinux>
pkgname=activatelinux
pkgver=1.0.0
pkgrel=1
pkgdesc="A fake Activate Linux wizard parody with a Windows-style activation GUI"
arch=('any')
url="https://github.com/zyvxi/fake-windows"
license=('MIT')
depends=('python' 'tk')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/fake-windows-$pkgver"
    install -Dm755 activate_linux.py "$pkgdir/usr/share/$pkgname/activate_linux.py"
    install -Dm755 activatelinux.sh "$pkgdir/usr/bin/activatelinux"
    install -Dm644 activatelinux.desktop "$pkgdir/usr/share/applications/activatelinux.desktop"
}
