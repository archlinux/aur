# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=s5cmd-bin
pkgver=2.2.0
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
sha256sums_aarch64=('bc8c0eeef4270d6d7c1f2e4f220a3a705be7a12431745d5f49aeabea35dd32ec')
sha256sums_armv6h=('130d1449e1c93ff7a8123a2e719d0c0d2d20956898ca5600f14a7d252d3bbe5f')
sha256sums_armv7h=('bc8c0eeef4270d6d7c1f2e4f220a3a705be7a12431745d5f49aeabea35dd32ec')
sha256sums_i686=('565c64826a74071f1c1abef2d79d77786e28dc3182cc034bef75498670464a11')
sha256sums_x86_64=('4970cf369dcea8cc149729807403b7f5d350fe57ae7a936748f73f126fe7f6ad')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}