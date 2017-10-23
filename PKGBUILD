# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gnome-osx-iv-shell-theme'
pkgver=1.0
pkgrel=1
pkgdesc='Gnome-OSX IV Shell Theme'
arch=('any')
url='https://www.gnome-look.org/p/1171688/'
depends=('gnome-shell'
         'gnome-shell-extensions')
source=('https://dl.opendesktop.org/api/files/download/id/1508433691/Gnome-OSX-Shell-themes-IV.tar.gz')
md5sums=('60de5efeb39ca615b092747d54a245c0')

package() {
    cd "$srcdir/Gnome-OSX-Shell-themes-IV"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
