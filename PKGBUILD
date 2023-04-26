# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Tony Fettes <tonyfettes@tonyfettes.tk>
pkgname=tunasync-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="Mirror job management tool developed by TUNA"
arch=('x86_64')
url="https://github.com/tuna/tunasync"
license=('GPL3')
depends=('glibc')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-linux-amd64-bin.tar.gz")
sha256sums=('6d7481f50438e704e78322e754d2e5cd3c34dfe4d1d3a3f12d332237759f79bd')

package() {
  install -Dm755 "${srcdir}/tunasync" -t "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/tunasynctl" -t "${pkgdir}/usr/bin"
}