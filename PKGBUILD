# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=felix-bin
pkgver=3.8.7
pkgrel=2
pkgdesc="Project Calico's per-host agent Felix, responsible for programming routes and security policy"
arch=('x86_64')
url="http://projectcalico.org/"
license=('Apache-2.0')
provides=('felix')
source=("https://github.com/projectcalico/felix/releases/download/v${pkgver}/calico-felix-amd64")
md5sums=('2da1799e684d9a887971c5c5cae08fd7')

package() {
  install -Dm755 "${srcdir}"/calico* "${pkgdir}/usr/bin/felix"
}
# vim:set ts=2 sw=2 et: