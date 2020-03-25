# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=surfn-arc-breeze-icons-git
pkgver=20.3
pkgrel=6
_destname="/usr/share/icons/"
pkgdesc="Surfn Arc Breeze icons are created to be used on Plasma with dark toolbar"
arch=('any')
url="https://github.com/erikdubois/surfn-arc-breeze"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
depends=('breeze-icons')
options=(!strip !emptydirs)
source=('Surfn::git+https://github.com/erikdubois/surfn-arc-breeze')
package() {
  find ${srcdir}/Surfn/surfn-icons -type f -name "*.sh" -exec chmod 644 '{}' \;
  install -dm 755 ${pkgdir}${_destname}
  cp -r ${srcdir}/Surfn/surfn-icons/* ${pkgdir}${_destname}
}
md5sums=('SKIP')
