# Maintainer: Zack Whipkey <zack.whipkey@gmail.com>
pkgname=gsca-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='Global Steam Command Args - CLI tool to manage Steam game launch options'
arch=('x86_64' 'aarch64')
url="https://github.com/zerkz/gsca"
license=('MIT')
provides=('gsca')
conflicts=('gsca')
source_x86_64=("${url}/releases/download/v${pkgver}/gsca_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/gsca_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  install -Dm755 "gsca" "${pkgdir}/usr/bin/gsca"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/gsca/LICENSE"
}
