# Maintainer: zyvxi <zyvxi@archlinux>
pkgname=fakebinbows
pkgver=1.0.0
pkgrel=1
pkgdesc="A fake Windows 11 installer parody for Linux with a full GUI"
arch=('any')
url="https://github.com/zyvxi/fake-windows"
license=('MIT')
depends=('python' 'tk')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/fake-windows-$pkgver"
    install -Dm755 install_gui.py "$pkgdir/usr/share/$pkgname/install_gui.py"
    install -Dm755 install.sh "$pkgdir/usr/share/$pkgname/install.sh"
    install -Dm755 fakebinbows.sh "$pkgdir/usr/bin/fakebinbows"
    install -Dm644 fakebinbows.desktop "$pkgdir/usr/share/applications/fakebinbows.desktop"
}
