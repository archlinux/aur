# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-dark-shell-theme'
pkgver=1.0
pkgrel=3
pkgdesc='Gnome-OSX Dark Shell Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-shell>=3.20'
         'gnome-shell-extensions')
source=('https://dl.opendesktop.org/api/files/download/id/1488138514/Gnome-OSX-Dark-Shell.tar.gz')
md5sums=('125abb12e3b2c3bb76b59e3b96305030')

package() {
    cd "$srcdir"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
