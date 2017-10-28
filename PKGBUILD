# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-iv-gtk-theme'
pkgver=1.2
pkgrel=1
pkgdesc='Gnome-OSX IV GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1509011922/Gnome OSX-IV-1.2.tar.gz')
md5sums=('1063974a756965c47c1175836f900b73')

_name='Gnome-OSX-IV'

package() {
    cd "$srcdir"
    mv "${_name/-/ }-$pkgver" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
