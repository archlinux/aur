# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=felix-bin
pkgver=3.16.5
pkgrel=1
pkgdesc="Project Calico's per-host agent, responsible for programming routes and security policy"
arch=('x86_64')
url="http://projectcalico.org/"
license=('Apache')
provides=('felix')
depends=('glibc')
source=("${pkgname}-${pkgver}::https://github.com/projectcalico/felix/releases/download/v${pkgver}/calico-felix-amd64")
sha256sums=('f47b46361b145e13cba40124310c48f2e0e230ccd7075c7fad312db255c1d4a2')

package() {
  install -Dm755 "${srcdir}"/felix* "${pkgdir}/usr/bin/felix"
}
# vim:set ts=2 sw=2 et:
