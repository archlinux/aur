# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-iv-gtk-theme'
pkgver=1.4
pkgrel=1
pkgdesc='Gnome-OSX IV GTK Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1511390992/Gnome OSX-IV-1.4.tar.xz')
md5sums=('6d94de5c59ec2a92602856a49d0587d8')

_name='Gnome-OSX-IV'

package() {
    cd "$srcdir"
    mv "${_name/-/ }-$pkgver" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
