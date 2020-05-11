# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=felix-bin
pkgver=3.14.0
pkgrel=1
pkgdesc="Project Calico's per-host agent, responsible for programming routes and security policy"
arch=('x86_64')
url="http://projectcalico.org/"
license=('Apache')
provides=('felix')
depends=('glibc')
source=("${pkgname}-${pkgver}::https://github.com/projectcalico/felix/releases/download/v${pkgver}/calico-felix-amd64")
sha256sums=('4a06a275ffb9c0ac62d0133c6319db43c6aa682a1fdbeba8f49619c1ff6c8c53')

package() {
  install -Dm755 "${srcdir}"/felix* "${pkgdir}/usr/bin/felix"
}
# vim:set ts=2 sw=2 et: