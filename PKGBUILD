# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-ii-nt-gtk-theme'
pkgver=2.6
pkgrel=1
pkgdesc='Gnome-OSX 2.0 with No Transparent sidebar GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1494791955/Gnome-OSX-II-2-6-NT.tar.gz')
md5sums=('ce48ad774476794b7beedaebc7de5f7f')

_name='Gnome-OSX-II'
_version=${pkgver//./-}-NT

package() {
    cd "$srcdir"
    mv "$_name-$_version" "$_name-NT"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
