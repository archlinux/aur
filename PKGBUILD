# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ostent-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A server tool to collect, display and report system metrics"
arch=('x86_64')
url='https://github.com/ostrost/ostent'
license=('MIT')
provides=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/Linux-x86_64.tar.xz"
        'LICENSE::https://github.com/ostrost/ostent/raw/master/LICENSE')
sha256sums=('52a7d7f1194156c4770b5341ed72c8bdff35af3e55b2a0ba9ae5eedb453677a9'
            '96cc65c379ba8b777424727fa47071125aeb07530300252ed9b6085dd62cb3ae')

package() {
  install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" \
   "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}