# Maintainer: Dmytro Kostiuchenko <edio at archlinux.us>
# Contributor: Kurt J. Bosch <kjb-temp-2009 at alpenjodel.de>

_name=arch-elegant
pkgname=fbsplash-theme-${_name}
pkgver=0.2.5
pkgrel=1
pkgdesc="Simple and elegant theme for Fbsplash"
arch=('any')
license=('GPL')
_id=125311
url="http://opendesktop.org/content/show.php?content=${_id}"
depends=('fbsplash')
source=("${pkgname}-${pkgver}.tar.gz::http://opendesktop.org/CONTENT/content-files/${_id}-${_name}.tar.gz")
package() {
    mkdir -p "${pkgdir}"/etc/splash &&
    cp -a "${srcdir}"/${_name} "${pkgdir}"/etc/splash/
}
md5sums=('eb5e384b19e64e1d7ead978bbd14d43c')
