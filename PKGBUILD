# Contributor: twa022 <twa022@gmail.com>

pkgname=dockbarx-glassified-theme
epoch=1
pkgver=20100327
pkgrel=1
pkgdesc="DockBarX Theme"
arch=('any')
url="https://www.gnome-look.org/p/1112514/"
license=('GPL')
depends=('dockbarx')
groups=('dockbarx-themes')
source=('Glassified.tar.gz::https://dl.opendesktop.org/api/files/download/id/1465383731/109283-glassified.tar.gz')
noextract=('Glassified.tar.gz')
sha256sums=('807cbb3594aaa1162b32ec17ee033333044681517e53a1cef067815084efb1dd')

package () {
  install -D -m644 "${srcdir}"/Glassified.tar.gz "${pkgdir}"/usr/share/dockbarx/themes/Glassified.tar.gz
}
