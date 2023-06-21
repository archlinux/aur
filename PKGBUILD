# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=s5cmd-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Parallel S3 and local filesystem execution tool"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/peak/s5cmd'
license=('MIT')
provides=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-arm64.tar.gz")
source_armv6h=("${pkgname%-bin}-${pkgver}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-armv6.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-32bit.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux-64bit.tar.gz")
sha256sums_aarch64=('6eef03a90853fb0ad12237e912031af033b3312e4d340c0e40923a991e988142')
sha256sums_armv6h=('7d351296e28999321a6d1325118dc448e7a099964d312363005e48be984c1aff')
sha256sums_armv7h=('6eef03a90853fb0ad12237e912031af033b3312e4d340c0e40923a991e988142')
sha256sums_i686=('25b1ca8ce9afbc20481605c24c526813dafab3c16bbd7f9ab33cb6fc6b2e850a')
sha256sums_x86_64=('5f3e6abbb0d71fba1cf2c7884635828af3d151c4795d0d1827f623e2f52bfab0')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}