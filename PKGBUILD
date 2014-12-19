# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-plugin-okapi
pkgver=0.25
pkgrel=1
pkgdesc="Additional file filters such as TTX, IDML, JSON, etc."
arch=('any')
url="http://okapi.opentag.com"
license=('LGPL3')
depends=('omegat')
options=('!strip')
source=(https://bintray.com/artifact/download/okapi/Distribution/okapi-pluginForOmegaT_all-platforms_${pkgver}.zip)
sha256sums=('fbf6e57b04f0e76681ad3bb9eea5a5a526c5573008308d38998cc6bb20453b52')

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/share/java/omegat/plugins
  cp -r okapi "${pkgdir}"/usr/share/java/omegat/plugins
}
