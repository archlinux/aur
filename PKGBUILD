# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-macosx-theme
pkgver=1.0
pkgrel=3
pkgdesc="DockBarX Theme"
arch=('any')
url="https://www.gnome-look.org/content/show.php/DockbarX+MacOSX+X?content=119808"
license=('GPL')
depends=('dockbarx')
groups=('dockbarx-themes')
source=('MacOSX.tar.gz::https://www.gnome-look.org/p/1115217/startdownload?file_id=1465391020&file_name=119808-MacOSX.tar.gz&file_type=application/x-gzip&file_size=830&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownload%2Fid%2F1465391020%2Fs%2F3175db96b170ac54461f85808ae9ca21%2Ft%2F1535815998%2Fu%2F%2F119808-MacOSX.tar.gz')
#https://dl.opendesktop.org/api/files/download/id/1465391020/s/3175db96b170ac54461f85808ae9ca21/t/1535815998/u//119808-MacOSX.tar.gz
noextract=('MacOSX.tar.gz')
sha256sums=('20cc604f8009e4225b663bbaaec0df5c9e37da04f93c253aa10e30d2ee28fda4')

package () {
  install -D -m644 "${srcdir}"/MacOSX.tar.gz "${pkgdir}"/usr/share/dockbarx/themes/MacOSX.tar.gz
}
