# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-v-space-grey-gtk-theme'
pkgver=1.3.1
pkgrel=1
pkgdesc='Gnome-OSX V Space Grey GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
depends=('gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1512508473/Gnome-OSX-V-Space-Grey-1-3-1.tar.xz')
md5sums=('156f5036482dbc45c939fe47e34d05ed')

_name='Gnome-OSX-V-Space-Grey'

package() {
    cd "$srcdir"
    mv "$_name-${pkgver//./-}" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
