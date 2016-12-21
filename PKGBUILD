# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-deep-theme
pkgver=20160608
pkgrel=1
pkgdesc="DockBarX Theme"
arch=('any')
url="http://gnome-look.org/content/show.php/Deep+theme+for+DockbarX?content=135373"
license=('GPL')
depends=('dockbarx')
groups=('dockbarx-themes')
source=('deep.tar.gz::https://dl.opendesktop.org/api/files/download/id/1465391033/135373-Deep.tar.gz')
noextract=('deep.tar.gz')
sha256sums=('721443c5531406965f477765e503704159bf7b8aff5876635d6cd3fc128251a3')

package () {
  install -D -m644 ${srcdir}/deep.tar.gz ${pkgdir}/usr/share/dockbarx/themes/deep.tar.gz
}
