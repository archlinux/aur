# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=threema-desktop-bin
pkgver=1.2.5
pkgrel=1
pkgdesc="Threema Desktop (Threema Web in Electron)."
arch=("x86_64")
url="https://github.com/threema-ch/threema-web-electron"
license=('AGPL')
depends=('gtk3' 'nss')
provides=('threema-desktop')
conflicts=('threema-desktop')
source=("$pkgname-$pkgver.deb::https://releases.threema.ch/web-electron/archive/latest-$pkgver/Threema-Latest.deb")
sha256sums=('3134f448de1a98de8af819855ad43bdf4a95b7688656ff17d5a5c88fa9934e83')

package() {
    tar xf "$srcdir/data.tar.xz" -C "$pkgdir"
    rm -r "$pkgdir/usr/share/lintian"
    rm -r "$pkgdir/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
