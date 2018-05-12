# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-plugin-okapi
pkgver=1.4
pkgrel=1
pkgdesc="Additional file filters such as TTX, IDML, JSON, etc."
arch=('any')
url="http://okapi.opentag.com"
license=('LGPL3')
depends=('omegat')
options=('!strip')
source=(https://dl.bintray.com/okapi/Distribution/okapiFiltersForOmegaT-${pkgver}-m33-dist.zip)
sha256sums=('44fbdd3dd0c475639f8e9a83b62a98b74025d5ab1031554cec608b4193384914')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/share/java/omegat/plugins/okapi
  cp -a okapiFiltersForOmegaT-${pkgver}-m33/* "${pkgdir}"/usr/share/java/omegat/plugins/okapi
}
