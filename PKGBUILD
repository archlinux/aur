# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gobetween-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Modern & minimalistic load balancer for the Сloud era'
arch=('x86_64')
url="http://gobetween.io"
license=('MIT')
provides=('gobetween')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yyyar/gobetween/releases/download/${pkgver}/gobetween_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4f2beec70858abb2064bba1d886db30e9969210df6ab31c1f476ef8dcd8f4f3f')

package() {
  install -Dm755 "${srcdir}"/gobetween -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}"/config/gobetween.toml -t "${pkgdir}/etc/conf.d"
}
# vim:set ts=2 sw=2 et: