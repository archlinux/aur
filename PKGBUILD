# Maintainer: Danilo <aur ät dbrgn döt ch>
pkgname=threema-desktop-bin
pkgver=1.2.27
pkgrel=1
pkgdesc="Threema Desktop (Threema Web in Electron)."
arch=("x86_64")
url="https://github.com/threema-ch/threema-web-electron"
license=('AGPL')
depends=('gtk3' 'nss')
provides=('threema-desktop')
conflicts=('threema-desktop')
source=("$pkgname-$pkgver.deb::https://releases.threema.ch/web-electron/archive/latest-$pkgver/Threema-Latest.deb")
sha256sums=('fd0add981f4b1d9efb5c7d3baa9c082a85676ac13ec2ddf0894749cc7f38a24b')

package() {
    tar xf "$srcdir/data.tar.xz" -C "$pkgdir"
    rm -r "$pkgdir/usr/share/lintian"
    rm -r "$pkgdir/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
