# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-macosx-theme
pkgver=1.0
pkgrel=2
pkgdesc="DockBarX Theme"
arch=('any')
url="http://gnome-look.org/content/show.php/DockbarX+MacOSX+X?content=119808"
license=('GPL')
depends=('dockbarx')
groups=('dockbarx-themes')
source=('MacOSX.tar.gz::https://dl.opendesktop.org/api/files/download/id/1465391020/119808-MacOSX.tar.gz')
noextract=('MacOSX.tar.gz')
sha256sums=('20cc604f8009e4225b663bbaaec0df5c9e37da04f93c253aa10e30d2ee28fda4')

package () {
  install -D -m644 ${srcdir}/MacOSX.tar.gz ${pkgdir}/usr/share/dockbarx/themes/MacOSX.tar.gz
}
