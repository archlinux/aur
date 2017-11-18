# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-iv-shell-theme'
pkgver=1.3
pkgrel=1
pkgdesc='Gnome-OSX IV Shell Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-shell'
         'gnome-shell-extensions')
source=('https://dl.opendesktop.org/api/files/download/id/1510765261/Gnome-OSX-Shell-themes-IV-1.3.tar.xz')
md5sums=('230a69d7632bd067a18f7d6a8585a48d')

package() {
    cd "$srcdir/Gnome-OSX-Shell-themes-IV-$pkgver"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
