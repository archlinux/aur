# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-v-traditional-gtk-theme'
pkgver=1.3.1
pkgrel=2
pkgdesc='Gnome-OSX V Traditional GTK Theme'
arch=('any')
url='https://www.opendesktop.org/p/1171688/'
depends=('gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1512508494/Gnome-OSX-V-Traditional-1-3-1.tar.xz')
md5sums=('560685c0a2db65831d63ca62297bf122')

_name='Gnome-OSX-V-Traditional'

package() {
    cd "$srcdir"
    mv "$_name-${pkgver//./-}" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
