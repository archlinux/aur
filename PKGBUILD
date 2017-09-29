# Maintainer: Alif Rachmawadi <arch@subosito.com>

pkgname=gem_home
pkgver=0.1.0
pkgrel=1
pkgdesc='A tools for changing your $GEM_HOME'
arch=('i686' 'x86_64')
url="https://github.com/postmodern/gem_home"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=("67e9e174de42de640f144f88cd16b2a315bdec55567467743f8fbb96cba14e4e")

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PREFIX="${pkgdir}/usr" make install
}
