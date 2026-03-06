# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=gnome-shell-extension-tuxedo-fnlock-status
pkgver=7
pkgrel=1
pkgdesc="GNOME Shell Extension to display the FnLock status of TUXEDO devices "
arch=('any')
url="https://github.com/StevenSeifried/tuxedo-fnlock-status"
license=('GPL3')
depends=('gnome-shell')
options=(!strip !debug)
source=("https://github.com/StevenSeifried/tuxedo-fnlock-status/releases/download/v${pkgver}/tuxedo-fnlock-status@stevenseifried.github.io.zip")
sha256sums=('872968d5eafe8a36e40c4d03b680e1213a2f34acf3d8a2d7009cd2d31675c3cb')
sha512sums=('f700f158a4082e245021840c265f7767d893f268fdb45ae242726ba150ac74d3cd1e27fa34b7c57a034646038283a9f7eb525a7631e153faaca490742242f5cd')

package() {
    destdir="$pkgdir/usr/share/gnome-shell/extensions/tuxedo-fnlock-status@stevenseifried.github.io/"
    mkdir -p "$destdir"
    install -dm755 "$destdir"
    cp -r $srcdir/* "$destdir/"
    rm $pkgdir/usr/share/gnome-shell/extensions/tuxedo-fnlock-status@stevenseifried.github.io/tuxedo-fnlock-status@stevenseifried.github.io.zip
}
