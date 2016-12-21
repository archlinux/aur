# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-glassified-theme
pkgver=20160608
pkgrel=1
pkgdesc="DockBarX Theme"
arch=('any')
url="https://www.gnome-look.org/p/1112514/"
license=('GPL')
depends=('dockbarx')
groups=('dockbarx-themes')
source=('Glassified.tar.gz::https://dl.opendesktop.org/api/files/download/id/1465383731/109283-glassified.tar.gz')
noextract=('Glassified.tar.gz')
sha256sums=('9ad77dd97cbb4760f2684fb9d6738e02b77c94a6e2444e4d75920fc522a5efe8')

package () {
  install -D -m644 ${srcdir}/Glassified.tar.gz ${pkgdir}/usr/share/dockbarx/themes/Glassified.tar.gz
}
