# Maintainer: Maddie Zhan <maddie at zzz dot cat>
pkgname=librespeed-cli-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Command line interface for LibreSpeed speed test backends"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/librespeed/speedtest-cli"
license=('LGPL3')
provides=('librespeed-cli')
conflicts=('librespeed-cli')

source_x86_64=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}-linux-arm64.tar.gz")
source_armv7h=("https://github.com/librespeed/speedtest-cli/releases/download/v${pkgver}/${pkgname/-bin/}-linux-armv7.tar.gz")

sha256sums_x86_64=('573983a5a565a6f06739c78a7e5b8b953a0ef391ba56824f5e69a6044195aaf9')
sha256sums_aarch64=('805b74ad4ea88c2df21f111e53bce9dd6f67e4e4807488af2cbe2e59ba6a7a13')
sha256sums_armv7h=('eb13996627f904cc795f7bcf1f55d0a4f631c5118bb210a09c5bb2bdb201b4df')

package() {
  install -Dm755 "${srcdir}/${pkgname/-bin}" "${pkgdir}/usr/bin/${pkgname/-bin}"
}
