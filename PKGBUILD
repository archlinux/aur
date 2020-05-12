# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gokit-cli-bin
pkgver=0.1.1
pkgrel=2
pkgdesc='The goal of the gokit cli is to be a tool that you can use while you develop your microservices with gokit'
arch=('x86_64')
url="https://github.com/kujtimiihoxha/kit"
license=('MIT')
provides=('gokit' 'gokit-cli')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/kit_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('651dd22917db7bea23d859cd2800ef5b6080a260039234323e72e08e1025639f')

package() {
  install -Dm755 "${srcdir}"/kit "${pkgdir}/usr/bin/kit"
  install -Dm644 "${srcdir}"/LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: