# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=gnome-shell-extension-tuxedo-fnlock-status
pkgver=5
pkgrel=1
pkgdesc="GNOME Shell Extension to display the FnLock status of TUXEDO devices "
arch=('any')
url="https://github.com/StevenSeifried/tuxedo-fnlock-status"
license=('GPL3')
depends=('gnome-shell')
options=(!strip !debug)
source=("https://github.com/StevenSeifried/tuxedo-fnlock-status/releases/download/v${pkgver}/tuxedo-fnlock-status@stevenseifried.github.io.zip")
sha256sums=('a59d47d5b5d6a3248bf84dc9c945ef49629e05f49294464831433e0015487026')
sha512sums=('44a6ad2860ec5b908ecb295ebe78657a46b6c5f9e63343c460a0e05fcebbe55d0754f44808b983b993dbd96a096994c548c134d54f1ac67f5cdf30968e7a9fc3')

package() {
    destdir="$pkgdir/usr/share/gnome-shell/extensions/tuxedo-fnlock-status@stevenseifried.github.io/"
    mkdir -p "$destdir"
    install -dm755 "$destdir"
    cp -r $srcdir/* "$destdir/"
}
