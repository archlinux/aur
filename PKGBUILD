# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-plugin-okapi
pkgver=1.9
pkgrel=1
pkgdesc="Additional file filters such as TTX, IDML, JSON, etc."
arch=('any')
url="http://okapi.opentag.com"
license=('LGPL3')
depends=('omegat')
options=('!strip')
source=(https://okapiframework.org/binaries/omegat-plugin/okapiFiltersForOmegaT-1.9-1.41.0-dist.zip)
sha256sums=('a52de0b87152787e8cbc2118809fd2c37da5051a3bb798bd4da56243bc7d4611')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/share/java/omegat/plugins/okapi
  cp -a okapiFiltersForOmegaT-${pkgver}-1.41.0/* "${pkgdir}"/usr/share/java/omegat/plugins/okapi
}
