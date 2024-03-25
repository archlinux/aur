# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=threema-desktop-bin
pkgver=1.2.41
pkgrel=1
pkgdesc="Threema Desktop (Threema Web in Electron)."
arch=("x86_64")
url="https://github.com/threema-ch/threema-web-electron"
license=('AGPL')
depends=('gtk3' 'nss')
provides=('threema-desktop')
conflicts=('threema-desktop')
source=("$pkgname-$pkgver.deb::https://releases.threema.ch/web-electron/archive/latest-$pkgver/Threema-Latest.deb")
sha256sums=('e271b192caa109d703e2048d4ad189f4a387b08c46bcecdddd4fbe29ee34cfa7')

package() {
    tar xf "$srcdir/data.tar.xz" -C "$pkgdir"
    rm -r "$pkgdir/usr/share/lintian"
    rm -r "$pkgdir/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
