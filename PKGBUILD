# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-iv-gtk-theme'
pkgver=1.3
pkgrel=1
pkgdesc='Gnome-OSX IV GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1510765325/Gnome OSX-IV-1.3.tar.xz')
md5sums=('8c286ab48881739e32a688d647e130b8')

_name='Gnome-OSX-IV'

package() {
    cd "$srcdir"
    mv "${_name/-/ }-$pkgver" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
