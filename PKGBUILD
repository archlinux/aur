# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=gnome-shell-extension-tuxedo-fnlock-status
pkgver=6
pkgrel=1
pkgdesc="GNOME Shell Extension to display the FnLock status of TUXEDO devices "
arch=('any')
url="https://github.com/StevenSeifried/tuxedo-fnlock-status"
license=('GPL3')
depends=('gnome-shell')
options=(!strip !debug)
source=("https://github.com/StevenSeifried/tuxedo-fnlock-status/releases/download/v${pkgver}/tuxedo-fnlock-status@stevenseifried.github.io.zip")
sha256sums=('5a7b714fc38203a73b8b166ba2a37e0d50c777a81ea4c6268031871d54b64bce')
sha512sums=('edc8fb8d58cfd9fa7b97cdc9b027798a62d310aaf8f9b8de2f7cb5e42967d3f4ad0fbc31455ee26a47e9627b106ab559e3d47b53fb77532457ef90a86eb34732')

package() {
    destdir="$pkgdir/usr/share/gnome-shell/extensions/tuxedo-fnlock-status@stevenseifried.github.io/"
    mkdir -p "$destdir"
    install -dm755 "$destdir"
    cp -r $srcdir/* "$destdir/"
    rm $pkgdir/usr/share/gnome-shell/extensions/tuxedo-fnlock-status@stevenseifried.github.io/tuxedo-fnlock-status@stevenseifried.github.io.zip
}
