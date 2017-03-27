# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-ii-nt-gtk-theme'
pkgver=2.5.1
pkgrel=1
pkgdesc='Gnome-OSX 2.0 with No Transparent sidebar GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-shell>=3.20'
         'gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1489658553/Gnome-OSX-II-NT-2-5-1.tar.xz')
md5sums=('2b83b51880766cd58848136eba49127e')

_name='Gnome-OSX-II-NT'
_version=${pkgver//./-}

package() {
    cd "$srcdir"
    mv "$_name-$_version" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
