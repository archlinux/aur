# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-ii-gtk-theme'
pkgver=2.5.1
pkgrel=3
pkgdesc='Gnome-OSX 2.0 GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-shell>=3.20'
         'gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1489657686/Gnome-OSX-II-2-5-1.tar.xz')
md5sums=('e08f67a874188644aace5bf802ae9275')

_name='Gnome-OSX-II'
_version=${pkgver//./-}

package() {
    cd "$srcdir"
    mv "$_name-$_version" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
