# Maintainer: nemesys <nemstar zoho com>
# Contributor: Dmytro Kostiuchenko <edio at archlinux.us>
# Contributor: Kurt J. Bosch <kjb-temp-2009 at alpenjodel.de>

_name=archax
pkgname=fbsplash-theme-${_name}
pkgver=0.2.5
pkgrel=1
pkgdesc="Simple and elegant theme for Fbsplash"
arch=('any')
license=('GPL')
_id=125311
url="http://opendesktop.org/content/show.php?content=${_id}"
depends=('fbsplash')
source=("${pkgname}-${pkgver}.tar.gz::http://sourceshark.com/sourcecode/khotnewstuff/bootsplashs/downloads/112346-archax.tar.gz")
package() {
    mkdir -p "${pkgdir}"/etc/splash &&
    cp -a "${srcdir}"/${_name} "${pkgdir}"/etc/splash/
}
md5sums=('8453af978c2dd796050aae15085af9de')
