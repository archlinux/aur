# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Ivan Petruk <localizator at ukr dot net>

pkgname=compass-icon-theme-kde
pkgver=1.3.7
pkgrel=1
pkgdesc="The alternative icon theme for the .nitrux Operating System"
url="http://nitrux.in/store/compass-for-kde/"
license=('cc-by-nc-nd-4.0')
arch=('any')
depends=('librsvg')
source=("http://nitrux.in/downloads/files/free/compass-icon-theme-kde-${pkgver}.tar.gz")
md5sums=('8b54ff1b57e817551cf728a94cfccec7')

package() {
  cd Compass

  install -dm 755 "${pkgdir}/usr/share/icons/Compass"
  cp -dr --no-preserve='ownership' * "${pkgdir}/usr/share/icons/Compass"

  install -Dm644 "${srcdir}/Compass/COPYING" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
