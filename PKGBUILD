# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=omegat-plugin-apertium
pkgver=84369
pkgrel=1
pkgdesc="OmegaT plug-in that offers offline machine translation from Apertium"
arch=('any')
url="https://sourceforge.net/projects/apertium/"
license=('GPL')
depends=('omegat')
options=('!strip')
source=(https://svn.code.sf.net/p/apertium/svn/builds/apertium-omegat/apertium-omegat.jar)
sha256sums=('47eb72d591d12de095d0635fcc8f9b48ce25fe6bbc2807b83aa0b40c1e37e9aa')

package() {
  cd "${srcdir}"

  install -Dm644 apertium-omegat.jar \
    "${pkgdir}"/usr/share/java/omegat/plugins/apertium/apertium-omegat.jar
}
