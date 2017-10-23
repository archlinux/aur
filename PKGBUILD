# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-iii-gtk-theme'
pkgver=1.1
pkgrel=1
pkgdesc='Gnome-OSX IV GTK Theme (Transition)'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1508508945/Gnome OSX-IV-1.1.tar.gz')
md5sums=('5544c0bcd35f8f730bb04cdcb58a17fc')

_name='Gnome-OSX-IV'

package() {
    cd "$srcdir"
    mv "${_name/-/ }-$pkgver" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
