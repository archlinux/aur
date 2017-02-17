# Maintainer: Erik Dubois <erik.dubois@gmail.com>
# Put icons always in folder with version and release

pkgname=sardi-icons
pkgver=9.1
pkgrel=4
pkgdesc="Sardi is an icon collection for any linux distro with 6 different circular icons and 10 different kind of folders. "
arch=('any')
url="http://sourceforge.net/projects/sardi"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
makedepends=('git')
provides=('sardi-icons')
options=(!strip !emptydirs)
install='sardi-icons.install'
source=("http://downloads.sourceforge.net/project/sardi/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha256sums=('SKIP')

package() {

  install -dm 755 "${pkgdir}/usr/share/icons"
  cp -r ${srcdir}/* ${pkgdir}/usr/share/icons/
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}


