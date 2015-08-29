# Contributor: Temhil and Frost
# Maintainer: Aaron Ali <t0nedef@causal.ca>
pkgname=kodi-addon-repo-installer
pkgver=1.0.5
pkgrel=5
pkgdesc="Allows installation of unofficial KODI addon repositories (from KODI wiki)"
arch=('any')
url="http://kodi-passion.fr/index.php"
license=('GPL')
depends=('kodi')
install=install
makedepends=('unzip')
source=('http://passion-xbmc.org/addons/Download.php/plugin.program.repo.installer/plugin.program.repo.installer-'$pkgver'.zip')
replaces=(xbmc-addon-repo-installer)
package() {
	mkdir -p ${pkgdir}/usr/share/kodi/addons
	unzip ${srcdir}/plugin.program.repo.installer-${pkgver}.zip -d ${pkgdir}/usr/share/kodi/addons
}
#
md5sums=('15e810a733fbf14d77b53301739a9f70')
