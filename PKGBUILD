# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gobetween-bin
pkgver=0.7.0
pkgrel=2
pkgdesc='Modern & minimalistic load balancer for the Сloud era'
arch=('x86_64')
url="http://gobetween.io"
license=('MIT')
provides=('gobetween')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yyyar/gobetween/releases/download/${pkgver}/gobetween_${pkgver}_linux_amd64.tar.gz")
sha256sums=('41c8f4eef0d2c5646d253caa55d14992cbb539c1ed2478a6bced415dd72f4171')

package() {
  install -Dm755 "${srcdir}"/gobetween -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}"/config/gobetween.toml -t "${pkgdir}/etc/conf.d"
}
# vim:set ts=2 sw=2 et: