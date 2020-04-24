# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ostent-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Ostent is a server tool to collect, display and report system metrics"
arch=('x86_64')
url='https://github.com/ostrost/ostent'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${url}/releases/download/v${pkgver}/Linux-x86_64.tar.xz")
sha256sums=('52a7d7f1194156c4770b5341ed72c8bdff35af3e55b2a0ba9ae5eedb453677a9')

package() {
  install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
}