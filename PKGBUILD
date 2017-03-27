# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-light-shell-theme'
pkgver=1.0
pkgrel=1
pkgdesc='Gnome-OSX Light Shell Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-shell>=3.20'
         'gnome-shell-extensions')
source=('https://dl.opendesktop.org/api/files/download/id/1488138501/Gnome-OSX-Light-Shell.tar.gz')
md5sums=('10ae878b74a53e51f5d04d1d56bb3d40')

package() {
    cd "$srcdir"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
