# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-plugin-apertium
pkgver=40280
pkgrel=1
pkgdesc="OmegaT plug-in that offers offline machine translation from Apertium"
arch=('any')
url="https://sourceforge.net/projects/apertium/"
license=('GPL')
depends=('omegat')
options=('!strip')
source=(https://svn.code.sf.net/p/apertium/svn/builds/apertium-omegat/apertium-omegat.jar)
sha256sums=('00416e878e93ad99d06985f37207727af9cde60ceb5a7e4d28a6606d2efea03a')

package() {
  cd "${srcdir}"

  install -Dm644 apertium-omegat.jar \
    "${pkgdir}"/usr/share/java/omegat/plugins/apertium/apertium-omegat.jar
}
