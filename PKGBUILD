# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=fac-bin
pkgver=2.0.0
pkgrel=2
pkgdesc='Easy-to-use CUI for fixing git conflicts'
arch=('x86_64')
url="https://github.com/mkchoi212/fac"
license=('MIT')
provides=('fac')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mkchoi212/fac/releases/download/v${pkgver}/fac_${pkgver}_linux_amd64.tar.gz")
sha256sums=('91a58e84e0098a1eee45af950ee5cc80d30c083e2ab24cdbe79dd6be514775d9')

package() {
  install -Dm755 "${srcdir}"/fac "${pkgdir}/usr/bin/fac"
  install -Dm644 "${srcdir}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: