# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-iv-space-grey-gtk-theme'
pkgver=1.3
pkgrel=1
pkgdesc='Gnome-OSX IV Space Grey GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1510765281/Gnome-OSX-IV-Space-Grey-1.3.tar.xz')
md5sums=('c990fe29074cc75c8cc1e5f6a8ee123b')

_name='Gnome-OSX-IV-Space-Grey'

package() {
    cd "$srcdir"
    mv "$_name-$pkgver" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
