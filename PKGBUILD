# Maintainer: iamawacko <iamawacko@protonmail.com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=felix-bin
pkgver=3.21.2
pkgrel=1
pkgdesc="Project Calico's per-host agent, responsible for programming routes and security policy"
arch=('x86_64')
url="http://projectcalico.org/"
license=('Apache')
provides=('felix')
depends=('glibc')
source=("${pkgname}-${pkgver}::https://github.com/projectcalico/felix/releases/download/v${pkgver}/calico-felix-amd64")
sha256sums=('076936b985379fb8221db9b9a798714f6f97429a630da9c46da89bfcb0f84d81')

package() {
  install -Dm755 "${srcdir}"/felix* "${pkgdir}/usr/bin/felix"
}
# vim:set ts=2 sw=2 et:
