# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-shell-themes'
pkgver=1.0
pkgrel=1
pkgdesc='Gnome-OSX Shell Themes'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-shell'
         'gnome-shell-extensions')
source=('https://dl.opendesktop.org/api/files/download/id/1504612721/Gnome-OSX-Shell-themes-1.0.tar.gz')
md5sums=('8db93e6f79090b2d0a7eb9dd3e9d64b2')

package() {
    cd "$srcdir/Gnome-OSX-Shell-themes-$pkgver"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
