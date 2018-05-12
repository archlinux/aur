# Maintainer: Cole Thompson <cole dot thompson at gmail dot com>
pkgname=ufw-icon-bar
pkgver=1
pkgrel=3
pkgdesc="System tray icon for gufw"
arch=('any')
url="https://forum.manjaro.org/t/how-to-add-an-ufw-status-icon-to-the-panel/38559"
license=('unknown')
depends=('yad' 'gufw')
source=("$pkgname-$pkgver::git+https://github.com/juanmafont/ufwIconbar.git")
md5sums=("SKIP")

package() {
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname-$pkgver/gufw_icon.sh" "$pkgdir/usr/bin/"
}
