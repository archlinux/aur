# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=threema-desktop-bin
pkgver=1.0.3
pkgrel=4
pkgdesc="Threema Desktop (Threema Web in Electron)."
arch=("x86_64")
url="https://github.com/threema-ch/threema-web-electron"
license=('AGPL')
depends=('gtk3' 'nss')
provides=('threema-desktop')
conflicts=('threema-desktop')
source=("$pkgname-$pkgver.deb::https://releases.threema.ch/web-electron/archive/latest-$pkgver/Threema-Latest.deb")
sha256sums=('aa216fe769e7c9f1f10964de3e6cb15bf320cc5cb7114c665ba9fe508930eed9')

package() {
    tar xf "$srcdir/data.tar.xz" -C "$pkgdir"
    rm -r "$pkgdir/usr/share/lintian"
    rm -r "$pkgdir/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
