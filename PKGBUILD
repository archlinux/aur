# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname='gn-osx-hsierra'
pkgver=1.2.1
pkgrel=1
pkgdesc='Gn-OSX H.Sierra'
arch=('any')
url='https://www.gnome-look.org/p/1180505/'
depends=('gnome-themes-standard'
         'gtk-engine-murrine')
source=('https://dl.opendesktop.org/api/files/download/id/1500587974/Gn-OSX-HSierra-1.2.1-sidebar-issue.tar.gz')
md5sums=('21ae1e4995848e1ae7387a689f6f50e0')

_name='Gn-OSX-HSierra'
_suffix='sidebar-issue'

package() {
    cd "$srcdir"
    mv "$_name-$pkgver-$_suffix" "$_name"
    find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
