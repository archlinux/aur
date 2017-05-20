# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-ii-gtk-theme'
pkgver=2.6
pkgrel=1
pkgdesc='Gnome-OSX 2.0 GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1494791931/Gnome-OSX-II-2-6.tar.gz')
md5sums=('b1b89017a0d6efc8c744075e697527ba')

_name='Gnome-OSX-II'
_version=${pkgver//./-}

package() {
    cd "$srcdir"
    mv "$_name-$_version" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
