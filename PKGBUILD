# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-plugin-okapi
pkgver=0.26
pkgrel=1
pkgdesc="Additional file filters such as TTX, IDML, JSON, etc."
arch=('any')
url="http://okapi.opentag.com"
license=('LGPL3')
depends=('omegat')
options=('!strip')
source=(https://dl.bintray.com/okapi/Distribution/okapiFiltersForOmegaT-${pkgver}-dist.zip)
sha256sums=('2cce4ac4b52b446d7496143777ae11b67dd296a24d9beceb68e1c532eb0449c1')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/share/java/omegat/plugins/okapi
  cp -a okapiFiltersForOmegaT-0.26/* "${pkgdir}"/usr/share/java/omegat/plugins/okapi
}
