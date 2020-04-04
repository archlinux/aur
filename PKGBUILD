# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=gokit-cli-bin
pkgver=0.1.1
pkgrel=2
pkgdesc='The goal of the gokit cli is to be a tool that you can use while you develop your microservices with gokit'
arch=('x86_64')
url="https://github.com/kujtimiihoxha/kit"
license=('MIT')
provides=('gokit' 'gokit-cli')
source=("${url}/releases/download/v${pkgver}/kit_${pkgver}_Linux_x86_64.tar.gz")
md5sums=('730548d8733a12317661b9e0b945985e')

package() {
  install -Dm755 "${srcdir}"/kit "${pkgdir}/usr/bin/kit"
  install -Dm644 "${srcdir}"/LICENCE "${pkgdir}/usr/share/licenses/gokit/LICENSE"
}
# vim:set ts=2 sw=2 et: