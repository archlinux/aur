# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-iii-gtk-theme'
pkgver=1.0
pkgrel=1
pkgdesc='Gnome-OSX III GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1504612738/Gnome OSX-III-1.0.tar.gz')
md5sums=('5ee9040ed485a047d66654829c1aeeb1')

_name='Gnome-OSX-III'

package() {
    cd "$srcdir"
    mv "${_name/-/ }-$pkgver" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
